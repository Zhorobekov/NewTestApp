//
//  MainViewModel.swift
//  NewTestApp
//
//  Created by Эрмек Жоробеков on 12.06.2022.
//

import Foundation
import UIKit

protocol MainViewModelProtocol {
    var images: [ImageItem] { get }
    func getImages(with request: String, completion: @escaping () -> Void)
    func cellViewModel(at indexPath: IndexPath) -> CustomCellViewModelProtocol
    func detailViewModel(at indexPath: IndexPath) -> DetailViewModelProtocol
}

class MainViewModel: MainViewModelProtocol {
    var networking: Networking = NetworkingManager()
    
    var images: [ImageItem] = []
    
    var viewModelDidChange: ((MainViewModelProtocol) -> Void)?
    
    func cellViewModel(at indexPath: IndexPath) -> CustomCellViewModelProtocol {
        let imageItem = images[indexPath.row]
        return CustomCellViewModel(imageItem: imageItem)
    }
    
    func getImages(with request: String, completion: @escaping () -> Void) {
        networking.fetchImages(with: request) { [weak self] images in
            self?.images = images
            completion()
        }
    }
    
    func detailViewModel(at indexPath: IndexPath) -> DetailViewModelProtocol {
        let imageItem = images[indexPath.row]
        return DetailViewModel(imageItem: imageItem)
    }
}
