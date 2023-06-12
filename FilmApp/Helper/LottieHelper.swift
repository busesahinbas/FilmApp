//
//  Lottie.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 10.06.2023.
//

import Foundation
import Lottie

func setLottie(view: AnimationView, lottieName: String) {
    view.animation = Animation.named(lottieName)
    view.contentMode = .scaleAspectFit
    view.loopMode = .loop
    view.play()
}

