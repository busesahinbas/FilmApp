//
//  MoviesViewModel.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 7.06.2023.
//

import Foundation
import Alamofire

class MoviesViewModel {
    
    var didFinishFetch: (() -> ())?
    private var service : Service?
    var movieResult : [Movie]?
    var error : Error? {
        didSet {
            print(error)
        }
    }
    
    init(service: Service? = nil) {
        self.service = service
    }
    
    func searchMovie(title: String) {
        
        self.service?.fetchMovies(withTitle: title, completion: { searchResult, error in
            if let error = error {
                self.error = error
                self.movieResult = []
                self.didFinishFetch?()
                return
            }
            self.movieResult = searchResult?.filter { $0.type == "movie" }
            self.didFinishFetch?()
        })
    }
    
}

