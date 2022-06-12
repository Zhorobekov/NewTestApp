//
//  ViewController.swift
//  NewTestApp
//
//  Created by Эрмек Жоробеков on 12.06.2022.
//

import UIKit

class ViewController: UIViewController {
    private var networkingManager = NetworkingManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        networkingManager.fetchImages()
    }
}

