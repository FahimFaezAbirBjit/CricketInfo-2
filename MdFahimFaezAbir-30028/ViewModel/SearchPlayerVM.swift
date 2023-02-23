//
//  MoreViewModel.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 23/2/23.
//

import Foundation
class SearchPlayerVm{
    var indexPath: ObservableObject<IndexPath?> = ObservableObject(value: nil)
    var playersInfo: ObservableObject<[Player]?> = ObservableObject(value: nil)
    func getSearchPlayer(url: String){
        ApiResponse.shared.getApiData(url: url, completion: { [weak self] (result: Result<PlayerSearch?, Error>) in
            guard let self = self else {return}
            switch result{
            case .success(let players):
                guard let players = players?.data else {return}
                //self.info.value =
                DispatchQueue.main.async {
                    self.setplayerData(players: players)
                }
            case .failure(let error):
                print(error)
            }
        })
    }
    func setplayerData(players: [PlayerData]){
        var data = [[String: Any]]()
        for player in players{
            data.append(["playerId": player.id ?? 0, "playerName": player.fullname ?? "", "playerImage": player.imagePath ?? "", "country": player.country?.name ?? ""])
        }
        CoreDataDB.shared.savePlayersData(data: data)
    }
    func getSearchPlayer(){
        playersInfo.value =  CoreDataDB.shared.getAllData()
    }
}
