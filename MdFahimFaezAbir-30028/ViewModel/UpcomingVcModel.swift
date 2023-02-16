//
//  UpcomingVcModel.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 15/2/23.
//

import Foundation
import UIKit

class UpcomingVcModel{
    var upcomingMatches: ObservableObject<[Fixture]?> = ObservableObject(value: nil)
    var indexPathUpcoming: ObservableObject<Int?> = ObservableObject(value: nil)
    func getUpcomingMatches(url: String){
        ApiResponse.shared.getApiData(url: url, completion: { (result: Result<Welcome?, Error>) in
            switch result{
            case .success(let welcome):
                guard let fixture = welcome?.data else {return}
                self.upcomingMatches.value = ViewModelHelper.shared.setMatchData(matchData: fixture)
             //   self.setMatchData(matchData: recentFix)
            case .failure(let error):
                print(error)
            }
        })
    }
    func setIndexPath(row: Int){
        indexPathUpcoming.value = row
    }
    
}
