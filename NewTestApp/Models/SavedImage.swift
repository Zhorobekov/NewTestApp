//
//  SavedImage.swift
//  NewTestApp
//
//  Created by Azamat on 12.06.2022.
//

import Foundation
import RealmSwift

class SavedImage: Object {
    @Persisted var image: Data
    @Persisted var imageURL: String
    @Persisted var imageAuthor: String
    @Persisted var imageDescription: String
    
}
