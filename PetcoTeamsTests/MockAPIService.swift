//
//  MockAPIService.swift
//  PetcoTeams
//
//  Created by MaurZac on 28/01/25.
//
import XCTest
@testable import PetcoTeams

protocol TeamServiceProtocol {
    func fetchTeamDetails(teamID: String, completion: @escaping (Result<Team, Error>) -> Void)
}

class MockAPIService: APIService {
    override func fetchStandings(leagueID: String, season: String) async throws -> Football {
        return Football(table: [
            TeamStanding(
                standingID: "1",
                rank: 1,
                teamID: "133604",
                teamName: "Liverpool",
                badgeURL: "https://www.example.com/badge.png",
                leagueID: "4328",
                leagueName: "Premier League",
                season: "2024-2025",
                form: "WWLWD",
                description: "Top team",
                gamesPlayed: 20,
                wins: 15,
                losses: 2,
                draws: 3,
                goalsFor: 45,
                goalsAgainst: 20,
                goalDifference: 25,
                points: 48,
                lastUpdated: Date()
            )
        ])
    }
}

