//
//  Detail.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 9.06.2023.
//

import Foundation

// MARK: - Detail
struct Detail: Codable {
    let title, year, runtime, genre: String
    let director, actors, plot, country: String
    let poster: String
    let imdbRating, imdbID, type, boxOffice: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case actors = "Actors"
        case plot = "Plot"
        case country = "Country"
        case poster = "Poster"
        case imdbRating, imdbID
        case type = "Type"
        case boxOffice = "BoxOffice"
    }
}

// MARK: - Request
struct Detailequest: Codable {}
