//
//  Util.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 7.06.2023.
//

import Foundation
import Kingfisher
import Lottie
import UIKit

func showAlert(title: ErrorTitle, message: ErrorMessage, view: UIViewController) {
    let alertController = UIAlertController(title: title.rawValue , message: message.rawValue, preferredStyle: .alert)
    let okAction = UIAlertAction(title: ErrorTitle.ok.rawValue, style: .default, handler: nil)
    alertController.addAction(okAction)
    view.present(alertController, animated: true, completion: nil)
}

func showAlert(title: ErrorTitle, message: String, view: UIViewController) {
    let alertController = UIAlertController(title: title.rawValue , message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: ErrorTitle.ok.rawValue, style: .default, handler: nil)
    alertController.addAction(okAction)
    view.present(alertController, animated: true, completion: nil)
}

func safelyHandleNA(value: String) -> String {
    return value.isEmpty || value == "N/A" ? "-" : value
}


func formattedSearchTitle(inputSting: String) -> String {
    var formattedString = inputSting.trimmingCharacters(in: .whitespaces) // Remove trailing spaces
    formattedString = formattedString.replacingOccurrences(of: " ", with: "+") // Replace spaces with "+"
    return formattedString
}

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



