//
//  Products.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/06.
//

import Foundation

struct Product: Codable {
  var id: String = ""
  var category: String = ""
  var name: String = ""
  var price: Float = 0
  var imageName: String = ""
  var brand: String = ""
  var description: String = ""
  var countInStock: Int = 0
  var numReviews: Int = 0
  
  enum CodingKeys: String, CodingKey {
    case id = "_id"
    case category
    case name
    case price
    case imageName = "image"
    case brand
    case description
    case countInStock
    case numReviews
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    id = try values.decode(String.self, forKey: .id)
    category = try values.decode(String.self, forKey: .category)
    name = try values.decode(String.self, forKey: .name)
    price = try values.decode(Float.self, forKey: .price)
    imageName = try values.decode(String.self, forKey: .imageName)
    brand = try values.decode(String.self, forKey: .brand)
    description = try values.decode(String.self, forKey: .description)
    countInStock = try values.decode(Int.self, forKey: .countInStock)
    numReviews = try values.decode(Int.self, forKey: .numReviews)
  }
  
}

struct ProductsData: Codable {
  var products: [Product]
}
