//
//  GradientLabel.swift
//  gradientLabel
//
//  Created by Praveen Kumar on 27/01/21.
//

import UIKit

class GradientLabel: UIView {
    
    let gradientLayer : CAGradientLayer = {
        let layer = CAGradientLayer()
        return layer
    }()
    
    let textLabel : UILabel = {
        let label = UILabel()
        label.text = "Gradient Label"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
//        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    func setUp() {
        
        let color1 = UIColor(red: 185/255, green: 43/255, blue: 39/255, alpha: 1).cgColor
        let color2 = UIColor(red: 21/255, green: 101/255, blue: 192/255, alpha: 1).cgColor
        let color3 = UIColor.yellow.cgColor
        
        gradientLayer.colors = [color1,color2,color3]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.locations = [0.0,0.5,0.80]
        
        layer.addSublayer(gradientLayer)
        layer.cornerRadius = 10
        layer.masksToBounds = true
        addSubview(textLabel)
        
        constraintAllSides(view: textLabel)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
    }
    
}
