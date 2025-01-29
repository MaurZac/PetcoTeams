//
//  FootBallTableView.swift
//  PetcoTeams
//
//  Created by MaurZac on 28/01/25.
//
import SwiftUI

// MARK: - Vista de la Tabla
struct FootballTableView: View {
    var standings: [TeamStanding]
    @StateObject var viewModelDetail = TeamDetailViewModel()

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 8) {
                // Header
                TableHeaderView()
                ForEach(standings) { team in
                    TeamRowView(team: team)
                }
            }
            .padding(.bottom, 8)
        }
    }
}

