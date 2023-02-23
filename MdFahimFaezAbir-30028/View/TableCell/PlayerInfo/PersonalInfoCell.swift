//
//  PersonalInfoCell.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 23/2/23.
//

import UIKit

class PersonalInfoCell: UITableViewCell {

    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var category: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
