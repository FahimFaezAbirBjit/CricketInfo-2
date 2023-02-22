//
//  LiveViewModel.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 22/2/23.
//

import Foundation

class LiveDetailViewModel{
    static var fixId: ObservableObject<Int?> = ObservableObject(value: nil)
    var isUpcoming: ObservableObject<Bool?> = ObservableObject(value: nil)
    var isLive: ObservableObject<Bool?> = ObservableObject(value: nil)
    var isRecent: ObservableObject<Bool?> = ObservableObject(value: nil)
    func getLiveDetails(url: String){
        ApiResponse.shared.getApiData(url: url, completion: { [weak self] (result: Result<ScoreCardModel?, Error>) in
            guard let self = self else {return}
            switch result{
            case .success(let scoreCardModel):
                guard let scorecard = scoreCardModel?.data else {return}
                if scorecard.status == "NS"{
                    LivePageUpcomingVm.upcomingData.value = self.setLiveUpData(scorecard: scorecard)
                    self.isUpcoming.value = true
                    self.isRecent.value = false
                }else if scorecard.status == "Finished" {
                    self.isUpcoming.value = false
                    self.isRecent.value = true
                    LivePageRecentVm.RecentData.value = self.setLiveRecentData(scorecard: scorecard)
                }
            case .failure(let error):
                print(error)
            }
        })
    }
    func setLiveUpData(scorecard: DataClass)-> LiveUpDetail?{
       return LiveUpDetail(localTeam: scorecard.localteam?.name ?? "", visitorTeam: scorecard.visitorteam?.name ?? "", localTeamFlag: scorecard.localteam?.imagePath ?? "", visitorTeamFlag: scorecard.visitorteam?.imagePath ?? "", startingDate: scorecard.startingAt ?? "")
    }
    func setLiveRecentData(scorecard: DataClass)-> LiveRecentData?{
        guard let runs = scorecard.runs else {return nil}
        var localTeamScore: Int = 0
        var visitorTeamScore: Int = 0
        var localTeamWick: Int = 0
        var visitorTeamWick: Int = 0
        var localTeamOver: Double = 0
        var visitorTeamOver: Double = 0
        for run in runs{
            if run.teamID == scorecard.localteam?.id {
                localTeamScore = run.score ?? 0
                localTeamWick = run.wickets ?? 0
                localTeamOver = run.overs ?? 0.0
            }else if run.teamID == scorecard.visitorteam?.id{
                visitorTeamScore = run.score ?? 0
                visitorTeamOver = run.overs ?? 0.0
                visitorTeamWick = run.wickets ?? 0
            }
        }
        return LiveRecentData(localTeamName: scorecard.localteam?.name ?? "", visitorTeamName: scorecard.visitorteam?.name ?? "", playerOftheMatch: scorecard.manofmatch?.fullname ?? "",playerOftheMatchImage: scorecard.manofmatch?.imagePath ?? "",playerOfTheSeries: scorecard.manofseries?.fullname ?? "",playerOfTheSeriesImage:scorecard.manofseries?.imagePath ?? "" ,localTeamScore: String(localTeamScore) + "-" + String(localTeamWick) + "(\(String(localTeamOver)))", visitorTeamScore: String(visitorTeamScore) + "-" + String(visitorTeamWick) + "(\(String(visitorTeamOver)))", note: scorecard.note ?? "")
    }
}
