//
//  SquadModel.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 22/2/23.
//
struct SquadModel: Codable {
    var data: SquadData?
}

// MARK: - DataClass
struct SquadData: Codable {
    var resource: String?
    var id, localteamID, visitorteamID: Int?
    var startingAt: String?
    var status: String?
    var localteam, visitorteam: SquadTeam?
    var lineup: [LineupElement]?

    enum CodingKeys: String, CodingKey {
        case resource, id
        case localteamID = "localteam_id"
        case visitorteamID = "visitorteam_id"
        case startingAt = "starting_at"
        case status
        case localteam, visitorteam, lineup
    }
}

// MARK: - LineupElement
struct LineupElement: Codable {
    var resource: String?
    var id, countryID: Int?
    var firstname, lastname, fullname: String?
    var imagePath: String?
    var dateofbirth: String?
    var gender: String?
    var battingstyle: String?
    var bowlingstyle: String?
    var position: SquadPosition?
    var updatedAt: String?
    var lineup: LineupLineup?

    enum CodingKeys: String, CodingKey {
        case resource, id
        case countryID = "country_id"
        case firstname, lastname, fullname
        case imagePath = "image_path"
        case dateofbirth, gender, battingstyle, bowlingstyle, position
        case updatedAt = "updated_at"
        case lineup
    }
}

// MARK: - LineupLineup
struct LineupLineup: Codable {
    var teamID: Int?
    var captain, wicketkeeper, substitution: Bool?

    enum CodingKeys: String, CodingKey {
        case teamID = "team_id"
        case captain, wicketkeeper, substitution
    }
}

// MARK: - Position
struct SquadPosition: Codable {
    var resource: String?
    var id: Int?
    var name: String?
}

// MARK: - Team
struct SquadTeam: Codable {
    var resource: String?
    var id: Int?
    var name, code: String?
    var imagePath: String?
    var countryID: Int?
    var nationalTeam: Bool?
    var updatedAt: String?
    var country: SquadCountry?

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
struct SquadCountry: Codable {
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
