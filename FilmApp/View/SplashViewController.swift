//
//  SplashViewController.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 6.06.2023.
//

import UIKit
import Lottie
import Network
import FirebaseRemoteConfig

class SplashViewController: UIViewController {
    
    @IBOutlet weak var internetAnimationView: AnimationView!
    @IBOutlet weak var companyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        checkInternetConnection()
    }
    
    func checkInternetConnection() {
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: LabelTitle.internetMonitor)
        
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                DispatchQueue.main.async {
                    fetchRemoteConfig(configName: RemoteConfigs.companyName, view: self) { configValue in
                        // Handle the fetched config value here
                        self.companyLabel.text = configValue
                        self.internetAnimationView.isHidden = true
                    }
                    self.navigateToMainView()
                }
            } else {
                DispatchQueue.main.async {
                    setLottie(view: self.internetAnimationView, lottieName: noInternet)
                    showAlert(title: .error, message: .internet, view: self)
                }
            }
        }
        monitor.start(queue: queue)
    }
    
    func navigateToMainView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.performSegue(withIdentifier: Segue.mainViewSegue, sender: nil)
        }
    }
}

