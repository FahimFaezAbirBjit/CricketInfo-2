//
//  HomeVC+TableView.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 11/2/23.
//

import Foundation
import UIKit

extension HomeVC: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Matches"
        }
       else{
            return "Top News"
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        else {
            return 10
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 180
        }else
        {
            return 100
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.matchCell, for: indexPath) as! MatchViewCell
            cell.matchData = vcModel.matches.value ?? []
            dump(vcModel.matches.value ?? [])
            cell.collectionView.reloadData()
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.newsCell, for: indexPath)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            
        }else{
            let translation = CATransform3DTranslate(CATransform3DIdentity, -500, 0, 0)
            cell.layer.transform = translation
            UIView.animate(withDuration: 0.5) {
                cell.layer.transform = CATransform3DIdentity
            }
        }
        
    }

}
extension HomeVC: UITableViewDelegate{
    
}
