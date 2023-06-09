//
//  DetailViewModel.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 9.06.2023.
//

import Foundation
import Alamofire

class DetailViewModel {
    
    var didFinishFetch: (() -> ())?
    private var service : Service?
    var detailResult : Detail?
    var error : Error? {
        didSet {
            print("error")
        }
    }
    
    init(service: Service? = nil) {
        self.service = service
    }
    
    func searchMovie(title: String) {
        
        self.service?.fetchDetail(withTitle: title, completion: { searchResult, error in
            if let error = error {
                self.error = error
                return
            }
            self.detailResult = searchResult
            self.didFinishFetch?()
        })
    }
    
}

