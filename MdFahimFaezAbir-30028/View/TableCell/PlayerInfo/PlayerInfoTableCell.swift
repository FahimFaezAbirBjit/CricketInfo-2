//
//  PlayerInfoTableCell.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 23/2/23.
//

import UIKit

class PlayerInfoTableCell: UITableViewCell {

    @IBOutlet weak var playerProfileView: UIView!
    @IBOutlet weak var playerPosition: UILabel!
    @IBOutlet weak var playerCountry: UILabel!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var countryFlag: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        playerImage.layer.cornerRadius = playerImage.frame.size.height/2
        playerImage.layer.borderWidth = 2
        playerImage.layer.borderColor = UIColor.black.cgColor
        countryFlag.layer.cornerRadius = 20
        countryFlag.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
        playerProfileView.layer.cornerRadius = 20
        playerProfileView.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
