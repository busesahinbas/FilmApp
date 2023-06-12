//
//  MainViewController.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 7.06.2023.
//

import UIKit
import Lottie

class MainViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var searchAnimationView: AnimationView!
    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController()
    
    // MARK: - Data
    var movieViewModel = MoviesViewModel(service: Service())
    
    var searchResult : [Movie] = [] {
        didSet {
            searchAnimationView.isHidden = searchResult.count > 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        title = LabelTitle.searchTitle
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        registerTableView()
        tableView.dataSource = self
        tableView.delegate = self
        
        setLottie(view: searchAnimationView, lottieName: LottieName.search)
        
    }
    
    func registerTableView(){
        tableView.register(UINib(nibName: Views.TableViewCell, bundle: nil), forCellReuseIdentifier: Views.TableViewCell)
    }
    
    func fetch(searchName: String) {
        movieViewModel.searchMovie(title: searchName)
        movieViewModel.didFinishFetch = {
            DispatchQueue.main.async {
                self.searchResult = self.movieViewModel.movieResult ?? []
                if (self.searchResult.count == 0) {
                    setLottie(view: self.searchAnimationView, lottieName: LottieName.noData)
                }
                self.tableView.reloadData()
            }
        }
    }
}

// MARK: - UISearchBarDelegate
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
            searchResult = []
            setLottie(view: self.searchAnimationView, lottieName: LottieName.search)
            searchAnimationView.isHidden = false
            tableView.reloadData()
        }
    }
}

// MARK: UITableViewDelegate, UITableViewDataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Views.TableViewCell, for: indexPath) as? TableViewCell
        else { return UITableViewCell() }
        cell.configure(result: searchResult, indexRow: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 119
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: Views.DetailViewController) as? DetailViewController else { return }
        vc.selectedID = self.searchResult[indexPath.row].imdbID
        navigationController?.pushViewController(vc, animated: true)
    }
}
