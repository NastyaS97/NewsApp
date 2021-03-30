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
        if let url = URL(string: article.url) {
            let safariVC = SFSafariViewController(url: url)
            safariVC.delegate = self
            safariVC.modalPresentationStyle = .fullScreen
            present(safariVC, animated: true, completion: nil)
        }
    }

    //MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.6900274754, green: 0.7786818147, blue: 0.8508635163, alpha: 1)
        setUpConstraints()

        labelTitle.text = article.title
        labelDescription.text = article.description
        publisheAtLabel.text = article.publishedAt
        authorLabel.text = article.author

        DispatchQueue.main.async {
            if let url = URL(string: self.article.urlToImage) {
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
