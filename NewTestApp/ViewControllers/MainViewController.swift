//
//  ViewController.swift
//  NewTestApp
//
//  Created by Эрмек Жоробеков on 12.06.2022.
//

import UIKit

class MainViewController: UIViewController {
    private var networkingManager = NetworkingManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        networkingManager.fetchImages()
        networkingManager.delegate = self
    }
}

extension MainViewController: NetworkingManagerDelegate {
    func onUpdateImageModel(width model: ImageModel) {
        print("Images")
    }
}

