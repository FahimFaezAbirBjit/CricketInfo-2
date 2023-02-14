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
struct HomeModelData{
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
    var matchType: MatchTypes
}

extension HomeModelData{
    static var homeModelData = [HomeModelData]()
}
