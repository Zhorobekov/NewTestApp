//
//  CollectionCustomCell.swift
//  NewTestApp
//
//  Created by Эрмек Жоробеков on 12.06.2022.
//

import UIKit

class CollectionCustomCell: UICollectionViewCell {
    
    @IBOutlet weak var favoriteImageView: UIImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(imageURL: String) {
        guard let imageData = ImageManager.shared.fetchImage(from: imageURL) else { return }
        favoriteImageView.image = UIImage(data: imageData)
    }
    
}
