//
//  HomeTableViewCell.swift
//  MVVM With RXSwift
//
//  Created by Hany Karam on 12/5/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit
import Kingfisher
class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Price: UILabel!
    @IBOutlet weak var ProductView: CustomeView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ProductView.backgroundColor = UIColor.white
        contentView.backgroundColor = UIColor.white
        ProductView.static_shadow(withOffset: CGSize(width: 0, height: 2), color: #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 0.5))
        img.layer.cornerRadius = 15.0
        img.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func configure(Product: ProductModelDatum) {
        
        if let img = URL(string: Product.image ?? ""){
            DispatchQueue.main.async {
                
                self.img.kf.setImage(with: img)
                
            }
        }
    }
    
    
}
