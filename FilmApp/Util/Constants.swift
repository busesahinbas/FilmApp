//
//  Constants.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 9.06.2023.
//

import Foundation
import UIKit
import Kingfisher

let companyName = "companyName"
let internetMonitor = "InternetConnectionMonitor"
let mainViewSegue = "toMainView"
let searchTitle = "Search"
let placeholderImage = UIImage(named: "no_image")?.kf.image(withRoundRadius: 50, fit: CGSize(width: 300, height: 423))
let noImage = UIImage(named: "no_image")

let uuid = UUID().uuidString

enum AnalyticsEventParameter {
    static let title = "Movie_Title"
    static let year = "Movie_Year"
    static let rate = "Movie_Rate"
    static let time = "Movie_Run_Time"
    static let genre = "Movie_Genre"
    static let director = "Movie_Director"
    static let box = "Movie_Box_Office"
}

enum AnalyticsEventName {
    static let detail = "movie_detail"
}
