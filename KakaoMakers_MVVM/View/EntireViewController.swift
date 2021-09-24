//
//  EntireViewController.swift
//  KakaoMakers_MVVM
//
//  Created by 신미지 on 2021/09/23.
//

import UIKit

class EntireViewController: UIViewController {
  
  // MVVM
  // Model
  // - Products
  
  // View
  // EntireVC의 Products Cell
  // Products Cell의 필요한 정보를 ViewModel에게서 받아야한다.
  
  // ViewModel
  // - ProductsViewModel
  // - Model 가지고 있기... Products들
  
  let viewModel = EntireProductsViewModel()
//  var productsData = [Product]()
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
    getData()
  }
  
  private func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(
      UINib(nibName: "ProductsTableViewCell", bundle: nil),
      forCellReuseIdentifier: "ProductsTableViewCell")
  }
  
  private func getData() {
    ProductsNetworkManager.getProductsData { (products) in
      self.viewModel.products = products
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
}

extension EntireViewController:
  UITableViewDelegate,
  UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfSections
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell", for: indexPath) as? ProductsTableViewCell else { return UITableViewCell() }
    let products = viewModel.products(at: indexPath.row)
    cell.update(product: products)
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 450
  }
  
  
}
