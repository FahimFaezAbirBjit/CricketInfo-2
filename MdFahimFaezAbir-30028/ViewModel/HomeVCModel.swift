//
//  HomeVCModel.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 14/2/23.
//

import Foundation
class HomeVcModel{
    var matches: ObservableObject<[Fixture]?> = ObservableObject(value: nil)
    static var indexPath: ObservableObject<Int?> = ObservableObject(value: nil)
    //static let shared = HomeVcModel()
    //private init(){}
    func getRecentMatches(url: String){
        ApiResponse.shared.getApiData(url: url, completion: { (result: Result<Welcome?, Error>) in
            switch result{
            case .success(let welcome):
                guard let fixture = welcome?.data else {return}
                self.matches.value = ViewModelHelper.shared.setMatchData(matchData: fixture)
            case .failure(let error):
                print(error)
            }
        })
    }
    func setIndex(row: Int) {
        HomeVcModel.indexPath.value = row
    }
}

