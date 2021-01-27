//
//  RandomTextCVCell.swift
//  gradientLabel
//
//  Created by Praveen Kumar on 27/01/21.
//

import UIKit

class RandomTextCVCell: UICollectionViewCell {
    
    @IBOutlet weak var gradientLabel: GradientLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
//        contentView.backgroundColor = .clear
        
        
        self.constraintAllSides(view: contentView)
        
        gradientLabel.setUp()
        
    }
    
}
