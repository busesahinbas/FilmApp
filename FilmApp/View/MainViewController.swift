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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetch()
    }
    
    func fetch() {
        movieViewModel.searchMovie(title: "avatar")
        movieViewModel.didFinishFetch = {
            self.searchResult = self.movieViewModel.movieResult
            print(self.searchResult)
        }
        
    }
    
}
