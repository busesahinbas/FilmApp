//
//  DetailViewController.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 9.06.2023.
//

import UIKit

class DetailViewController: UIViewController {

    var detailViewModel = DetailViewModel(service: Service())
    var detailResult : Detail?
    var selectedName : String?
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        DispatchQueue.main.async {
            self.fetch(searchName: "avatar")
        }
    }
    
    func configure() {
        
    }
    
    func fetch(searchName: String) {
        detailViewModel.searchMovie(title: searchName)
        detailViewModel.didFinishFetch = {
            DispatchQueue.main.async {
                self.detailResult = self.detailViewModel.detailResult
                print(self.detailResult)
            }
        }
    }
    
}
