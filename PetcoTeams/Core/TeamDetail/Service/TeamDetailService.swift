//
//  TeamDetailService.swift
//  PetcoTeams
//
//  Created by MaurZac on 26/01/25.
//
import Foundation

// Función de fetch
func fetchTeamDetailsFromService(teamName: String) async throws -> Team {
    let urlString = "https://www.thesportsdb.com/api/v1/json/3/searchteams.php?t=\(teamName)"
    guard let url = URL(string: urlString) else {
        throw URLError(.badURL)
    }
    print("Fetching URL: \(url)")

    do {
        let (data, _) = try await URLSession.shared.data(from: url)

        if let response = String(data: data, encoding: .utf8) {
            print("Response data: \(response)")
        }

        let decodedResponse = try JSONDecoder().decode(TeamDetailResponse.self, from: data)

        guard let team = decodedResponse.teams.first else {
            throw NSError(domain: "Team not found", code: 0, userInfo: nil)
        }

        return team
    } catch {
        print("Error fetching data: \(error)")
        throw error
    }
}




