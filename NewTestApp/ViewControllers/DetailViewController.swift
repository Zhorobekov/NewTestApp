//
//  DetailViewController.swift
//  NewTestApp
//
//  Created by Azamat on 12.06.2022.
//

import UIKit
import Kingfisher
import RealmSwift

class DetailViewController: UIViewController {
    @IBOutlet private weak var detailImage: UIImageView!
    @IBOutlet private weak var detailDescription: UILabel!
    @IBOutlet private weak var detailButton: UIButton!
    
    var imageItem: ImageItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        changesButton()
    }
    
    func configure() {
        let url = URL(string: imageItem.src.medium)
        detailImage.kf.setImage(with: url)
        detailDescription.text = imageItem.alt
    }
    
    func changesButton() {
        detailButton.layer.shadowColor = UIColor.green.cgColor
        detailButton.layer.shadowOffset = CGSize(width: 1, height: 1)
        detailButton.layer.shadowRadius = 9
        detailButton.layer.shadowOpacity = 20.0
    }
    
    
    @IBAction func didTap(_ sender: UIButton) {
        let data = ImageManager.shared.fetchImage(from: imageItem.src.medium)
        let image = SavedImage(value: ["image": data])
        StorageManager.shared.save(image: image)
    }
}
