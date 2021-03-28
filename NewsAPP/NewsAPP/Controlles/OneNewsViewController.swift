//
//  OneNewsViewController.swift
//  NewsAPP
//
//  Created by Настя Сойко on 28.03.21.
//

import UIKit
import SafariServices

class OneNewsViewController: UIViewController, SFSafariViewControllerDelegate {

    var article: News!

    var index: Int = 0

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var omageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var publisheAtLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!

    @IBAction func safariButton(_ sender: Any) {
        if let url = URL(string: article.url) {
            let safariVC = SFSafariViewController(url: url)
            safariVC.delegate = self
            safariVC.modalPresentationStyle = .fullScreen
            present(safariVC, animated: true, completion: nil)
        }
    }

    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }

    func setUpConstraints() {
        NSLayoutConstraint.activate([
                                        omageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        omageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9633252025, green: 0.9266983271, blue: 0.8697786331, alpha: 1)
        setUpConstraints()

        nameLabel.text = article.name
        labelTitle.text = article.title
        labelDescription.text = article.description
        publisheAtLabel.text = article.publishedAt
        authorLabel.text = article.author

        DispatchQueue.main.async {
            if let url = URL(string: self.article.urlToImage) {
                if let data = try? Data(contentsOf: url) {
//                    self.omageView.image = UIImage(data: try! Data(contentsOf: url))
                    self.omageView.image = UIImage(data: try Data(contentsOf: url))
                }
            }
        }
    }
}
