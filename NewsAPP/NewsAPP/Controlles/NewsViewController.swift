//
//  NewsViewController.swift
//  NewsAPP
//
//  Created by Настя Сойко on 25.03.21.
//

import UIKit

class NewsViewController: UITableViewController, UISearchBarDelegate, UISearchResultsUpdating {

    var newsFilter = [News]()
    var newsList = [News]()

    let searchController = UISearchController()

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
        initsearchController()
        loadNews {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

        view.backgroundColor = #colorLiteral(red: 0, green: 0.3237846792, blue: 0.4123533964, alpha: 1)
    }

    func initsearchController() {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Для поиска нажмите здесь"
        definesPresentationContext = true

        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.scopeButtonTitles = ["ALL", "Business"]
        searchController.searchBar.delegate = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.searchController.isActive {
            return newsFilter.count
        }
        return articles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

//        let thisNews: News!
//        if self.searchController.isActive {
//            thisNews = newsFilter[indexPath.row]
//        } else {
//            thisNews = newsList[indexPath.row]
//        }

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

//                let selectedNews: News!
//                if self.searchController.isActive {
//                    selectedNews = newsFilter[indexPath.row]
//                } else {
//                    selectedNews = newsList[indexPath.row]
//                }
            }
        }
    }

    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scopeButton = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        let searchText = searchBar.text!

        filterForSearchTextAndScopeButton(searchText: searchText, scopeButton: scopeButton)
    }

    func filterForSearchTextAndScopeButton(searchText: String, scopeButton: String = "ALL") {
        newsList = newsFilter.filter {
            news in
            let scopeMatch = (scopeButton == "ALL" || news.title.lowercased().contains(scopeButton.lowercased()))

            if(searchController.searchBar.text != "") {
                let searchTextMatch = news.title.lowercased().contains(searchText.lowercased())

                return scopeMatch && searchTextMatch
            }
            else {
                return scopeMatch
            }
        }
        self.tableView.reloadData()
    }
}
