//
//  ServiceHelper.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 7.06.2023.
//

import Foundation

let apiKey = "896af7be"
let apiUrl = "https://www.omdbapi.com/?apikey=\(apiKey)"

enum Endpoints {
    case search

    var url: String {
        switch self {
        case .search:
            return apiUrl + "&s="
        }
    }
}
