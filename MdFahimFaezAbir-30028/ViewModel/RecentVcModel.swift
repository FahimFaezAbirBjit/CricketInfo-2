//
//  UpcomingVcModel.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 15/2/23.
//

import Foundation
import UIKit

class RecentVcModel{
    var recentMatches: ObservableObject<[Fixture]?> = ObservableObject(value: nil)
    var recentIndexPath: ObservableObject<Int?> = ObservableObject(value: nil)
    func getRecentMatchesMatches(url: String){
        ApiResponse.shared.getApiData(url: url, completion: { (result: Result<Welcome?, Error>) in
            switch result{
            case .success(let welcome):
                guard let fixture = welcome?.data else {return}
                self.recentMatches.value = ViewModelHelper.shared.setMatchData(matchData: fixture)
            case .failure(let error):
                print(error)
            }
        })
    }
    func setIndexPath(row: Int){
        recentIndexPath.value = row
    }
    
}
