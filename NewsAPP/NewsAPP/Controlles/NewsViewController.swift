//
//  NewsViewController.swift
//  NewsAPP
//
//  Created by Настя Сойко on 25.03.21.
//

import UIKit

class NewsViewController: UITableViewController {

    @IBAction func refreshNewsControllerAction(_ sender: Any) {
        loadNews {
            DispatchQueue.main.async {
                self.refreshControl?.endRefreshing()
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadNews {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

        view.backgroundColor = #colorLiteral(red: 0, green: 0.3237846792, blue: 0.4123533964, alpha: 1)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let article = articles[indexPath.row]
        cell.backgroundColor = #colorLiteral(red: 0.831372549, green: 0.9294117647, blue: 0.9568627451, alpha: 1)
        cell.layer.shadowRadius = 25
        cell.layer.shadowOpacity = 25

        cell.textLabel?.text = article.title
        cell.detailTextLabel?.text = article.content
        cell.imageView?.image = UIImage(data: try! Data(contentsOf: URL(string: article.urlToImage)!))
     return cell
     }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToOneNews", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToOneNews" {
            if let indexPath = tableView.indexPathForSelectedRow {
                (segue.destination as? OneNewsViewController)?.article = articles[indexPath.row]
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
}
