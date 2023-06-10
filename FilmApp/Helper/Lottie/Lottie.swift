//
//  Lottie.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 10.06.2023.
//

import Foundation
import Lottie

let noData = "no_data"
let search = "search"
let loading = "load"
let noInternet = "no_internet"

func setLottie(view: AnimationView, lottieName: String) {
    view.animation = Animation.named(lottieName)
    view.contentMode = .scaleAspectFit
    view.loopMode = .loop
    view.play()
}

