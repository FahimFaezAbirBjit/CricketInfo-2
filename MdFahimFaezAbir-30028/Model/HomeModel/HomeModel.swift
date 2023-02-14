// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    var data: [Datum]?
    var links: Links?
    var meta: Meta?
}

// MARK: - Datum
struct Datum: Codable {
    var resource: String?
    var id: Int?
    var round, startingAt: String?
    var live: Bool?
    var status: String?
    var note: String?
    //var weatherReport: [JSONAny]?
    var localteam, visitorteam: Team?
    var runs: [Run]?
    var venue: Venue?
    var stage: Stage?

    enum CodingKeys: String, CodingKey {
        case resource, id, round
        case startingAt = "starting_at"
        case live, status,note
        //case weatherReport = "weather_report"
        case localteam, visitorteam, runs, venue, stage
    }
}

// MARK: - Team
struct Team: Codable {
    var resource: String?
    var id: Int?
    var name, code: String?
    var imagePath: String?
    var countryID: Int?
    var nationalTeam: Bool?
    var updatedAt: String?
    var country: Country?

    enum CodingKeys: String, CodingKey {
        case resource, id, name, code
        case imagePath = "image_path"
        case countryID = "country_id"
        case nationalTeam = "national_team"
        case updatedAt = "updated_at"
        case country
    }
}

// MARK: - Country
struct Country: Codable {
    var resource: String?
    var id, continentID: Int?
    var name: String?
    var imagePath: String?
    //var updatedAt: JSONNull?

    enum CodingKeys: String, CodingKey {
        case resource, id
        case continentID = "continent_id"
        case name
        case imagePath = "image_path"
        //case updatedAt = "updated_at"
    }
}

// MARK: - Run
struct Run: Codable {
    var resource: String?
    var id, fixtureID, teamID, inning: Int?
    var score, wickets: Int?
    var overs: Double?
    var pp1: String?
    var pp2: String?
    //var pp3: JSONNull?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case resource, id
        case fixtureID = "fixture_id"
        case teamID = "team_id"
        case inning, score, wickets, overs, pp1, pp2
       // case pp3
        case updatedAt = "updated_at"
    }
}

// MARK: - Stage
struct Stage: Codable {
    var resource: String?
    var id, leagueID, seasonID: Int?
    var name, code, type: String?
    var standings: Bool?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case resource, id
        case leagueID = "league_id"
        case seasonID = "season_id"
        case name, code, type, standings
        case updatedAt = "updated_at"
    }
}

// MARK: - Venue
struct Venue: Codable {
    var resource: String?
    var id, countryID: Int?
    var name, city: String?
    var imagePath: String?
    var capacity: Int?
    var floodlight: Bool?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case resource, id
        case countryID = "country_id"
        case name, city
        case imagePath = "image_path"
        case capacity, floodlight
        case updatedAt = "updated_at"
    }
}

// MARK: - Links
struct Links: Codable {
    var first, last: String?
    //var prev, next: JSONNull?
}

// MARK: - Meta
struct Meta: Codable {
    var currentPage, from, lastPage: Int?
    var links: [Link]?
    var path: String?
    var perPage, to, total: Int?

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case from
        case lastPage = "last_page"
        case links, path
        case perPage = "per_page"
        case to, total
    }
}

// MARK: - Link
struct Link: Codable {
    var url: String?
    var label: String?
    var active: Bool?
}

