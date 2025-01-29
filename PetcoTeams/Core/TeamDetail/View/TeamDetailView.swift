//
//  TeamDetailView.swift
//  PetcoTeams
//
//  Created by MaurZac on 26/01/25.
//
import SwiftUI

struct TeamDetailView: View {
    let teamName: String
    @StateObject private var viewModel = TeamDetailViewModel()
    var body: some View {
        VStack {
            if viewModel.isLoading == .loading {
                ProgressView("Loading team details...")
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            } else if let team = viewModel.teamDetail {
                VStack {
                    AsyncImage(url: URL(string: team.strBadge)) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 100, height: 100)
                    Text(team.strTeam)
                        .font(.title)
                        .bold()
                    Text(team.strStadium)
                        .font(.headline)
                    Text(team.strDescriptionEN ?? "")
                        .font(.body)
                        .padding()
                    Text("Founded: \(team.intFormedYear)")
                    Text("Country: \(team.strCountry)")
                    Text("Website: \(team.strWebsite)")
                }
            }
        }
        .padding()
        .navigationTitle(teamName)
        .onAppear {
            Task {
                await viewModel.fetchTeamDetails(teamName: teamName)
            }
        }
    }
}


#Preview {
    TeamDetailView(teamName: "FC Barcelona")
}

