//
//  MainViewModel.swift
//  NewTestApp
//
//  Created by Эрмек Жоробеков on 12.06.2022.
//

import Foundation

protocol MainViewModelProtocol {
    var image: Data {get set}
    var photographer: String { get set }
    var imageName: String { get set}
}


class MainViewModel: MainViewModelProtocol {
    var image: Data = Data()
    var photographer: String = ""
    var imageName: String = ""
}
