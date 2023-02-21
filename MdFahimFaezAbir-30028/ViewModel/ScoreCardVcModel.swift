//
//  ScoreCardVcModel.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 19/2/23.
//

import Foundation
class ScoreCardVcModel{
   // var scorecardInningsOne: ObservableObject<ScoreCard?> = ObservableObject(value: nil)
    var Innings: ObservableObject<[ExpandableInnings]?> = ObservableObject(value: nil)
    var teamInfo: ObservableObject<TeamInfo?> = ObservableObject(value: nil)
    static var scorecardId: ObservableObject<Int?> = ObservableObject(value: nil)
    var isUpcomingMatch :  ObservableObject<Bool?> = ObservableObject(value: nil)
    func getscore(url: String){
        ApiResponse.shared.getApiData(url: url, completion: { [weak self] (result: Result<ScoreCardModel?, Error>) in
            guard let self = self else {return}
            switch result{
            case .success(let scoreCardModel):
                guard let scorecard = scoreCardModel?.data else {return}
                if scorecard.status != "NS"{
                    self.teamInfo.value = ViewModelHelper.shared.setTeamInfo(scorecard: scorecard)
                    ShowScorecardVcModel.teamInfo.value = ViewModelHelper.shared.setTeamInfo(scorecard: scorecard)
                    ShowScorecardVcModel.inningsInfo.value = ViewModelHelper.shared.setFirstInnigsBat(scorecard: scorecard)
                    ShowScorecardVcModel.bowlerInfo.value = ViewModelHelper.shared.setBowling(scorecard: scorecard)
                    self.isUpcomingMatch.value = false
                }else{
                    self.isUpcomingMatch.value = true
                }
            case .failure(let error):
                print(error)
            }
        })
    }
    
    
}
