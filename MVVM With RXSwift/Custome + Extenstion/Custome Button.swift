//
//  Custome Button.swift
//  MVVM With RXSwift
//
//  Created by Hany Karam on 12/5/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit
class CustomeButton:UIButton{
    override func awakeFromNib() {
        
        layer.backgroundColor = #colorLiteral(red: 1, green: 0.7278472781, blue: 0, alpha: 1)
        layer.cornerRadius = 12.0
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        static_shadow(withOffset: CGSize(width: 0, height: 2), color: #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 0.5))
    }
}
