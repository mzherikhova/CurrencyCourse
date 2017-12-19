//
//  CurrencyListViewCell.swift
//  CurrencyCourse
//
//  Created by Margarita Zherikhova on 17.12.2017.
//  Copyright © 2017 Margarita Zherikhova. All rights reserved.
//

import UIKit

class CurrencyListViewCell: UICollectionViewCell {
    
    @IBOutlet private(set) weak var valueLabel: UILabel!
    @IBOutlet private(set) weak var codeLabel: UILabel!
    @IBOutlet private(set) weak var flagImage: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        valueLabel.text = ""
        codeLabel.text = ""
        flagImage.image = nil
    }
}
