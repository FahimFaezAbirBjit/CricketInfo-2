//
//  HomeModelData.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 13/2/23.
//

import Foundation
enum MatchTypes{
    case live
    case recent
    case upcoming
}
struct Fixture{
    var fixId: Int
    var startingAt: String
    var localTeamName: String
    var visitorTeamName: String
    var visitorTeamScore: String
    var localTeamScore: String
    var venueName: String
    var stageName: String
    var round: String
    var visitorTeamFlag: String
    var localTeamFlag: String
    var status: String
    var result: String
    var visitorTeamCode: String
    var localTeamCode: String
    var matchType: MatchTypes
    var isLive: Bool
}

extension Fixture{
    static var fixtureData = [Fixture]()
}

