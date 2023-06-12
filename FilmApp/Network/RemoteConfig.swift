//
//  RemoteConfig.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 7.06.2023.
//

import Foundation
import FirebaseRemoteConfig

func fetchRemoteConfig(configName: String, view: UIViewController, completion: @escaping (String) -> Void) {

    let remoteConfig = RemoteConfig.remoteConfig()

    let remoteConfigDefaults: [String: NSObject] = [
        configName: "" as NSObject
    ]
    remoteConfig.setDefaults(remoteConfigDefaults)
    
    remoteConfig.fetchAndActivate { (status, error) in
        if let error = error {
            showAlert(title: .error, message: error.localizedDescription, view: view)
            completion("")
            return
        }
        
        let configValue = remoteConfig[configName].stringValue ?? ""
        completion(configValue) // Call completion with fetched config value
    }
}
