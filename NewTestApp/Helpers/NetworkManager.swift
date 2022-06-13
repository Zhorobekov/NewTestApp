//
//  NetworkManager.swift
//  NewTestApp
//
//  Created by Эрмек Жоробеков on 12.06.2022.
//

import Foundation
import Alamofire

protocol Networking {
    func fetchImages(with request: String, completion: @escaping ([ImageItem]) -> Void)
}

struct NetworkingManager: Networking {
   
    func fetchImages(with request: String, completion: @escaping ([ImageItem]) -> Void) {
        let urlString = "https://api.pexels.com/v1/search?query=\(request)"
        let header: HTTPHeaders = ["Authorization": "563492ad6f917000010000017d7180dcfdb24239aba1f03e291579dc"]
        AF.request(urlString, headers: header).responseDecodable(of: ImageModel.self) { response in
            switch response.result {
            case .success(let model):
                completion(model.photos)
            case .failure(let error):
                print(error)
            }
        }
    }
}

class ImageManager {
    static var shared = ImageManager()
    
    private init() {}
    
    func fetchImage(from url: String?) -> Data? {
        guard let stringURL = url else { return nil }
        guard let imageURL = URL(string: stringURL) else { return nil }
        return try? Data(contentsOf: imageURL)
    }
}




