//
//  ProductsAPI.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/06.
//

import Moya

enum ProductsAPI {
  case getProducts
  case detailProducts(id: String)
}

extension ProductsAPI: TargetType {
  var baseURL: URL {
    guard let url = URL(string: "http://localhost:5000/api/products") else { fatalError("url error") }
    return url
  }
  
  var path: String {
    switch self {
    case .getProducts:
      return "/"
    case .detailProducts(let id):
      return "/\(id)"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .getProducts, .detailProducts(_):
      return .get
    }
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    switch self {
    case .getProducts, .detailProducts(_):
      return .requestPlain
    }
  }
  
  var headers: [String : String]? {
    return ["Content-Type": "application/json"]
  }
}
