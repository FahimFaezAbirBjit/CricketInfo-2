//
//  ShowScorecardVcModel.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 21/2/23.
//

import Foundation

class ShowScorecardVcModel{
   // var scorecardInningsOne: ObservableObject<ScoreCard?> = ObservableObject(value: nil)
    static var inningsInfo: ObservableObject<[ExpandableInnings]?> = ObservableObject(value: nil)
    static var teamInfo: ObservableObject<TeamInfo?> = ObservableObject(value: nil)
    static var bowlerInfo: ObservableObject<[ExpandableBowling]?> = ObservableObject(value: nil)
    
}
