//
//  FootBallModel.swift
//  PetcoTeams
//
//  Created by MaurZac on 26/01/25.
//
import Foundation

// MARK: - Football
struct Football: Codable {
    let table: [TeamStanding]
}

// MARK: - TeamStanding
struct TeamStanding: Codable, Identifiable {
    let standingID: String
    let rank: Int
    let teamID: String
    let teamName: String
    let badgeURL: String
    let leagueID: String
    let leagueName: String
    let season: String
    let form: String
    let description: String
    let gamesPlayed: Int
    let wins: Int
    let losses: Int
    let draws: Int
    let goalsFor: Int
    let goalsAgainst: Int
    let goalDifference: Int
    let points: Int
    let lastUpdated: Date

    // Propiedad Identifiable
    var id: String { teamID }
}

// MARK: - Custom Decoding Keys
extension TeamStanding {
    private enum CodingKeys: String, CodingKey {
        case standingID = "idStanding"
        case rank = "intRank"
        case teamID = "idTeam"
        case teamName = "strTeam"
        case badgeURL = "strBadge"
        case leagueID = "idLeague"
        case leagueName = "strLeague"
        case season = "strSeason"
        case form = "strForm"
        case description = "strDescription"
        case gamesPlayed = "intPlayed"
        case wins = "intWin"
        case losses = "intLoss"
        case draws = "intDraw"
        case goalsFor = "intGoalsFor"
        case goalsAgainst = "intGoalsAgainst"
        case goalDifference = "intGoalDifference"
        case points = "intPoints"
        case lastUpdated = "dateUpdated"
    }
}

extension TeamStanding {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        standingID = try container.decode(String.self, forKey: .standingID)
        rank = Int(try container.decode(String.self, forKey: .rank)) ?? 0
        teamID = try container.decode(String.self, forKey: .teamID)
        teamName = try container.decode(String.self, forKey: .teamName)
        badgeURL = try container.decode(String.self, forKey: .badgeURL)
        leagueID = try container.decode(String.self, forKey: .leagueID)
        leagueName = try container.decode(String.self, forKey: .leagueName)
        season = try container.decode(String.self, forKey: .season)
        form = try container.decode(String.self, forKey: .form)
        description = try container.decode(String.self, forKey: .description)
        gamesPlayed = Int(try container.decode(String.self, forKey: .gamesPlayed)) ?? 0
        wins = Int(try container.decode(String.self, forKey: .wins)) ?? 0
        losses = Int(try container.decode(String.self, forKey: .losses)) ?? 0
        draws = Int(try container.decode(String.self, forKey: .draws)) ?? 0
        goalsFor = Int(try container.decode(String.self, forKey: .goalsFor)) ?? 0
        goalsAgainst = Int(try container.decode(String.self, forKey: .goalsAgainst)) ?? 0
        goalDifference = Int(try container.decode(String.self, forKey: .goalDifference)) ?? 0
        points = Int(try container.decode(String.self, forKey: .points)) ?? 0

        let dateString = try container.decode(String.self, forKey: .lastUpdated)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        lastUpdated = formatter.date(from: dateString) ?? Date()
    }
}
