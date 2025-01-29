//
//  FootBallService.swift
//  PetcoTeams
//
//  Created by MaurZac on 26/01/25.
//
import Foundation

protocol APIServiceProtocol {
    func fetchStandings(leagueID: String, season: String) async throws -> Football
}

class APIService: APIServiceProtocol {
    static let shared = APIService()
    init() {}
    
    func fetchStandings(leagueID: String, season: String) async throws -> Football {
        let urlString = "https://www.thesportsdb.com/api/v1/json/3/lookuptable.php?l=\(leagueID)&s=\(season)"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(Football.self, from: data)
    }
}
