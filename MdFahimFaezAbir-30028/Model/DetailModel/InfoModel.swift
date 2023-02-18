// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct InfoModel: Codable {
    var data: InfoData?
}

// MARK: - Datum
struct InfoData: Codable {
    var resource: String?
    var id: Int?
    var round: String?
    var startingAt: String?
    var live: Bool?
    var status: String?
    var elected: String?
    var league, localteam, visitorteam: League?
    var referee, firstumpire, secondumpire, tvumpire: Firstumpire?
    var tosswon: League?
    var venue: Venue?
    var stage: League?

    enum CodingKeys: String, CodingKey {
        case resource, id, round
        case startingAt = "starting_at"
        case live, status, elected
        //case weatherReport = "weather_report"
        case league, localteam, visitorteam, referee, firstumpire, secondumpire, tvumpire, tosswon, venue, stage
    }
}



// MARK: - Umpire
struct Firstumpire: Codable {
    var resource: String?
    var id, countryID: Int?
    var firstname, lastname, fullname, dateofbirth: String?
    var gender: String?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case resource, id
        case countryID = "country_id"
        case firstname, lastname, fullname, dateofbirth, gender
        case updatedAt = "updated_at"
    }
}


// MARK: - League
struct League: Codable {
    var resource: String?
    var id, seasonID, countryID: Int?
    var name, code: String?
    var imagePath: String?
    var type: String?
    var updatedAt: String?
    var nationalTeam: Bool?
    var country: InfoCountry?
    var leagueID: Int?
    var standings: Bool?

    enum CodingKeys: String, CodingKey {
        case resource, id
        case seasonID = "season_id"
        case countryID = "country_id"
        case name, code
        case imagePath = "image_path"
        case type
        case updatedAt = "updated_at"
        case nationalTeam = "national_team"
        case country
        case leagueID = "league_id"
        case standings
    }
}

// MARK: - Country
struct InfoCountry: Codable {
    var resource: String?
    var id, continentID: Int?
    var name: String?
    var imagePath: String?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case resource, id
        case continentID = "continent_id"
        case name
        case imagePath = "image_path"
        case updatedAt = "updated_at"
    }
}

// MARK: - Venue
struct InfoVenue: Codable {
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
