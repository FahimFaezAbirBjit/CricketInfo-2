//
//  HomeVCModel.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 14/2/23.
//

import Foundation
class HomeVcModel{
    var matches: ObservableObject<[HomeModelData]?> = ObservableObject(value: nil)
    var localTeamScore: Int = 0
    var visitorTeamScore: Int = 0
    var localTeamWick: Int = 0
    var visitorTeamWick: Int = 0
    var localTeamOver: Double = 0
    var visitorTeamOver: Double = 0
    func getRecentMatches(url: String){
        ApiResponse.shared.getApiData(url: url, completion: { (result: Result<Welcome?, Error>) in
            switch result{
            case .success(let welcome):
                guard let recentFix = welcome?.data else {return}
                self.setMatchData(matchData: recentFix)
            case .failure(let error):
                print(error)
            }
        })
    }
    func setMatchData(matchData: [Datum]){
        for i in matchData{
            guard let runs = i.runs else {return}
            for run in runs{
                if run.teamID == i.localteam?.id {
                    localTeamScore = run.score ?? 0
                    localTeamWick = run.wickets ?? 0
                    localTeamOver = run.overs ?? 0.0
                }else if run.teamID == i.visitorteam?.id{
                    visitorTeamScore = run.score ?? 0
                    visitorTeamOver = run.overs ?? 0.0
                    visitorTeamWick = run.wickets ?? 0
                }
            }
            HomeModelData.homeModelData.append(HomeModelData(fixId: i.id ?? 0, startingAt: i.startingAt ?? "", localTeamName: i.localteam?.code ?? "", visitorTeamName: i.visitorteam?.code ?? "", visitorTeamScore: String(visitorTeamScore) + "-" + String(visitorTeamWick) + "(\(String(visitorTeamOver)))" , localTeamScore: String(localTeamScore) + "-" + String(localTeamWick) + "(\(String(localTeamOver)))" , venueName: i.venue?.name ?? "", stageName: i.stage?.name ?? "", round: i.round ?? "", visitorTeamFlag: i.visitorteam?.imagePath ?? "", localTeamFlag: i.localteam?.imagePath ?? "",status: i.status ?? "", result: i.note ?? String("".prefix(while: { $0 != "(" })), matchType: MatchTypes.recent))
            //dump(HomeModelData.homeModelData)
        }
        matches.value =  HomeModelData.homeModelData
    }
}
