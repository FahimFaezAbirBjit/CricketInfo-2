//
//  MatchInfoViewCell.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 13/2/23.
//

import UIKit

class MatchInfoViewCell: UICollectionViewCell {
    
    @IBOutlet weak var matchView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        matchView.layer.cornerRadius = 15
        matchView.layer.shadowColor = UIColor.white.cgColor
        matchView.layer.shadowOffset = CGSize(width: 0, height: 0)
        matchView.layer.shadowRadius = 15
        matchView.layer.shadowOpacity = 0.5
    }
    
}
