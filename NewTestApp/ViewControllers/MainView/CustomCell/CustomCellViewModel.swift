//
//  ImageCellViewModel.swift
//  NewTestApp
//
//  Created by Эрмек Жоробеков on 12.06.2022.
//

import Foundation

protocol CustomCellViewModelProtocol {
    var imageURL: URL { get }
    var imageAuthor: String { get }
    var imageDescription: String { get }
    init(imageItem: ImageItem)
}

class CustomCellViewModel: CustomCellViewModelProtocol {
    
    var imageURL: URL {
        guard let url = URL(string: imageItem.src.medium) else { fatalError()}
        return url
    }
    var imageAuthor: String {
        imageItem.photographer
    }
    var imageDescription: String {
        imageItem.alt
    }
    
    private let imageItem: ImageItem
    
    required init(imageItem: ImageItem) {
        self.imageItem = imageItem
    }
}
