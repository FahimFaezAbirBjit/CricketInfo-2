//
//  HomeModelData.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 13/2/23.
//

import Foundation
enum Types{
    case live
    case recent
    case upcoming
}
struct HomeModelData{
    var fix_Id: Int
    var starting_At: String
    var localTeamName: String
    var visitorTeamName: String
    var venueName: String
    var status: String
    var stage_Name: String
    var matchType: Types?
}

extension HomeModelData{
    static var homeModelData = [HomeModelData]()
}
