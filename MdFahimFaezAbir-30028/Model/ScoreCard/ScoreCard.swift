//
//  ScoreCard.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 19/2/23.
//

import Foundation

struct BatsmanInfo{
   // var isExpand: Bool
    var batsmanName: String
    var outStatus: String
    var run: String
    var ball: String
    var four: String
    var six: String
    var strikeRate: String
}
struct TeamInfo{
    var visitorTeam: String
    var localTeam: String
    var vistorTeamScore: String
    var LocalTeamScore: String
    var extrasLocal: String
    var extrasVis: String
    var note: String
}
struct BowlerInfo{
    var bowlerName: String
    var over: String
    var maidenOver: String
    var bowlerRun: String
    var bowlerWicket: String
    var bowlerEconomy: String
}
struct ExpandableInnings{
    var isExpand: Bool
    var batsman: [BatsmanInfo]
}
extension ExpandableInnings{
    static var firstIningsBatting = [
        ExpandableInnings(isExpand: true, batsman: [BatsmanInfo(batsmanName: "Batsman", outStatus: "", run: "R", ball: "B", four: "4s", six: "6s", strikeRate: "SR")]),
        ExpandableInnings(isExpand: true, batsman: [BatsmanInfo(batsmanName: "Batsman", outStatus: "", run: "R", ball: "B", four: "4s", six: "6s", strikeRate: "SR")])
    ]
}
extension BowlerInfo{
    static var firstIningsBowler = [BowlerInfo(bowlerName: "Bowler", over: "O", maidenOver: "M", bowlerRun: "R", bowlerWicket: "W", bowlerEconomy: "ER")]
    static var secIningsBowler = [BowlerInfo(bowlerName: "Bowler", over: "O", maidenOver: "M", bowlerRun: "R", bowlerWicket: "W", bowlerEconomy: "ER")]
}

