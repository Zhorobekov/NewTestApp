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
            print("saved")
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
