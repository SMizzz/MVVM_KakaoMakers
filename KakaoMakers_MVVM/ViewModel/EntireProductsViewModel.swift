//
//  EntireProductsViewModel.swift
//  KakaoMakers_MVVM
//
//  Created by 신미지 on 2021/09/23.
//

import UIKit

class EntireProductsViewModel {
  var products = [Product]()
  
  var numberOfSections: Int {
    return products.count
  }
  
  func products(at index: Int) -> Product {
    return products[index]
  }
  
}
