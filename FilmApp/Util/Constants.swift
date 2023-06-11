//
//  Constants.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 9.06.2023.
//

import Foundation
import UIKit
import Kingfisher

let uuid = UUID().uuidString

enum RemoteConfigs {
    static let companyName = "companyName"
}

enum LabelTitle {
    static let searchTitle = "Search"
    static let internetMonitor = "InternetConnectionMonitor"
}

enum Segue {
    static let mainViewSegue = "toMainView"
}

enum Images {
    static let roundedNoImage = UIImage(named: "no_image")?.kf.image(withRoundRadius: 50, fit: CGSize(width: 300, height: 423))
    static let noImage = UIImage(named: "no_image")
}

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

enum Views {
   static let DetailViewController = "DetailViewController"
   static let TableViewCell = "TableViewCell"
}
