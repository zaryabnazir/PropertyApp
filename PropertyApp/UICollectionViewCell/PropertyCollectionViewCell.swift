//
//  PropertyCollectionViewCell.swift
//  PropertyApp
//
//  Created by Zaryab on 11/10/19.
//  Copyright © 2019 Zaryab. All rights reserved.
//

import UIKit
import SDWebImage

class PropertyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var propertyImageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var refrenceLabel: UILabel!
    @IBOutlet weak var dataContainerView: UIView!
    
    
    var property: Property? {
        didSet {
            propertyImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
            
            let url = URL(string: property?.medias?.first?.url ?? "")
            propertyImageView.image = UIImage(named: "placeholder")
            propertyImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"), options: .delayPlaceholder, context: nil)
            addressLabel.text = property?.address?.addressFormatted
            priceLabel.text = property?.financial?.priceFormatted
            refrenceLabel.text = property?.reference
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        DispatchQueue.main.async {
            self.dataContainerView.layer.cornerRadius = 5.0
            self.dataContainerView.layer.borderColor = UIColor.darkGray.cgColor
            self.dataContainerView.layer.borderWidth = 0.2
        }
        
    }
    
}
