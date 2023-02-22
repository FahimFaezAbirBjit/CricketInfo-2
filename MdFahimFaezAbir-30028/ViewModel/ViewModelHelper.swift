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
        var firstInningsScore: Int = 0
        var secInningsScore: Int = 0
        var firstInningsWick: Int = 0
        var secInningsWick: Int = 0
        var firstInningsOver: Double = 0
        var secInningsOver: Double = 0
        var secIninigsExtras: String = ""
        var firstIninigsExtras: String = ""
        var firstInningsTeamName: String = ""
        var secInningsTeamName: String = ""
        var bye: Int = 0
        var legB: Int = 0
        var penalty: Int = 0
        var noballRuns: Int = 0
        var wide: Int = 0
        var noBall: Int = 0
        guard let scoreCard = scorecard.scoreboards else {return nil}
        for score in scoreCard{
            if score.type == "extra"{
                if score.scoreboard == "S1"{
                    bye = score.bye ?? 0
                    legB = score.legBye ?? 0
                    penalty = score.penalty ?? 0
                    noballRuns = score.noballRuns ?? 0
                    noBall = score.noballBalls ?? 0
                    wide = score.wide ?? 0
                    let totalExtra = bye + legB + penalty + noballRuns + noBall + wide
                    firstIninigsExtras = String(totalExtra) + ",b " + String(bye) + ",lb " + String(legB) + ",w " + String(wide) + ",nb " + String(noBall) + ",p " + String(penalty)
                }else if score.scoreboard == "S2"{
                    bye = score.bye ?? 0
                    legB = score.legBye ?? 0
                    penalty = score.penalty ?? 0
                    noballRuns = score.noballRuns ?? 0
                    noBall = score.noballBalls ?? 0
                    wide = score.wide ?? 0
                    let totalExtra = bye + legB + penalty + noballRuns + noBall + wide
                    secIninigsExtras = String(totalExtra) + ",b " + String(bye) + ",lb " + String(legB) + ",w " + String(wide) + ",nb " + String(noBall) + ",p " + String(penalty)
                }
            }else if score.type == "total"{
                if score.scoreboard == "S1"{
                    if score.teamID == scorecard.localteamID{
                        firstInningsTeamName = scorecard.localteam?.name ?? ""
                    }else if score.teamID == scorecard.visitorteamID{
                        firstInningsTeamName = scorecard.visitorteam?.name ?? ""
                    }
                    firstInningsScore = score.total ?? 0
                    firstInningsWick = score.wickets ?? 0
                    firstInningsOver = score.overs ?? 0.0
                }else if score.scoreboard == "S2"{
                    if score.teamID == scorecard.localteamID{
                        secInningsTeamName = scorecard.localteam?.name ?? ""
                    }else if score.teamID == scorecard.visitorteamID{
                        secInningsTeamName = scorecard.visitorteam?.name ?? ""
                    }
                    secInningsScore = score.total ?? 0
                    secInningsOver = score.overs ?? 0.0
                    secInningsWick = score.wickets ?? 0
                }
            }
            
        }
        //dump(TeamInfo())
        return TeamInfo(secInningsTeam: secInningsTeamName, firstInningsTeam: firstInningsTeamName, secInningsScore: String(secInningsScore) + "-" + String(secInningsWick) + "(\(String(secInningsOver)))", firstInningsScore: String(firstInningsScore) + "-" + String(firstInningsWick) + "(\(String(firstInningsOver)))", extrasfirst: firstIninigsExtras, extrasSec: secIninigsExtras, note: scorecard.note ?? "")
    }
    func setFirstInnigsBat(scorecard: DataClass)-> [ExpandableInnings]?{
        var batsmanFirst = [BatsmanInfo(batsmanName: "Batsman", outStatus: "", run: "R", ball: "B", four: "4s", six: "6s", strikeRate: "SR")]
        var batsmanSec = [BatsmanInfo(batsmanName: "Batsman", outStatus: "", run: "R", ball: "B", four: "4s", six: "6s", strikeRate: "SR")]
        guard let batting = scorecard.batting else {return nil}
        for batsman in batting {
            if batsman.scoreboard == "S1" {
                var outStatus = outStatus(batting: batsman)
                batsmanFirst.append(BatsmanInfo(batsmanName: batsman.batsman?.firstname ?? "", outStatus: outStatus, run: String(batsman.score ?? 0), ball: String(batsman.ball ?? 0), four: String(batsman.fourX ?? 0), six:String(batsman.sixX ?? 0), strikeRate: String(batsman.rate ?? 0)))
            }else if batsman.scoreboard == "S2"{
                var outStatus = outStatus(batting: batsman)
                batsmanSec.append(BatsmanInfo(batsmanName: batsman.batsman?.firstname ?? "", outStatus: outStatus, run: String(batsman.score ?? 0), ball: String(batsman.ball ?? 0), four: String(batsman.fourX ?? 0), six:String(batsman.sixX ?? 0), strikeRate: String(batsman.rate ?? 0)))
            }
            
        }
        ExpandableInnings.firstIningsBatting[0].batsman = batsmanFirst
        ExpandableInnings.firstIningsBatting[1].batsman = batsmanSec
        return ExpandableInnings.firstIningsBatting
    }
    func outStatus(batting: Batting?)-> String{
        guard let batting = batting  else {return ""}
        var outStatus = ""
        if batting.runoutByID == nil && batting.catchStumpPlayerID != nil && batting.bowlingPlayerID == nil{
            outStatus = (batting.result?.name ?? "") + "(\(batting.catchstump?.firstname ?? ""))"
        }
        else if batting.runoutByID != nil {
            if batting.catchStumpPlayerID != nil{
                outStatus = (batting.result?.name ?? "") + "(\(batting.catchstump?.firstname ?? "") / \(batting.runoutby?.firstname ?? ""))"
            }else{
                outStatus = (batting.result?.name ?? "") + "(\(batting.catchstump?.firstname ?? ""))"
            }
        }else if batting.bowlingPlayerID != nil{
            if batting.catchStumpPlayerID != nil{
                outStatus = (batting.result?.name ?? "") + " \(batting.catchstump?.firstname ?? "")  B \(batting.bowler?.firstname ?? "")"
            }else{
                outStatus = (batting.result?.name ?? "") + "(\(batting.bowler?.firstname ?? ""))"
            }
        }else{
            outStatus = batting.result?.name ?? ""
        }
        
        return outStatus
    }
    func setBowling(scorecard: DataClass)-> [ExpandableBowling]?{
        var bowlerFirst = [BowlerInfo(bowlerName: "Bowler", over: "O", maidenOver: "M", bowlerRun: "R", bowlerWicket: "W", bowlerEconomy: "ER")]
        var bowlerSec = [BowlerInfo(bowlerName: "Bowler", over: "O", maidenOver: "M", bowlerRun: "R", bowlerWicket: "W", bowlerEconomy: "ER")]
        guard let bowling = scorecard.bowling else {return nil}
        for bowler in bowling{
            if bowler.scoreboard == "S1"{
                bowlerFirst.append(BowlerInfo(bowlerName: bowler.bowler?.firstname ?? "", over: String(bowler.overs ?? 0), maidenOver: String(bowler.medians ?? 0), bowlerRun: String(bowler.runs ?? 0), bowlerWicket: String(bowler.wickets ?? 0), bowlerEconomy: String(bowler.rate ?? 0)))
            }else if bowler.scoreboard == "S2"{
                bowlerSec.append(BowlerInfo(bowlerName: bowler.bowler?.firstname ?? "", over: String(bowler.overs ?? 0), maidenOver: String(bowler.medians ?? 0), bowlerRun: String(bowler.runs ?? 0), bowlerWicket: String(bowler.wickets ?? 0), bowlerEconomy: String(bowler.rate ?? 0)))
            }
        }
        ExpandableBowling.bowlingInfo[0].bowler = bowlerFirst
        ExpandableBowling.bowlingInfo[1].bowler = bowlerSec
        return ExpandableBowling.bowlingInfo
    }
    func setSquad(squad: SquadData)-> [MatchSquad]?{
        guard let lineup = squad.lineup else {return nil}
        var localSquad = [Squad]()
        var visitorSquad = [Squad]()
        var name: String
        for player in lineup{
            if player.lineup?.teamID == squad.localteamID{
                if player.lineup?.captain ?? false{
                    name = (player.firstname ?? "") + "(C)"
                    print(name)
                }else{
                    name = player.firstname ?? ""
                }
                localSquad.append(Squad(teamName: squad.localteam?.name ?? "", playerName: name, playerImage: player.imagePath ?? "", playerTeamFlag: squad.localteam?.imagePath ?? "", playerPosition: player.position?.name ?? ""))
                
            }else if player.lineup?.teamID == squad.visitorteamID{
                if (player.lineup?.captain ?? false){
                    name = (player.firstname ?? "") + "(C)"
                }else{
                    name = player.firstname ?? ""
                }
                visitorSquad.append(Squad(teamName: squad.visitorteam?.name ?? "", playerName:  name, playerImage: player.imagePath ?? "", playerTeamFlag: squad.visitorteam?.imagePath ?? "", playerPosition: player.position?.name ?? ""))
            }
        }
        MatchSquad.playingXI[0].squad = localSquad
        MatchSquad.playingXI[1].squad = visitorSquad
        return MatchSquad.playingXI
    }
    
}

