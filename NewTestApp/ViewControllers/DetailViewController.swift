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
    
    var imageItem: ImageItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        let url = URL(string: imageItem.src.medium)
        detailImage.kf.setImage(with: url)
        detailDescription.text = imageItem.alt
    }
    
    
    @IBAction func didTap(_ sender: UIButton) {
        let data = ImageManager.shared.fetchImage(from: imageItem.src.medium)
        let image = SavedImage(value: ["image": data])
        StorageManager.shared.save(image: image)
    }
}
