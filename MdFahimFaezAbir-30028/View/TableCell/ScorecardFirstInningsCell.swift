//
//  ScorecardFirstInningsCell.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 21/2/23.
//

import UIKit

class ScorecardFirstInningsCell: UITableViewCell {

    @IBOutlet weak var runStack: UIStackView!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var outStatus: UILabel!
    @IBOutlet weak var sr: UILabel!
    @IBOutlet weak var six: UILabel!
    @IBOutlet weak var four: UILabel!
    @IBOutlet weak var ball: UILabel!
    @IBOutlet weak var run: UILabel!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
