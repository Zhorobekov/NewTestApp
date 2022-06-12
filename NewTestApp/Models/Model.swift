//
//  Model.swift
//  NewTestApp
//
//  Created by Эрмек Жоробеков on 12.06.2022.
//

import Foundation

struct ImageModel: Decodable {
    let photos: [ImageItem]
}

struct ImageItem: Decodable {
    let photographer: String
    let alt: String
    let src: ImageSource
}

struct ImageSource: Decodable {
    let medium: String
}
