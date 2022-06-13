//
//  CustomCell.swift
//  NewTestApp
//
//  Created by Azamat on 12.06.2022.
//

import UIKit
import Kingfisher

class CustomCell: UITableViewCell {
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var nameCell: UILabel!
    @IBOutlet weak var descriptionCell: UILabel!
    
    override func prepareForReuse() {
        imageCell.image = nil
    }

    var viewModel: CustomCellViewModelProtocol! {
        didSet {
            imageCell.kf.setImage(with: viewModel.imageURL)
            nameCell.text = viewModel.imageAuthor
            descriptionCell.text = viewModel.imageDescription
            imageCell.layer.cornerRadius = imageCell.bounds.width / 2
        }
    }
}
