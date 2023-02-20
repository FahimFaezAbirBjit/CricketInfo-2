//
//  ViewModelHelper.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 15/2/23.
//

import Foundation
class ViewModelHelper{
    static let shared = ViewModelHelper()
    var localTeamScore: Int = 0
    var visitorTeamScore: Int = 0
    var localTeamWick: Int = 0
    var visitorTeamWick: Int = 0
    var localTeamOver: Double = 0
    var visitorTeamOver: Double = 0
    func setMatchData(matchData: [Datum])-> [Fixture]{
        var data = [Fixture]()
        for matches in matchData{
            guard let runs = matches.runs else {return []}
            for run in runs{
                if run.teamID == matches.localteam?.id {
                    localTeamScore = run.score ?? 0
                    localTeamWick = run.wickets ?? 0
                    localTeamOver = run.overs ?? 0.0
                }else if run.teamID == matches.visitorteam?.id{
                    visitorTeamScore = run.score ?? 0
                    visitorTeamOver = run.overs ?? 0.0
                    visitorTeamWick = run.wickets ?? 0
                }
            }
            if matches.status == "Finished"{
                data.append(setData(matches: matches,matchType: .recent, isLive: false))
            }else if matches.status == "NS"{
                data.append(setData(matches: matches,matchType: .upcoming, isLive: false))
            }else{
                data.append(setData(matches: matches,matchType: .live, isLive: true))
            }
        }
        Fixture.fixtureData = data
        return Fixture.fixtureData
    }
    func trimResult(note: String?)-> String{
        guard let res = note else {return ""}
        return String(Array(res).prefix(while: { $0 != "(" }))
    }
    
    func setData(matches: Datum,matchType: MatchTypes, isLive: Bool)->Fixture {
        let startingAt = TimeConvertion.shared.formatDate(date: matches.startingAt ?? "")
        return Fixture(fixId: matches.id ?? 0,
                       startingAt: startingAt, localTeamName: matches.localteam?.name ?? "",
                       visitorTeamName: matches.visitorteam?.name ?? "", visitorTeamScore: String(visitorTeamScore) + "-" + String(visitorTeamWick) + "(\(String(visitorTeamOver)))" ,
                       localTeamScore: String(localTeamScore) + "-" + String(localTeamWick) + "(\(String(localTeamOver)))" ,venueName: matches.venue?.name ?? "", stageName: matches.stage?.name ?? "", round: matches.round ?? "", visitorTeamFlag: matches.visitorteam?.imagePath ?? "", localTeamFlag: matches.localteam?.imagePath ?? "",status: matches.status ?? "", result:trimResult(note: matches.note ?? ""),visitorTeamCode: matches.visitorteam?.code ?? "", localTeamCode: matches.localteam?.code ?? "", matchType: matchType, isLive: isLive)
    }
    func setInfoData(info: InfoData)-> Info{
        // dump(info)
        let startingAt = TimeConvertion.shared.formatDate(date: info.startingAt ?? "N/A")
        let time = TimeConvertion.shared.time(date: info.startingAt ?? "N/A")
        let info = Info(match: info.round ?? "N/A", series: info.stage?.name ?? "N/A", leauge: info.league?.name ?? "N/A", date: startingAt, time: time, toss: (info.tosswon?.name ?? "N/A" ) + " won the toss and opt to " + (info.elected ?? "N/A") , umpires: (info.firstumpire?.fullname ?? "N/A") + ", " + (info.secondumpire?.fullname ?? "N/A"), thirdUmpire: info.tvumpire?.fullname ?? "N/A", refree: info.referee?.fullname ?? "N/A",venue: info.venue?.name ?? "N/A", capacity: String(info.venue?.capacity ?? 0), city: info.venue?.city ?? "N/A")
        //dump(info)
        return info
    }
    //func SetScorecardInnigsOne(scorecard: DataClass)-> ScoreCard{
    // dump(scorecard)
    //return ScoreCard(note: scorecard.note ?? "N/A")
    //}
    //func SetScorecardInnigsTwo(scorecard: DataClass)-> ScoreCard{
    
