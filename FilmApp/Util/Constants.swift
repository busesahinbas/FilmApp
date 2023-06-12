//
//  Constants.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 9.06.2023.
//

import Foundation
import UIKit
import Kingfisher

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

enum EventAnalyticsParameter {
    static let title = "title"
    static let year = "year"
    static let rate = "rate"
    static let time = "run_time"
    static let genre = "genre"
    static let director = "director"
    static let box = "box_office"
}

enum AnalyticsEventName {
    static let detail = "movie_detail"
}

enum Views {
    static let DetailViewController = "DetailViewController"
    static let TableViewCell = "TableViewCell"
}

enum LottieName {
    static let noData = "no_data"
    static let search = "search"
    static let loading = "load"
    static let noInternet = "no_internet"
}
