//
//  matchViewCell.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 13/2/23.
//

import UIKit
import SDWebImage
class MatchViewCell: UITableViewCell {

    @IBOutlet weak var matchViewCell: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    var matchData = [HomeModelData]()
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "MatchInfoViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: Constants.matchInfoCell)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
