//
//  ScoreCardModel.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 19/2/23.
//

import Foundation
struct ScoreCardModel: Codable {
    var data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    var resource: String?
    var id, leagueID, seasonID, stageID: Int?
    var round: String?
    var localteamID, visitorteamID: Int?
    var startingAt: String?
    var type: String?
    var live: Bool?
    var status: String?
    var note: String?
    var venueID, tossWonTeamID, winnerTeamID: Int?
    var firstUmpireID, secondUmpireID, tvUmpireID, refereeID: Int?
    var manOfMatchID, manOfSeriesID, totalOversPlayed: Int?
    var elected: String?
    var superOver, followOn: Bool?
   // var localteamDLData, visitorteamDLData: TeamDLData?
    var league, localteam, visitorteam:  ScoreCardLeague?
    var batting: [Batting]?
    var bowling: [Bowling]?
    var runs: [ScoreCardRun]?
    var scoreboards: [ScoreboardElement]?
    var manofmatch: Manofmatch?
    var manofseries: Manofmatch?
    var tosswon, stage: ScoreCardLeague?

    enum CodingKeys: String, CodingKey {
        case resource, id
        case leagueID = "league_id"
        case seasonID = "season_id"
        case stageID = "stage_id"
        case round
        case localteamID = "localteam_id"
        case visitorteamID = "visitorteam_id"
        case startingAt = "starting_at"
        case type, live, status
        //case lastPeriod = "last_period"
        case note
        case venueID = "venue_id"
        case tossWonTeamID = "toss_won_team_id"
        case winnerTeamID = "winner_team_id"
        //case drawNoresult = "draw_noresult"
        case firstUmpireID = "first_umpire_id"
        case secondUmpireID = "second_umpire_id"
        case tvUmpireID = "tv_umpire_id"
        case refereeID = "referee_id"
        case manOfMatchID = "man_of_match_id"
        case manOfSeriesID = "man_of_series_id"
        case totalOversPlayed = "total_overs_played"
        case elected
        case superOver = "super_over"
        case followOn = "follow_on"
//        case localteamDLData = "localteam_dl_data"
//        case visitorteamDLData = "visitorteam_dl_data"
//        case rpcOvers = "rpc_overs"
//        case rpcTarget = "rpc_target"
//        case weatherReport = "weather_report"
        case league, localteam, visitorteam, batting, bowling, runs, scoreboards,manofmatch, manofseries, tosswon, stage
    }
}

struct Manofmatch: Codable {
    var resource: String?
    var id, countryID: Int?
    var firstname, lastname, fullname: String?
    var imagePath: String?
    var dateofbirth: String?
    var gender: String?
    var battingstyle: String?
    var bowlingstyle: String?
    var position: Position?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case resource, id
        case countryID = "country_id"
        case firstname, lastname, fullname
        case imagePath = "image_path"
        case dateofbirth, gender, battingstyle, bowlingstyle, position
        case updatedAt = "updated_at"
    }
}
// MARK: - Batting
struct Batting: Codable {
    var resource: String?
    var id, sort, fixtureID, teamID: Int?
    var active: Bool?
    var scoreboard: String?
    var playerID, ball, scoreID, score: Int?
    var fourX, sixX: Int?
    var catchStumpPlayerID: Int?
    var runoutByID, batsmanoutID: Int?
    var bowlingPlayerID: Int?
    var fowScore: Int?
    var fowBalls: Double?
    var rate: Int?
    var updatedAt: String?
    var team: ScoreCardLeague?
    var batsman: Batsman?
    var bowler, catchstump: Batsman?
    var batsmanout, runoutby: Batsman?
    var result: Results?
    enum CodingKeys: String, CodingKey {
        case resource, id, sort
        case fixtureID = "fixture_id"
        case teamID = "team_id"
        case active, scoreboard
        case playerID = "player_id"
        case ball
        case scoreID = "score_id"
        case score
        case fourX = "four_x"
        case sixX = "six_x"
        case catchStumpPlayerID = "catch_stump_player_id"
        case runoutByID = "runout_by_id"
        case batsmanoutID = "batsmanout_id"
        case bowlingPlayerID = "bowling_player_id"
        case fowScore = "fow_score"
        case fowBalls = "fow_balls"
        case rate
        case updatedAt = "updated_at"
        case team, batsman, bowler, catchstump, batsmanout, runoutby,result
    }
}
//MARK - Result
struct Results: Codable {
    var resource: String?
    var id: Int?
    var name: String?
    var runs: Int?
    var four, six: Bool?
    var bye, legBye, noball, noballRuns: Int?
    var isWicket, ball, out: Bool?

