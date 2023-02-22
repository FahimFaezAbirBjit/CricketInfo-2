//
//  Squad.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 22/2/23.
//

import Foundation
struct Squad{
    var teamName: String
    var playerName: String
    var playerImage: String
    var playerTeamFlag: String
    var playerPosition: String
}
struct MatchSquad{
    var squad: [Squad]
}
extension MatchSquad{
    static var playingXI = [
        MatchSquad(squad: [Squad(teamName: "", playerName: "", playerImage: "", playerTeamFlag: "", playerPosition: "")]),
        MatchSquad(squad: [Squad(teamName: "", playerName: "", playerImage: "", playerTeamFlag: "", playerPosition: "")])
    ]
}
