//
//  FootBallViewModel.swift
//  PetcoTeams
//
//  Created by MaurZac on 26/01/25.
//
import Foundation

@MainActor
class FootballViewModel: ObservableObject {
    @Published var standings: [TeamStanding] = [] 
    @Published var selectedTeam: TeamDetailResponse? = nil
    @Published var isLoading: ContentLoadingState = .complete
    @Published var errorMessage: String? = nil

    private let apiService = APIService.shared

    func fetchStandings(leagueID: String, season: String) {
        Task {
            isLoading = .loading
            errorMessage = nil

            do {
                let football = try await apiService.fetchStandings(leagueID: leagueID, season: season)
                standings = football.table
            } catch {
                errorMessage = error.localizedDescription
                print(error.localizedDescription)
            }

            isLoading = .error
        }
    }

//    func fetchTeamDetails(teamName: String) {
//        Task {
//            isLoading = true
//            errorMessage = nil
//
//            do {
//                let team = try await apiService.fetchTeamDetails(teamName: teamName)
//                selectedTeam = team
//            } catch {
//                errorMessage = error.localizedDescription
//            }
//
//            isLoading = false
//        }
//    }
}
