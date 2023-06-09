//
//  Util.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 7.06.2023.
//

import Foundation
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
