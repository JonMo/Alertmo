//
//  AlertmoButton.swift
//  Pods
//
//  Created by Jonathan Moraly on 6/27/17.
//
//

import UIKit

class AlertmoButton: UIButton {
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.setBackgroundColor(UIColor(red: 0.0, green: 49.0 / 255.0, blue: 64.0 / 255.0, alpha: 1.0), forState: .normal)
        self.setBackgroundColor(UIColor.gray, forState: .disabled)
        self.setTitleColor(.white, for: UIControlState())
        self.setTitleColor(UIColor(red:1, green:1, blue:1, alpha:0.6), for: .highlighted)
        self.setTitleColor(UIColor(red:1, green:1, blue:1, alpha:0.6), for: .disabled)
        self.titleLabel?.font = UIFont(name:"Helvetica-Bold", size: 18.0)
        self.layer.cornerRadius = 25
        self.adjustsImageWhenHighlighted = true
        self.clipsToBounds = true
        self.imageView?.contentMode = .scaleAspectFit
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIButton {
    func setBackgroundColor(_ color: UIColor, forState: UIControlState) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(colorImage, for: forState)
    }
}
