//
//  MainViewController.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 7.06.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    var movieViewModel = MoviesViewModel(service: Service())
    let searchController = UISearchController()
    var searchResult : [Movie] = [] {
        didSet {
            emptyView.isHidden = searchResult.count > 0
        }
    }
 
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        title = searchTitle
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        registerTableView()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func fetch(searchName: String) {
        movieViewModel.searchMovie(title: searchName)
        movieViewModel.didFinishFetch = {
            DispatchQueue.main.async {
                self.searchResult = self.movieViewModel.movieResult ?? []
                print(self.searchResult)
                self.tableView.reloadData()
            }
        }
    }
    
}

extension MainViewController:  UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
          guard let searchText = searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines), !searchText.isEmpty else {
              return
          }
          
          DispatchQueue.main.async {
              self.fetch(searchName: searchText)
          }
      }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
          if searchText.isEmpty {
              searchResult = [] // Clear the search results
              tableView.reloadData()
          }
      }
}
 
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func registerTableView(){
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
        else { return UITableViewCell() }
        
        cell.configure(result: searchResult, indexPath: indexPath)
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 119
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        vc?.selectedName = self.searchResult[indexPath.row].title
        navigationController?.pushViewController(vc!, animated: true)
    }
}