    //}
    func setTeamInfo(scorecard: DataClass)-> TeamInfo?{
        var localTeamScore: Int = 0
        var visitorTeamScore: Int = 0
        var localTeamWick: Int = 0
        var visitorTeamWick: Int = 0
        var localTeamOver: Double = 0
        var visitorTeamOver: Double = 0
        var visitorIninigsExtras: String = ""
        var localIninigsExtras: String = ""
        var bye: Int = 0
        var legB: Int = 0
        var penalty: Int = 0
        var noballRuns: Int = 0
        var wide: Int = 0
        var noBall: Int = 0
        guard let scoreCard = scorecard.scoreboards else {return nil}
        for score in scoreCard{
            if score.type == "extra"{
                if score.teamID == scorecard.localteam?.id{
                    bye = score.bye ?? 0
                    legB = score.legBye ?? 0
                    penalty = score.penalty ?? 0
                    noballRuns = score.noballRuns ?? 0
                    noBall = score.noballBalls ?? 0
                    wide = score.wide ?? 0
                    let totalExtra = bye + legB + penalty + noballRuns + noBall + wide
                    localIninigsExtras = String(totalExtra) + ",b " + String(bye) + ",lb " + String(legB) + ",w " + String(wide) + ",nb " + String(noBall) + ",p " + String(penalty)
                }else if score.teamID == scorecard.visitorteam?.id{
                    bye = score.bye ?? 0
                    legB = score.legBye ?? 0
                    penalty = score.penalty ?? 0
                    noballRuns = score.noballRuns ?? 0
                    noBall = score.noballBalls ?? 0
                    wide = score.wide ?? 0
                    let totalExtra = bye + legB + penalty + noballRuns + noBall + wide
                    visitorIninigsExtras = String(totalExtra) + ",b " + String(bye) + ",lb " + String(legB) + ",w " + String(wide) + ",nb " + String(noBall) + ",p " + String(penalty)
                }
            }else if score.type == "total"{
                if score.teamID == scorecard.localteam?.id {
                    localTeamScore = score.total ?? 0
                    localTeamWick = score.wickets ?? 0
                    localTeamOver = score.overs ?? 0.0
                }else if score.teamID == scorecard.visitorteam?.id{
                    visitorTeamScore = score.total ?? 0
                    visitorTeamOver = score.overs ?? 0.0
                    visitorTeamWick = score.wickets ?? 0
                }
            }
            
        }
        //dump(TeamInfo())
        return TeamInfo(visitorTeam: scorecard.visitorteam?.code ?? "", localTeam: scorecard.localteam?.code ?? "", vistorTeamScore: String(visitorTeamScore) + "-" + String(visitorTeamWick) + "(\(String(visitorTeamOver)))", LocalTeamScore: String(localTeamScore) + "-" + String(localTeamWick) + "(\(String(localTeamOver)))", extrasLocal: localIninigsExtras, extrasVis: visitorIninigsExtras, note: scorecard.note ?? "")
    }
    func setFirstInnigsBat(scorecard: DataClass)-> [BatsmanInfo]?{
//        guard let batting = scorecard.batting else {return nil}
//        for batsman in batting {
////            if batsman.teamID == scorecard.localteam?.id {
////                BatsmanInfo.firstIningsBatting.append(BatsmanInfo(isExpand: true, batsmanName: <#T##String#>, outStatus: <#T##String#>, run: <#T##String#>, ball: <#T##String#>, four: <#T##String#>, six: <#T##String#>, strikeRate: <#T##String#>))
////            }
//            ExpandableInnings.firstIningsBatting[0].batsman.append(<#T##newElement: BatsmanInfo##BatsmanInfo#>)
//            ExpandableInnings.firstIningsBatting[1].batsman.append(<#T##newElement: BatsmanInfo##BatsmanInfo#>)
//            ExpandableInnings.firstIningsBatting[3].batsman.append(<#T##newElement: BatsmanInfo##BatsmanInfo#>)
//        }
    }
}

