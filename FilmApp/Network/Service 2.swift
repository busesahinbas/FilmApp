//
//  Service.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 7.06.2023.
//

import Foundation
import Alamofire

struct Service {
    
    // MARK: - Singleton
    static let shared = Service()
    
    // MARK: -Service
    func genericFetch<T: Decodable>(from urlString: String, completion: @escaping (T?, Error?) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        
        AF
            .request(url)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let result):
                    completion(result, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }
    
    func fetchMovies(withTitle title: String, completion: @escaping ([Movie]?, Error?) -> Void) {
        let urlString = Endpoints.search.url + title
        
        genericFetch(from: urlString) { (response: MovieListResponse?, error) in
            guard let response = response, error == nil else {
                completion(nil, error)
                return
            }
            completion(response.movies, nil)
        }
    }
    
}
