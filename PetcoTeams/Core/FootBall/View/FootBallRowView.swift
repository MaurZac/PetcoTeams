//
//  FootBallRowView.swift
//  PetcoTeams
//
//  Created by MaurZac on 28/01/25.
//
import SwiftUI

// MARK: - Fila de un Equipo
struct TeamRowView: View {
    let team: TeamStanding

    var body: some View {
        NavigationLink(destination: TeamDetailView(teamName: team.teamName)) {
            HStack {
                Text("\(team.rank)")
                    .frame(width: 30, alignment: .center)

                HStack {
                    AsyncImage(url: URL(string: team.badgeURL)) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 30, height: 30)

                    Text(team.teamName)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                }
                .frame(width: 100, alignment: .leading)

                Text("\(team.gamesPlayed)").frame(width: 30, alignment: .center)
                Text("\(team.wins)").frame(width: 30, alignment: .center)
                Text("\(team.draws)").frame(width: 30, alignment: .center)
                Text("\(team.losses)").frame(width: 30, alignment: .center)
                Text("\(team.points)").bold().frame(width: 40, alignment: .center)
            }
            .padding(.vertical, 8)
            .background(Color.white)
            .cornerRadius(8)
            .shadow(color: Color.gray.opacity(0.2), radius: 2, x: 0, y: 1)
        }
    }
}
