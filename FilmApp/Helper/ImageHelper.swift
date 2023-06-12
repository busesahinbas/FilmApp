//
//  ImageHelper.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 12.06.2023.
//

import Foundation
import Kingfisher
import Lottie
import UIKit

func setBlurredImage(withUrl url: URL, blurImageView: UIImageView) {
    let blurProcessor = DownsamplingImageProcessor(size: blurImageView.bounds.size)
    |> BlurImageProcessor(blurRadius: 10)
    
    blurImageView.kf.setImage(
        with: url,
        placeholder: nil,
        options: [
            .processor(blurProcessor),
            .scaleFactor(UIScreen.main.scale),
            .cacheOriginalImage
        ]
    )
}

func setImageWithRoundedCorners(fromUrl url: URL, imageView: UIImageView, loadingView: AnimationView) {
    
    imageView.kf.setImage(with: ImageResource(downloadURL: url),
                          placeholder: Images.roundedNoImage,
                          options: [.processor(RoundCornerImageProcessor(cornerRadius: 50, backgroundColor: UIColor.systemBackground)),
                                    .cacheOriginalImage],
                          completionHandler: { _ in
        // Hide the animation view when the image is downloaded
        loadingView.isHidden = true
    })
}

func setImageWithoutCorners(fromUrl url: URL, imageView: UIImageView, loadingView: AnimationView) {
    imageView.kf.setImage(with: ImageResource(downloadURL: url),
                          placeholder: Images.noImage,
                          options: [.cacheOriginalImage],
                          completionHandler: { _ in
        // Hide the animation view when the image is downloaded
        loadingView.isHidden = true
        
    })
}
