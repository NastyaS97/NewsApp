//
//  NewsViewController.swift
//  NewsAPP
//
//  Created by Настя Сойко on 25.03.21.
//

import UIKit

class NewsViewController: UITableViewController, UISearchBarDelegate, UISearchResultsUpdating {

    //MARK: - variables
    
    var newsFilter = [News]()

    let searchController = UISearchController()

    @IBAction func refreshNewsControllerAction(_ sender: Any) {
        loadNews {
            DispatchQueue.main.async {
                self.refreshControl?.tintColor = .lightGray
                self.refreshControl?.attributedTitle = NSAttributedString(string: "Update")
                self.refreshControl?.addTarget(self, action: #selector(self.updateTable), for: .valueChanged)
            }
        }
    }

    @objc func updateTable() {
        self.refreshControl?.endRefreshing()
        self.tableView.reloadData()
    }

    //MARK: - life cycle

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

        let article: News!
        if self.searchController.isActive {
            article = newsFilter[indexPath.row]
        } else {
            article = articles[indexPath.row]
        }

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

    //MARK: - prepare for segue

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToOneNews" {
            let indexPath = tableView.indexPathForSelectedRow!
            let tableViewDetail = segue.destination as? OneNewsViewController

            let selectedNews: News!
            if self.searchController.isActive {
                selectedNews = newsFilter[indexPath.row]
            } else {
                selectedNews = articles[indexPath.row]
            }

            tableViewDetail!.selectedNews = selectedNews
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    //MARK: - actions

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
        searchController.searchBar.scopeButtonTitles = ["news", "the latest"]
        searchController.searchBar.delegate = self
    }

    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scopeButton = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        let searchText = searchBar.text ?? ""

        filterForSearchTextAndScopeButton(searchText: searchText, scopeButton: scopeButton)
    }

    func filterForSearchTextAndScopeButton(searchText: String, scopeButton: String = "news") {
        newsFilter = articles.filter {
            news in
            let scopeMatch = (scopeButton == "news" || news.title.lowercased().contains(scopeButton.lowercased()))

            if searchController.searchBar.text != "" {
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