    enum CodingKeys: String, CodingKey {
        case resource, id, name, runs, four, six, bye
        case legBye = "leg_bye"
        case noball
        case noballRuns = "noball_runs"
        case isWicket = "is_wicket"
        case ball, out
    }
}
// MARK: - Batsman
struct Batsman: Codable {
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

    enum CodingKeys: String, CodingKey {
        case resource, id
        case countryID = "country_id"
        case firstname, lastname, fullname
        case imagePath = "image_path"
        case dateofbirth, gender, battingstyle, bowlingstyle, position
        case updatedAt = "updated_at"
    }
}


// MARK: - Position
struct Position: Codable {
    var resource: String?
    var id: Int?
    var name: String?
}

// MARK: - League
struct ScoreCardLeague: Codable {
    var resource: String?
    var id: Int?
    var name: String?
    var code: String?
    var imagePath: String?
    var countryID: Int?
    var nationalTeam: Bool?
    var updatedAt: String?
    var seasonID: Int?
    var type: String?
    var country: ScoreCardCountry?
    var leagueID: Int?
    var standings: Bool?

    enum CodingKeys: String, CodingKey {
        case resource, id, name, code
        case imagePath = "image_path"
        case countryID = "country_id"
        case nationalTeam = "national_team"
        case updatedAt = "updated_at"
        case seasonID = "season_id"
        case type, country
        case leagueID = "league_id"
        case standings
    }
}


// MARK: - Country
struct ScoreCardCountry: Codable {
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



// MARK: - Bowling
struct Bowling: Codable {
    var resource: String?
    var id, sort, fixtureID, teamID: Int?
    var active: Bool?
    var scoreboard: String?
    var playerID: Int?
    var overs: Double?
    var medians, runs, wickets, wide: Int?
    var noball: Int?
    var rate: Double?
    var updatedAt: String?
    var team: ScoreCardLeague?
    var bowler: Batsman?

    enum CodingKeys: String, CodingKey {
        case resource, id, sort
        case fixtureID = "fixture_id"
        case teamID = "team_id"
        case active, scoreboard
        case playerID = "player_id"
        case overs, medians, runs, wickets, wide, noball, rate
        case updatedAt = "updated_at"
        case team, bowler
    }
}



//// MARK: - TeamDLData
//struct TeamDLData: Codable {
//    var score, overs, wicketsOut: JSONNull?
//
//    enum CodingKeys: String, CodingKey {
//        case score, overs
//        case wicketsOut = "wickets_out"
//    }
//}

// MARK: - Run
struct ScoreCardRun: Codable {
    var resource: String?
    var id, fixtureID, teamID, inning: Int?
    var score, wickets: Int?
    var overs: Double?
    var pp1: String?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case resource, id
        case fixtureID = "fixture_id"
        case teamID = "team_id"
        case inning, score, wickets, overs, pp1
        case updatedAt = "updated_at"
    }
}

// MARK: - ScoreboardElement
struct ScoreboardElement: Codable {
    var resource: String?
    var id, fixtureID, teamID: Int?
    var type: String?
    var scoreboard: String?
    var wide, noballRuns, noballBalls, bye: Int?
    var legBye, penalty, total: Int?
    var overs: Double?
    var wickets: Int?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case resource, id
        case fixtureID = "fixture_id"
        case teamID = "team_id"
        case type, scoreboard, wide
        case noballRuns = "noball_runs"
        case noballBalls = "noball_balls"
        case bye
        case legBye = "leg_bye"
        case penalty, total, overs, wickets
        case updatedAt = "updated_at"
    }
}



