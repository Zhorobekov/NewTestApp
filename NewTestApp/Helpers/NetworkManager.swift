//
//  NetworkManager.swift
//  NewTestApp
//
//  Created by Эрмек Жоробеков on 12.06.2022.
//

import Foundation
import Alamofire

protocol NetworkingManagerDelegate: AnyObject {
    func onUpdateImageModel(width model: ImageModel)
}

struct NetworkingManager {
    
    weak var delegate: NetworkingManagerDelegate?
    
    func fetchImages() {
        let urlString = "https://api.pexels.com/v1/search?query=milk"
        let heder: HTTPHeaders = ["Authorization": "563492ad6f917000010000017d7180dcfdb24239aba1f03e291579dc"]
        AF.request(urlString, headers: heder).responseDecodable(of: ImageModel.self) { response in
            switch response.result {
            case .success(let model):
                delegate?.onUpdateImageModel(width: model)
            case .failure(let error):
                print(error)
            }
        }
    }
}




