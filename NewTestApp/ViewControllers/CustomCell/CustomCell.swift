//
//  CustomCell.swift
//  NewTestApp
//
//  Created by Azamat on 12.06.2022.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet private weak var imageCell: UIImageView!
    @IBOutlet private weak var nameCell: UILabel!
    @IBOutlet private weak var descriptionCell: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
