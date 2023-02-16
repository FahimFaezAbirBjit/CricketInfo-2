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
    var indexPath: IndexPath?
    var matchData = [Fixture]()
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        print(matchData.count)
        let nib = UINib(nibName: "MatchInfoViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: Constants.matchInfoCell)
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: collectionView.bounds.width * 0.9, height: collectionView.bounds.height * 0.75)
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
    }    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.reloadData()
    }
    
}
