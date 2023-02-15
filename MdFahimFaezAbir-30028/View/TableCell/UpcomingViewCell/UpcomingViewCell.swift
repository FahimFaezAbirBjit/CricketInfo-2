//
//  UpcomingViewCell.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 15/2/23.
//

import UIKit

class UpcomingViewCell: UITableViewCell {

    @IBOutlet weak var venue: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var visitorTeamName: UILabel!
    @IBOutlet weak var localTeamName: UILabel!
    @IBOutlet weak var visitorTeamImage: UIImageView!
    @IBOutlet weak var localTeamImage: UIImageView!
    @IBOutlet weak var leagueLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellView.layer.cornerRadius = 15
        cellView.layer.shadowColor = UIColor.black.cgColor
        cellView.layer.shadowOffset = CGSize(width: 0, height: 20)
        cellView.layer.shadowRadius = 15
        cellView.layer.masksToBounds = true
        cellView.layer.shadowOpacity = 0.25
        visitorTeamImage.layer.cornerRadius = visitorTeamImage.frame.size.height/2
        localTeamImage.layer.cornerRadius = localTeamImage.frame.size.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
        // Configure the view for the selected state
    }

}
