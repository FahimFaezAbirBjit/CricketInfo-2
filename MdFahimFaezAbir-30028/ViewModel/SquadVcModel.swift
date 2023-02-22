//
//  SquadVcModel.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 22/2/23.
//

import Foundation

class SquadVcModel{
    static var squadId: ObservableObject<Int?> = ObservableObject(value: nil)
    var isUpcoming: ObservableObject<Bool?> = ObservableObject(value: nil)
    func getSquad(url: String){
        ApiResponse.shared.getApiData(url: url, completion: { [weak self] (result: Result<SquadModel?, Error>) in
            guard let self = self else {return}
            switch result{
            case .success(let squadModel):
                guard let squad = squadModel?.data else {return}
               if squad.status != "NS"{
                   ShowsquadVcModel.squad.value = ViewModelHelper.shared.setSquad(squad: squad)
                   self.isUpcoming.value = false
                }else{
                    self.isUpcoming.value = true
                }
            case .failure(let error):
                print(error)
            }
        })
    }
    
}
