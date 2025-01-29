//
//  TeamDetailViewModel.swift
//  PetcoTeams
//
//  Created by MaurZac on 27/01/25.
//
import Foundation

@MainActor
class TeamDetailViewModel: ObservableObject {
    @Published var teamDetail: Team?
    @Published var isLoading: ContentLoadingState = .loading
    @Published var errorMessage: String?

    
    func fetchTeamDetails(teamName: String) async {
        isLoading = .complete
        errorMessage = nil

        do {
           
            let team = try await fetchTeamDetailsFromService(teamName: teamName)
            
            print(team)
            self.teamDetail = team
            
        } catch {
            errorMessage = "There was an issue fetching the team details. Please try again."
        }
        
        isLoading = .error
    }
}













