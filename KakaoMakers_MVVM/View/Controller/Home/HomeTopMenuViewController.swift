//
//  HomeTopMenuViewController.swift
//  KakaoMakers_MVVM
//
//  Created by 신미지 on 2021/09/23.
//

import UIKit
import Tabman
import Pageboy

class HomeTopMenuViewController: TabmanViewController {

  private var viewControllers: Array<UIViewController> = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewSetup()
    setLogo()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    tabBarController?.tabBar.isHidden = false
  }
  
  func setLogo() {
    navigationController?.navigationBar.barTintColor = .white
    let kakaoMakersLogoImage = UIImage(named: "kakaomakerslogo")
    let logoImageView = UIImageView(image: kakaoMakersLogoImage)
    logoImageView.contentMode = .scaleAspectFit
    navigationItem.titleView = logoImageView
  }
  
  func viewSetup() {
    let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "EntireVC")
    viewControllers.append(homeVC!)
    self.dataSource = self
    
    let bar = TMBar.ButtonBar()
    bar.backgroundView.style = .blur(style: .light)
    bar.backgroundColor = .white
    bar.layout.contentMode = .intrinsic
    bar.layout.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 55)
    bar.layout.interButtonSpacing = 40
    bar.layout.transitionStyle = .snap
    bar.indicator.weight = .light
    bar.indicator.tintColor = .black
    bar.buttons.customize { (button) in
      button.tintColor = .black
      button.selectedTintColor = .black
      button.font = UIFont.systemFont(ofSize: 16)
    }
    addBar(bar, dataSource: self, at: .top)
  }
  
}

extension HomeTopMenuViewController:
  PageboyViewControllerDataSource,
  TMBarDataSource {
  func numberOfViewControllers(
    in pageboyViewController: PageboyViewController
  ) -> Int {
    return viewControllers.count
  }
  
  func viewController(
    for pageboyViewController: PageboyViewController,
    at index: PageboyViewController.PageIndex
  ) -> UIViewController? {
    return viewControllers[index]
  }
  
  func defaultPage(
    for pageboyViewController: PageboyViewController
  ) -> PageboyViewController.Page? {
    return nil
  }
  
  func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
    let item = TMBarItem(title: "")
    if (index == 0) {
      item.title = "전체"
    }
    return item
  }
}

