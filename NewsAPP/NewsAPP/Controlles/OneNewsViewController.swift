//
//  OneNewsViewController.swift
//  NewsAPP
//
//  Created by Настя Сойко on 28.03.21.
//

import UIKit
import SafariServices

class OneNewsViewController: UIViewController, SFSafariViewControllerDelegate {

    //MARK: - variables

    var article: News!
    var selectedNews: News!
    var index: Int = 0

    //MARK: - gui variables

    @IBOutlet weak var omageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var publisheAtLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!

    @IBAction func safariButton(_ sender: Any) {
        if let url = URL(string: selectedNews.url) {
            let safariVC = SFSafariViewController(url: url)
            safariVC.delegate = self
            safariVC.modalPresentationStyle = .fullScreen
            present(safariVC, animated: true, completion: nil)
        }
    }

    //MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9098039216, blue: 0.8392156863, alpha: 1)
        setUpConstraints()

//        self.labelTitle.text = article.title
//        self.labelDescription.text = article.description
//        self.publisheAtLabel.text = article.publishedAt
//        self.authorLabel.text = article.author

        self.labelTitle.text = selectedNews.title
        self.labelDescription.text = selectedNews.description
        self.publisheAtLabel.text = selectedNews.publishedAt
        self.authorLabel.text = selectedNews.author

        DispatchQueue.main.async {
            if let url = URL(string: self.selectedNews.urlToImage) {
                if (try? Data(contentsOf: url)) != nil {
                    self.omageView.image = UIImage(data: try! Data(contentsOf: url))
                }
            }
        }
    }

    //MARK: - actions

    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }

    func setUpConstraints() {
        NSLayoutConstraint.activate([
        omageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        omageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
    }
}
