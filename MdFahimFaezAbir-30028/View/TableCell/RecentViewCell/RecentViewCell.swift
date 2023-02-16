//
//  RecentViewCell.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 16/2/23.
//

import UIKit

class RecentViewCell: UITableViewCell {

    @IBOutlet weak var localTeamFlag: UIImageView!
    @IBOutlet weak var visitorTeamFlag: UIImageView!
    @IBOutlet weak var visitorTeamScore: UILabel!
    @IBOutlet weak var localTeamScore: UILabel!
    @IBOutlet weak var matchResult: UILabel!
    @IBOutlet weak var localTeamName: UILabel!
    @IBOutlet weak var visitorTeamName: UILabel!
    @IBOutlet weak var venue: UILabel!
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var recentView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        recentView.layer.cornerRadius = 15
        recentView.layer.shadowColor = UIColor.black.cgColor
        recentView.layer.shadowOffset = CGSize(width: 0, height: 20)
        recentView.layer.shadowRadius = 15
        recentView.layer.masksToBounds = true
        recentView.layer.shadowOpacity = 0.25
        localTeamFlag.layer.cornerRadius = localTeamFlag.frame.size.height/2
        visitorTeamFlag.layer.cornerRadius = visitorTeamFlag.frame.size.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
