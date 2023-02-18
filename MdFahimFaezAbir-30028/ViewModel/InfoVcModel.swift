//
//  InfoVcModel.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 18/2/23.
//

import Foundation
import UIKit

class InfoVcModel{
    var info: ObservableObject<Info?> = ObservableObject(value: nil)
    static var infoId: ObservableObject<Int?> = ObservableObject(value: nil)
    func getInfo(url: String){
        ApiResponse.shared.getApiData(url: url, completion: { [weak self] (result: Result<InfoModel?, Error>) in
            guard let self = self else {return}
            switch result{
            case .success(let infoModel):
                guard let infoData = infoModel?.data else {return}
                //self.info.value =
                self.info.value = ViewModelHelper.shared.setInfoData(info: infoData)
            case .failure(let error):
                print(error)
            }
        })
    }
    
    
}
