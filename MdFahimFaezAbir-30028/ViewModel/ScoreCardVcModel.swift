//
//  ScoreCardVcModel.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 19/2/23.
//

import Foundation
class ScoreCardVcModel{
    var scorecard: ObservableObject<ScoreCard?> = ObservableObject(value: nil)
    static var scorecardId: ObservableObject<Int?> = ObservableObject(value: nil)
    func getscore(url: String){
        ApiResponse.shared.getApiData(url: url, completion: { [weak self] (result: Result<ScoreCardModel?, Error>) in
            guard let _ = self else {return}
            switch result{
            case .success(let scoreCardModel):
                guard let scorecard = scoreCardModel?.data else {return}
            
                self?.scorecard.value = ViewModelHelper.shared.SetScorecard(scorecard: scorecard)
                    
                
                //self.info.value =
                //self.info.value =
            case .failure(let error):
                print(error)
            }
        })
    }
    
    
}
