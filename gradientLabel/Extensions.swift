//
//  Extensions.swift
//  gradientLabel
//
//  Created by Praveen Kumar on 27/01/21.
//

import UIKit

extension UIView {
    
    func constraintAllSides(view : UIView) {
        
        NSLayoutConstraint.activate([
            view.leftAnchor.constraint(equalTo: self.leftAnchor),
            view.rightAnchor.constraint(equalTo: self.rightAnchor),
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
    }
    
}

extension String {
    func sanitized() -> String {
        // see for ressoning on charachrer sets https://superuser.com/a/358861
        let invalidCharacters = CharacterSet(charactersIn: "\\/:*?\"<>|")
            .union(.newlines)
            .union(.illegalCharacters)
            .union(.controlCharacters)
        
        return self
            .components(separatedBy: invalidCharacters)
            .joined(separator: "")
    }
    
    mutating func sanitize() -> Void {
        self = self.sanitized()
    }
    
    func whitespaceCondenced() -> String {
        return self.components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
    
    mutating func condenceWhitespace() -> Void {
        self = self.whitespaceCondenced()
    }
}



extension UIColor {
    
    static func hexColor(hex : String) -> UIColor {
        
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    return UIColor(red: r, green: g, blue: b, alpha: a)
                    
                }
            }
        }
        
        return .black
        
    }
    
}
