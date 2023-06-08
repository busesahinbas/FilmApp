//
//  MainViewController.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 7.06.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    var movieViewModel = MoviesViewModel(service: Service())
    var searchResult : [Movie]?
    let searchController = UISearchController()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        fetch()
        configure()
    }
    
    func configure() {
        registerTableView()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    func fetch() {
        movieViewModel.searchMovie(title: "avatar")
        movieViewModel.didFinishFetch = {
            self.searchResult = self.movieViewModel.movieResult
            print(self.searchResult)
        }
        
    }
}

extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        print(text)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func registerTableView(){
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
        else { return UITableViewCell() }
        
        cell.typeLabel.text = "test"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 119
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  
    }
}
