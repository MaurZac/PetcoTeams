//
//  FootBallView.swift
//  PetcoTeams
//
//  Created by MaurZac on 25/01/25.
//

import SwiftUI

struct FootBallView: View {
    @StateObject private var viewModel = FootballViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading == .loading {
                    ProgressView("Loading standings...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                } else {
                    FootballTableView(standings: viewModel.standings)
                }
            }
            .padding(.horizontal, 8)
            .padding(.top, 8)
            .navigationTitle("Football Standings")
            .onAppear {
                viewModel.fetchStandings(leagueID: "4328", season: "2020-2021")
            }
        }
    }
}

    
#Preview {
    FootBallView()
}
