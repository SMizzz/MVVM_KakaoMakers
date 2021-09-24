//
//  ProductsNetworkManager.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/06.
//

import Moya
import ProgressHUD

class ProductsNetworkManager {
  static let provider = MoyaProvider<ProductsAPI>()
  static func getProductsData(
    completion: @escaping([Product]) -> ()) {
    ProgressHUD.show()
    provider.request(.getProducts) { (result) in
      switch result {
      case .success(let res):
        do {
          let productData = try JSONDecoder().decode(ProductsData.self, from: res.data)
//          print("==========",productData.products)
          completion(productData.products)
          ProgressHUD.dismiss()
        } catch let err {
          ProgressHUD.dismiss()
          print(err.localizedDescription)
          return
        }
      case .failure(let err):
        ProgressHUD.dismiss()
        print(err.localizedDescription)
        return
      }
    }
  }
  
  static func getDetailProductsData(
    id: String,
    completion: @escaping(Product) -> ()
  ) {
    provider.request(.detailProducts(id: id)) { result in
      switch result {
      case .success(let res):
        do {
          let productData = try JSONDecoder().decode(Product.self, from: res.data)
          completion(productData)
        } catch let err {
          print(err.localizedDescription)
          return
        }
      case .failure(let err):
        print(err.localizedDescription)
        return
      }
    }
  }
}
