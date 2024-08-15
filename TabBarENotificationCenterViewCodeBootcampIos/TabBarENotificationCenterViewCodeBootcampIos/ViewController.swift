//
//  ViewController.swift
//  TabBarENotificationCenterViewCodeBootcampIos
//
//  Created by Fabio Cristiano Lopes on 05/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
       
    }
    
}

class MainTabBarController: UITabBarController {


  override func viewDidLoad() {
    super.viewDidLoad()

    let tela01 = createNavController(viewController: Tela01VC(), title: "Tela 01", imageName: "magnifyingglass")
    let tela02 = createNavController(viewController: Tela02VC(), title: "Tela 02", imageName: "heart")
    let tela03 = createNavController(viewController: Tela03VC(), title: "Tela 03", imageName: "star")

    viewControllers = [tela01, tela02, tela03]
  }

  private func createNavController(viewController: UIViewController, title: String, imageName: String) -> UINavigationController {
    let navController = UINavigationController(rootViewController: viewController)
    navController.tabBarItem.title = title
    navController.tabBarItem.image = UIImage(systemName: imageName)
    return navController
  }

}
class Tela01VC: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .cyan
  }

}

class Tela02VC: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .green
  }

}

class Tela03VC: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .orange
  }

}
