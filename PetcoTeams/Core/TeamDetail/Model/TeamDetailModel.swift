//
//  TeamDetailModel.swift
//  PetcoTeams
//
//  Created by MaurZac on 26/01/25.
//
import Foundation

// Model for the response JSON
struct TeamDetailResponse: Codable {
    let teams: [Team]
}

// Model
struct Team: Codable {
    let idTeam: String
    let idESPN: String
    let idAPIfootball: String
    let intLoved: String
    let strTeam: String
    let strTeamAlternate: String
    let strTeamShort: String
    let intFormedYear: String
    let strSport: String
    let strLeague: String
    let idLeague: String
    let strLeague2: String
    let idLeague2: String
    let strLeague3: String
    let idLeague3: String
    let strLeague4: String
    let idLeague4: String
    let strLeague5: String?
    let idLeague5: String?
    let strLeague6: String?
    let idLeague6: String?
    let strLeague7: String?
    let idLeague7: String?
    let strDivision: String?
    let idVenue: String
    let strStadium: String
    let strKeywords: String
    let strRSS: String
    let strLocation: String
    let intStadiumCapacity: String
    let strWebsite: String
    let strFacebook: String
    let strTwitter: String
    let strInstagram: String
    let strDescriptionEN: String?
    let strDescriptionDE: String?
    let strDescriptionFR: String?
    let strDescriptionCN: String?
    let strDescriptionIT: String?
    let strDescriptionJP: String?
    let strDescriptionRU: String?
    let strDescriptionES: String?
    let strDescriptionPT: String?
    let strDescriptionSE: String?
    let strDescriptionNL: String?
    let strDescriptionHU: String?
    let strDescriptionNO: String?
    let strDescriptionIL: String?
    let strDescriptionPL: String?
    let strColour1: String
    let strColour2: String
    let strColour3: String?
    let strGender: String
    let strCountry: String
    let strBadge: String
    let strLogo: String
    let strFanart1: String
    let strFanart2: String
    let strFanart3: String
    let strFanart4: String
    let strBanner: String
    let strEquipment: String
    let strYoutube: String
    let strLocked: String
}
