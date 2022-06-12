//
//  NetworkManager.swift
//  NewTestApp
//
//  Created by Эрмек Жоробеков on 12.06.2022.
//

import Foundation
import Alamofire
import SwiftUI

struct NetworkingManager {
    func fetchImages() {
        AF.request("https://api.pexels.com/v1/curated").responseDecodable(of: ImageModel.self) { response in
            switch response.result {
            case .success(let model)
                print(model)
            }
    }
}




