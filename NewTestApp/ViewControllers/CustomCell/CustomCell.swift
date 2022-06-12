//
//  CustomCell.swift
//  NewTestApp
//
//  Created by Azamat on 12.06.2022.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var nameCell: UILabel!
    @IBOutlet weak var descriptionCell: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
