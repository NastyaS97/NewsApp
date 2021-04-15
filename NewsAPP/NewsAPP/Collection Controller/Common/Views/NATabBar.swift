////
////  TabBar.swift
////  NewsAPP
////
////  Created by Настя Сойко on 28.03.21.
////
//
//import UIKit
//
//class WATabBarController: UITabBarController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let newsController = NewsViewController()
//        newsController.tabBarItem = UITabBarItem(title: "Main",
//                                                 image: UIImage(systemName: "газета"),
//                                                 selectedImage: UIImage(systemName: "газетаЗаполненна"))
//
//        //        let oneNewsController = OneNewsViewController()
//        //        oneNewsController.tabBarItem = UITabBarItem(title: "ScrollNews",
//        //                                                     image: UIImage(named: "news"),
//        //                                                     tag: 2)
//
//        let mainVoewController = OneNewsViewController()
//        newsController.tabBarItem = UITabBarItem(title: "Details",
//                                                 image: UIImage(systemName: "второйТаб"),
//                                                 selectedImage: UIImage(systemName: "второйТаб"))
//
//        //        let newsTabBarItem = UITabBarItem(title: "Details",
//        //                                                       image: UIImage(systemName: "второйТаб"),
//        //                                                       selectedImage: UIImage(systemName: "второйТаб"))
//        //
//        //        private lazy var weatherTabBarItem = UITabBarItem(title: "Location",
//        //                                                       image: UIImage(systemName: "location"),
//        //                                                       selectedImage: UIImage(systemName: "location.fill"))
//        //
//        //        private lazy var aboutUsTabBarItem = UITabBarItem(title: "AboutUs",
//        //                                                       image: UIImage(systemName: "aboutUs"),
//        //                                                       selectedImage: UIImage(systemName: "aboutUs.fill"))
//        //
//        //        private lazy var settingsTabBarItem = UITabBarItem(title: "Settings",
//        //                                                       image: UIImage(systemName: "settings"),
//        //                                                       selectedImage: UIImage(systemName: "settings.fill"))
//
//        self.setViewControllers([
//                                    UINavigationController(rootViewController: newsController),
//                                    UINavigationController(rootViewController: mainVoewController)],
//                                animated: true)
//
//        self.setTabBarAppearance()
//    }
//
//    func setTabBarAppearance() {
//        self.tabBar.barTintColor = .white
//        self.tabBar.tintColor = .orange
//        self.tabBar.unselectedItemTintColor = .magenta
//        self.tabBar.itemPositioning = .fill
//        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: -5)
//        self.tabBar.layer.shadowRadius = 5
//        self.tabBar.layer.shadowOpacity = 0.5
//        self.tabBar.layer.shadowColor = UIColor.black.cgColor
//    }
//
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        guard let index = self.tabBar.items?.firstIndex(of: item),
//              let imageView = tabBar.subviews[index + 1].subviews.first as? UIImageView else {
//            return }
//        UIView.animate(withDuration: 0.5,
//                       delay: 0,
//                       usingSpringWithDamping: 0.5,
//                       initialSpringVelocity: 0.5,
//                       options: .curveEaseInOut) {
//            imageView.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
//
//            UIView.animate(withDuration: 0.5,
//                           delay: 0.2,
//                           usingSpringWithDamping: 0.5,
//                           initialSpringVelocity: 0.5,
//                           options: .curveEaseInOut) {
//                imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
//            }
//                       }
//    }
//}
