//
//  DetailViewModel.swift
//  NewTestApp
//
//  Created by Эрмек Жоробеков on 13.06.2022.
//

import Foundation

protocol DetailViewModelProtocol {
    var imageURL: String { get }
    var imageDescription: String { get }
    var isFavorite: Bool { get }
    
    init(imageItem: ImageItem)
    
    func saveImage()
    func deleteImage()
}

class DetailViewModel: DetailViewModelProtocol {
    
    var isFavorite: Bool {
        isImageSaved()
    }
    
    var imageURL: String {
        imageItem.src.medium
    }
    
    var imageDescription: String {
        imageItem.alt
    }
    
    private let imageItem: ImageItem
    
    required init(imageItem: ImageItem) {
        self.imageItem = imageItem
    }
    
    func deleteImage() {
        let image = getStoredImage()
        StorageManager.shared.delete(image: image)
    }
    
    func saveImage() {
        let image = getStoredImage()
        StorageManager.shared.save(image: image)
    }
    
    private func getStoredImage() -> SavedImage {
        let imageData = ImageManager.shared.fetchImage(from: imageURL)
        return SavedImage(value: [
            "image": imageData,
            "imageURL" : imageItem.src.medium,
            "imageAuthor" : imageItem.photographer,
            "imageDescription" : imageItem.alt,
        ])
    }
    
    private func isImageSaved() -> Bool {
        guard let imageData = ImageManager.shared.fetchImage(from: imageURL) else {fatalError()}
        let images = StorageManager.shared.fetchImages().map { savedImage in
            savedImage.image
        }
        return images.contains(imageData)
    }
    
    
}


