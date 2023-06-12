//
//  Detail.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 9.06.2023.
//

import Foundation

// MARK: - Movie Detail Response
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
    
    var firstGenre: String {
        return genre.components(separatedBy: ", ").first ?? "unkown"
    }
    
    var dollar: String {
        return boxOffice.replacingOccurrences(of: "$", with: "")
    }
    
    var formattedImdbRating: String {
        return imdbRating + "/10 Imdb"
    }
    
    var formattedDirector: String {
        let names = director.components(separatedBy: " ")
        var initials = ""

        if names.count > 1 {
            for index in 0..<(names.count - 1) {
                if let firstCharacter = names[index].first {
                    initials.append("\(firstCharacter). ")
                }
            }
        }

        if let lastWord = names.last {
            initials += lastWord
        }

        return initials
    }
}

// MARK: - Request
struct Detailequest: Codable {}
