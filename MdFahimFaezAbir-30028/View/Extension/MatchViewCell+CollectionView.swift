//
//  MatchViewCell+CollectionView.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 13/2/23.
//

import Foundation
import UIKit

extension MatchViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.matchInfoCell, for: indexPath)
        item.layer.cornerRadius = 15
        return item
    }
    
}
extension MatchViewCell: UICollectionViewDelegate{
    
}
