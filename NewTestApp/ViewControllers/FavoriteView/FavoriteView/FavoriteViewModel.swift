//
//  FavoriteViewModel.swift
//  NewTestApp
//
//  Created by Эрмек Жоробеков on 13.06.2022.
//

import Foundation

protocol FavoriteViewModelProtocol {
    var favoriteImages: [SavedImage] { get set }
    func getFavoriteImages(completion: @escaping () -> Void)
    func detailViewModel(at indexPath: IndexPath) -> DetailViewModelProtocol
}

class FavoriteViewModel: FavoriteViewModelProtocol {
 
    var favoriteImages: [SavedImage] = []
    
    func getFavoriteImages(completion: @escaping () -> Void) {
        favoriteImages = StorageManager.shared.fetchImages()
        completion()
    }
    
    func detailViewModel(at indexPath: IndexPath) -> DetailViewModelProtocol {
        let savedImage = favoriteImages[indexPath.item]
        let imageItem = ImageItem(
            photographer: savedImage.imageAuthor,
            alt: savedImage.imageDescription,
            src: ImageSource(medium: savedImage.imageURL))
        return DetailViewModel(imageItem: imageItem)
    }
    
    
}
