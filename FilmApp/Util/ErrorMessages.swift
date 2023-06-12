//
//  ErrorMessages.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 7.06.2023.
//

import Foundation

enum ErrorTitle: String {
    case ok = "OK"
    case error = "Error"
    case sorry = "Sorry"
}

enum ErrorMessage: String {
    case internet = "Please check your Internet connection."
    case noData = "The movie you searched is not found!"
}
