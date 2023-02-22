//
//  MatchViewCell+CollectionView.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 13/2/23.
//

import Foundation
import UIKit

extension MatchViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        matchData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.matchInfoCell, for: indexPath) as! MatchInfoViewCell
        item.localTeamName.text = matchData[indexPath.row].localTeamCode
        item.visitorTeamName.text = matchData[indexPath.row].visitorTeamCode
        item.visitorTeamFlag.sd_setImage(with: URL(string: matchData[indexPath.row].visitorTeamFlag))
        item.localTeamFlag.sd_setImage(with: URL(string: matchData[indexPath.row].localTeamFlag))
        item.venue.text = matchData[indexPath.row].venueName
        item.matchTitle.text = matchData[indexPath.row].round + "-" + matchData[indexPath.row].stageName
        if matchData[indexPath.row].matchType == .live{
            item.localTeamScore.text = matchData[indexPath.row].localTeamScore
            item.visitorTeamScore.text = matchData[indexPath.row].visitorTeamScore
            if matchData[indexPath.row].isLive{
                item.btnLive.isUserInteractionEnabled = true
                item.btnLive.isHidden = false
                item.btnLive.titleLabel?.text = "Live"
                item.btnLive.titleLabel?.textColor = .red
                item.btnLive.imageView?.image = UIImage(systemName: "livephoto")
                item.matchResult.text = matchData[indexPath.row].result
            }
        }
        else if matchData[indexPath.row].matchType == .recent {
            item.localTeamScore.text = matchData[indexPath.row].localTeamScore
            item.visitorTeamScore.text = matchData[indexPath.row].visitorTeamScore
            item.btnLive.isUserInteractionEnabled = false
            item.btnLive.isHidden = true
            item.btnLive.imageView?.image = nil
            item.matchResult.text = matchData[indexPath.row].result
        }else if matchData[indexPath.row].matchType == .upcoming{
            item.localTeamScore.text = ""
            item.visitorTeamScore.text = ""
            if !matchData[indexPath.row].isLive{
                item.btnLive.isUserInteractionEnabled = true
                item.btnLive.isHidden = false
                item.btnLive.titleLabel?.text = nil
                item.btnLive.imageView?.tintColor = UIColor(named: "customColor")
                item.btnLive.imageView?.image = UIImage(systemName: "bell")
                item.matchResult.text = matchData[indexPath.row].startingAt
            }
        }
        item.layer.cornerRadius = 15
        return item
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 0.5) {
            cell.transform = CGAffineTransform.identity
        }
    }
    
}
extension MatchViewCell: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //self.indexPath = indexPath
        HomeVcModel.indexPath.value = indexPath.row
    }
}
