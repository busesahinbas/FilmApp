//
//  FirebaseAnalystics.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 11.06.2023.
//

import Foundation
import Firebase
import FirebaseAnalytics


func analtytics(data : Detail) {
    
    Analytics.setUserID(uuid)
    Analytics.logEvent(AnalyticsEventName.detail, parameters: [AnalyticsEventParameter.title : data.title,
                                                        AnalyticsEventParameter.year : data.year,
                                                        AnalyticsEventParameter.rate : data.formattedImdbRating,
                                                        AnalyticsEventParameter.time : data.runtime,
                                                        AnalyticsEventParameter.genre : data.firstGenre,
                                                        AnalyticsEventParameter.director : data.formattedDirector,
                                                        AnalyticsEventParameter.box : data.boxOffice
                                                       ])
}


