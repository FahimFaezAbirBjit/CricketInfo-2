//
//  ApiMaker.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 9/2/23.
//

import Foundation
class ApiMaker{
    private let baseAPIURL = "https://cricket.sportmonks.com/api/v2.0"
    private let apiToken = "tdfy0GkKqZjQ1x7cZ79dQIT6VLeygjPJaMUIErC8URWie3nG7xatObPGuRnV"
    func buildFixturesURL(startingFrom startDate: String, endingOn endDate: String, isReverse: Bool) -> String {
        let includeParams = "localteam.country,visitorteam.country,runs,venue,stage"
        let fieldsParams = "id,starting_at,localteam,visitorteam,runs,status,live,round,note"
        let sortParams = isReverse ? "-starting_at" : "starting_at"
        let url = "\(baseAPIURL)/fixtures/?include=\(includeParams)&fields[fixtures]=\(fieldsParams)&sort=\(sortParams)&filter[starts_between]=\(startDate),\(endDate)&api_token=\(apiToken)"
        return url
    }
    func buildScorcardUrl(id: Int)-> String{
        let includeParams = "localteam.country,visitorteam.country,stage,tosswon,league,runs,scoreboards,batting.batsman,bowling.bowler,batting.team,bowling.team,batting.catchstump,batting.runoutby,batting.batsmanout,batting.bowler,batting.result"
        let url = "\(baseAPIURL)/fixtures/\(id)?include=\(includeParams)&api_token=\(apiToken)"
        return url
    }
    func buildSquadUrl(id: Int)->String{
        let includeParams = "localteam.country,visitorteam.country,lineup"
        let fieldsParams = "id,starting_at,loacalteam,visitorteam,localteam_id,visitorteam_id,lineup,status"
        let url = "\(baseAPIURL)/fixtures/\(id)?include=\(includeParams)&fields[fixtures]=\(fieldsParams)&api_token=\(apiToken)"
        return url
    }
    func buildLiveDetailUrl(id: Int)-> String{
        let includeParams = "localteam.country,visitorteam.country,stage,tosswon,league,runs,scoreboards,batting.batsman,bowling.bowler,batting.team,bowling.team,batting.catchstump,batting.runoutby,batting.batsmanout,batting.bowler,batting.result,manofmatch,manofseries"
        let url = "\(baseAPIURL)/fixtures/\(id)?include=\(includeParams)&api_token=\(apiToken)"
        return url
    }
    func buildInfoUrl(id: Int)->String{
        let includeParams = "localteam.country,visitorteam.country,venue,stage,firstumpire,secondumpire,tvumpire,referee,tosswon,league&fields"
        let fieldsParams = "id,starting_at,loacalteam,visitorteam,status,live,round,tosswon,elected,league"
        let url = "\(baseAPIURL)/fixtures/\(id)?include=\(includeParams)&fields[fixtures]=\(fieldsParams)&api_token=\(apiToken)"
        return url
    }
    func playerApiBuilder()-> String{
        let includeParams = "country"
        let fieldsParams = "id,fullname,image_path,country"
        let url = "\(baseAPIURL)/players?fields[players]=\(fieldsParams)&include=\(includeParams)&api_token=\(apiToken)"
        return url
    }
}
