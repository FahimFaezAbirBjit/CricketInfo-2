// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let data: [Datum]?
    let links: Links?
    let meta: Meta?
}

// MARK: - Datum
struct Datum: Codable {
    let resource: DatumResource?
    let id: Int?
    let startingAt: String?
    let localteam, visitorteam: Team?
    let runs: [Run]?
    let venue: Venue?
    let stage: Stage?
}

// MARK: - Team
struct Team: Codable {
    let resource: LocalteamResource?
    let id: Int?
    let name, code: String?
    let imagePath: String?
    let countryID: Int?
    let nationalTeam: Bool?
    let updatedAt: LocalteamUpdatedAt?
    let country: Country?
}

// MARK: - Country
struct Country: Codable {
    let resource: CountryResource?
    let id, continentID: Int?
    let name: CountryName?
    let imagePath: String?
    let updatedAt: CountryUpdatedAt?
}

enum CountryName: String,Codable{
    case australia
    case international
}

enum CountryResource: String,Codable {
    case countries
}

enum CountryUpdatedAt: String,Codable {
    case the20170407T181226000000Z
}

enum LocalteamResource: String,Codable {
    case teams
}

enum LocalteamUpdatedAt: String,Codable {
    case the20181129T114720000000Z
    case the20190208T112203000000Z
    case the20190617T144503000000Z
    case the20190831T122009000000Z
    case the20190831T123206000000Z
    case the20191209T064502000000Z
    case the20191219T122602000000Z
    case the20221213T104100000000Z
    case the20221213T104107000000Z
}

enum DatumResource: String,Codable {
    case fixtures
}

// MARK: - Run
struct Run: Codable {
    let resource: RunResource?
    let id, fixtureID, teamID, inning: Int?
    let score, wickets: Int?
    let overs: Double?
    let pp1: Pp1?
    let pp2: String?
    //let pp3: NSNull?
    let updatedAt: String?
}

enum Pp1: String,Codable {
    case the12
    case the14
    case the16
}

enum RunResource: String,Codable {
    case runs
}

// MARK: - Stage
struct Stage: Codable {
    let resource: StageResource?
    let id, leagueID, seasonID: Int?
    let name: StageName?
    let code: Code?
    let type: TypeEnum?
    let standings: Bool?
    let updatedAt: StageUpdatedAt?
}

enum Code: String,Codable {
    case iz
    case nzi
    case po
    case rs
    case sli
}

enum StageName: String,Codable {
    case irelandTourOfZimbabwe
    case newZealandTourOfIndia
    case playOffs
    case regularSeason
    case sriLankaTourOfIndia
}

enum StageResource: String,Codable {
    case stages
}

enum TypeEnum: String,Codable {
    case league
}

enum StageUpdatedAt: String,Codable {
    case the20220708T201538000000Z
    case the20220708T201551000000Z
    case the20221211T101250000000Z
    case the20221211T101956000000Z
    case the20221211T102712000000Z
}

// MARK: - Venue
struct Venue: Codable {
    let resource: VenueResource?
    let id, countryID: Int?
    let name, city: String?
    let imagePath: String?
    let capacity: Int?
    let floodlight: Bool?
    let updatedAt: String?
}

enum VenueResource: String,Codable {
    case venues
}

// MARK: - Links
struct Links: Codable {
    let first, last: String?
    //let prev, next: NSNull?
}

// MARK: - Meta
struct Meta: Codable {
    let currentPage, from, lastPage: Int?
    let links: [Link]?
    let path: String?
    let perPage, to, total: Int?
}

// MARK: - Link
struct Link: Codable {
    let url: String?
    let label: String?
    let active: Bool?
}
