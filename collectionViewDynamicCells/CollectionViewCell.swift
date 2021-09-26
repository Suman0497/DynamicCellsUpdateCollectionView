//
//  CollectionViewCell.swift
//  collectionViewDynamicCells
//
//  Created by apple on 26/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var numbersLabel: UILabel!
    
    func counting(with counts: String){
        numbersLabel.text = counts
        
    }
}
