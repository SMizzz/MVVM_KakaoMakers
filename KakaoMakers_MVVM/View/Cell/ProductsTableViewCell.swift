//
//  ProductsTableViewCell.swift
//  KakaoMakers_MVVM
//
//  Created by 신미지 on 2021/09/23.
//

import UIKit
import Kingfisher

class ProductsTableViewCell: UITableViewCell {

  @IBOutlet weak var productsImageView: UIImageView!
  @IBOutlet weak var productsNameLabel: UILabel!
  @IBOutlet weak var productsDescriptionLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func update(product: Product) {
    productsImageView.kf.setImage(with: URL(string: product.imageName))
    productsNameLabel.text = product.name
    productsDescriptionLabel.text = product.description
  }
  
}
