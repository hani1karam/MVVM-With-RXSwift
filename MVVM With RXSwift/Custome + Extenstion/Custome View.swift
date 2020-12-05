//
//  Custome View.swift
//  MVVM With RXSwift
//
//  Created by Hany Karam on 12/5/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit

class CustomeView:UIView{
    override func awakeFromNib() {
         layer.cornerRadius = 12.0
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
 
    }
    
}
extension UIView{
    func static_shadow(withOffset value:CGSize,color: CGColor){
        self.layer.shadowColor = color
        self.layer.shadowOpacity = 3
        self.layer.shadowOffset = value
        self.layer.shadowRadius = 4
        
        self.clipsToBounds = false
        self.layer.masksToBounds = false
    }
}
