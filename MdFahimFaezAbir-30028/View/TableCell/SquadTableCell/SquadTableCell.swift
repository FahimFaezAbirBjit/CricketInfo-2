//
//  SquadTableCellTableViewCell.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 21/2/23.
//

import UIKit

class SquadTableCell: UITableViewCell {

    @IBOutlet weak var localTeamPlayerImage: UIImageView!
    @IBOutlet weak var localTeamPlayerName: UILabel!
    @IBOutlet weak var localTeamPlayerPosition: UILabel!
    
    @IBOutlet weak var visitorTeamPlayer: UIImageView!
    
    @IBOutlet weak var visitorTeamName: UILabel!
    
    @IBOutlet weak var visitorTeamPlayerPosition: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
