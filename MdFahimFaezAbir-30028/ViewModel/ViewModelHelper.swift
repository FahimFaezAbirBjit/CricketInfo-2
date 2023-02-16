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
                data.append(setData(matches: matches,matchType: .recent))
            }else if matches.status == "NS"{
                data.append(setData(matches: matches,matchType: .upcoming))
            }
        }
        Fixture.fixtureData = data
        return Fixture.fixtureData
    }
    func trimResult(note: String?)-> String{
        guard let res = note else {return ""}
        return String(Array(res).prefix(while: { $0 != "(" }))
    }
    
    func setData(matches: Datum,matchType: MatchTypes)->Fixture {
        let startingAt = TimeConvertion.shared.formatDate(date: matches.startingAt ?? "")
        return Fixture(fixId: matches.id ?? 0,
        startingAt: startingAt, localTeamName: matches.localteam?.name ?? "",
        visitorTeamName: matches.visitorteam?.name ?? "", visitorTeamScore: String(visitorTeamScore) + "-" + String(visitorTeamWick) + "(\(String(visitorTeamOver)))" ,
        localTeamScore: String(localTeamScore) + "-" + String(localTeamWick) + "(\(String(localTeamOver)))" ,venueName: matches.venue?.name ?? "", stageName: matches.stage?.name ?? "", round: matches.round ?? "", visitorTeamFlag: matches.visitorteam?.imagePath ?? "", localTeamFlag: matches.localteam?.imagePath ?? "",status: matches.status ?? "", result:trimResult(note: matches.note ?? ""),visitorTeamCode: matches.visitorteam?.code ?? "", localTeamCode: matches.localteam?.code ?? "", matchType: matchType)
    }
}

