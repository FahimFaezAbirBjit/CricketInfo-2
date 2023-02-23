//
//  SearchTableCell.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 23/2/23.
//

import UIKit

class SearchTableCell: UITableViewCell {

    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var playerCountry: UILabel!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        searchView.layer.cornerRadius = 20
        searchView.layer.masksToBounds = true
        playerImage.layer.cornerRadius = playerImage.frame.size.height / 2
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
