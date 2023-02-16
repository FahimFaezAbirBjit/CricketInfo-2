//
//  MatchInfoViewCell.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 13/2/23.
//

import UIKit

class MatchInfoViewCell: UICollectionViewCell {
    
    @IBOutlet weak var matchTitle: UILabel!
    @IBOutlet weak var visitorTeamName: UILabel!
    @IBOutlet weak var localTeamName: UILabel!
    @IBOutlet weak var btnLive: UIButton!
    @IBOutlet weak var localTeamFlag: UIImageView!
    @IBOutlet weak var matchStage: UILabel!
    @IBOutlet weak var venue: UILabel!
    @IBOutlet weak var visitorTeamFlag: UIImageView!
    @IBOutlet weak var matchView: UIView!
    @IBOutlet weak var localTeamScore: UILabel!
    @IBOutlet weak var visitorTeamScore: UILabel!
    @IBOutlet weak var matchResult: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        localTeamFlag.layer.cornerRadius = localTeamFlag.frame.size.height/2
        visitorTeamFlag.layer.cornerRadius = visitorTeamFlag.frame.size.height/2
        matchView.layer.cornerRadius = 15
        matchView.layer.shadowColor = UIColor.black.cgColor
        matchView.layer.shadowOffset = CGSize(width: 0, height: 0)
        matchView.layer.shadowRadius = 15
        matchView.layer.masksToBounds = true
        matchView.layer.shadowOpacity = 0.9
    }
    
}
