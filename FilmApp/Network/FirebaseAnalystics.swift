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
    
    Analytics.logEvent(AnalyticsEventName.detail, parameters: [EventAnalyticsParameter.title : data.title,
                                                        EventAnalyticsParameter.year : data.year,
                                                        EventAnalyticsParameter.rate : data.formattedImdbRating,
                                                        EventAnalyticsParameter.time : data.runtime,
                                                        EventAnalyticsParameter.genre : data.firstGenre,
                                                        EventAnalyticsParameter.director : data.formattedDirector,
                                                        EventAnalyticsParameter.box : data.boxOffice
                                                       ])
}


