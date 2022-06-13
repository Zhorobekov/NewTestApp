//
//  StorageManager.swift
//  NewTestApp
//
//  Created by Azamat on 12.06.2022.
//

import Foundation
import RealmSwift

class StorageManager {
    static let shared = StorageManager()
    let realm = try! Realm()
    
    func save(image: SavedImage) {
        write {
            realm.add(image)
        }
    }
    
    func deleteAll() {
        write {
            realm.deleteAll()
        }
    }
    
    func delete(image: SavedImage) {
        write {
            let images = realm.objects(SavedImage.self)
            guard let index = images.firstIndex(where: {$0.image == image.image}) else { return }
            realm.delete(images[index])
        }
    }
    
    func fetchImages() -> [SavedImage] {
        Array(realm.objects(SavedImage.self))
    }
    
    private func write(complition: () -> Void) {
        do {
            try realm.write({
                complition()
            })
        } catch let error {
            print(error)
        }
    }
}
