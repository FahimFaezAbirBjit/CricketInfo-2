//
//  HomeVc+Binding.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 14/2/23.
//

import Foundation
import UIKit

extension HomeVC{
    func setUpBindersForMatchData(){
        vcModel.matches.bind(listener:{ [weak self] _ in
            guard let self = self else {return}
           // self.modelList = res ?? []
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
}
