//
//  PageViewController.swift
//  NewsAPP
//
//  Created by Настя Сойко on 28.03.21.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    @IBAction func updateNewsPages(_ sender: Any) {
        loadNews {
            DispatchQueue.main.async {
//                self.refreshControl?.endRefreshing()
//                self.tableView.reloadData()
            }
        }
    }

    //MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self

        self.showViewController()
        loadNews {
            self.showViewController()
        }
    }

    //MARK: - actions

    func showViewController() {
        DispatchQueue.main.async {
            if let vc = self.pageViewController(for: 0) {
                self.setViewControllers([vc], direction: .forward, animated: true, completion: nil)
            }
        }
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = ((viewController as? OneNewsViewController)?.index ?? 0) - 1
        return self.pageViewController(for: index)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = ((viewController as? OneNewsViewController)?.index ?? 0) + 1
        return self.pageViewController(for: index)
    }

    func pageViewController(for index: Int) -> OneNewsViewController? {
        if index < 0 {
            return nil
        }
        if index >= articles.count {
            return nil
        }
        let vc = storyboard?.instantiateViewController(withIdentifier: "oneNewsSID") as? OneNewsViewController
        vc?.selectedNews = articles[index]
        vc?.index = index
        return vc
    }


    @IBAction func shareButtonTapped(_ sender: UIBarButtonItem) {
        let text = "Please, chose what you want"
        guard let url = URL(string: "bbc.com") else { return }
        let activityController = UIActivityViewController(activityItems: [text, url], applicationActivities: nil)

        self.present(activityController, animated: true)
    }
}
