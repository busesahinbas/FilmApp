//
//  ServiceHelper.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 7.06.2023.
//

import Foundation

//MARK: - API Key
let apiKey = "896af7be"

//MARK: - Base Url
let apiUrl = "https://www.omdbapi.com/?apikey=\(apiKey)"

// MARK: - OMDB API Endpoints
enum Endpoints {
    case search
    case detail

    var url: String {
        switch self {
        case .search:
            return apiUrl + "&s="
        case .detail:
            return apiUrl + "&i="
        }
    }
}
