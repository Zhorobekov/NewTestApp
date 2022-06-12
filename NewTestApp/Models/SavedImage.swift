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
}
