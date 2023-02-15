//
//  HomeVCModel.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 14/2/23.
//

import Foundation
class HomeVcModel{
    var matches: ObservableObject<[HomeModelData]?> = ObservableObject(value: nil)
//    var localTeamScore: Int = 0
//    var visitorTeamScore: Int = 0
//    var localTeamWick: Int = 0
//    var visitorTeamWick: Int = 0
//    var localTeamOver: Double = 0
//    var visitorTeamOver: Double = 0
    func getRecentMatches(url: String){
        ApiResponse.shared.getApiData(url: url, completion: { (result: Result<Welcome?, Error>) in
            switch result{
            case .success(let welcome):
                guard let fixture = welcome?.data else {return}
                self.matches.value = ViewModelHelper.shared.setMatchData(matchData: fixture)
             //   self.setMatchData(matchData: recentFix)
            case .failure(let error):
                print(error)
            }
        })
    }
//    func setMatchData(matchData: [Datum]){
//        for matches in matchData{
//            guard let runs = matches.runs else {return}
//            for run in runs{
//                if run.teamID == matches.localteam?.id {
//                    localTeamScore = run.score ?? 0
//                    localTeamWick = run.wickets ?? 0
//                    localTeamOver = run.overs ?? 0.0
//                }else if run.teamID == matches.visitorteam?.id{
//                    visitorTeamScore = run.score ?? 0
//                    visitorTeamOver = run.overs ?? 0.0
//                    visitorTeamWick = run.wickets ?? 0
//                }
//            }
//            if matches.status == "Finished"{
//                setData(matches: matches,matchType: .recent)
//            }else if matches.status == "NS"{
//                setData(matches: matches,matchType: .upcoming)
//            }
//            
//        }
//        matches.value =  HomeModelData.homeModelData
//    }
//    func trimResult(note: String?)-> String{
//        guard let res = note else {return ""}
//        return String(Array(res).prefix(while: { $0 != "(" }))
//    }
//    
//    func setData(matches: Datum,matchType: MatchTypes){
//        let startingAt = TimeConvertion.shared.formatDate(date: matches.startingAt ?? "")
//        HomeModelData.homeModelData.append(HomeModelData(fixId: matches.id ?? 0,
//        startingAt: startingAt, localTeamName: matches.localteam?.code ?? "",
//        visitorTeamName: matches.visitorteam?.code ?? "", visitorTeamScore: String(visitorTeamScore) + "-" + String(visitorTeamWick) + "(\(String(visitorTeamOver)))" ,
//        localTeamScore: String(localTeamScore) + "-" + String(localTeamWick) + "(\(String(localTeamOver)))" ,venueName: matches.venue?.name ?? "", stageName: matches.stage?.name ?? "", round: matches.round ?? "", visitorTeamFlag: matches.visitorteam?.imagePath ?? "", localTeamFlag: matches.localteam?.imagePath ?? "",status: matches.status ?? "", result:trimResult(note: matches.note ?? "") , matchType: matchType))
//    }
}

