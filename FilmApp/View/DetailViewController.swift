//
//  DetailViewController.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 9.06.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var boxLabel: UILabel!
    @IBOutlet weak var plotTextView: UITextView!
    
    var detailViewModel = DetailViewModel(service: Service())
    var detailResult : Detail?
    var selectedName : String?
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        DispatchQueue.main.async {
            self.fetch(searchName: "avatar")
        }
    }
    
    func configure() {
        
    }
    
    func fetch(searchName: String) {
        detailViewModel.searchMovie(title: searchName)
        detailViewModel.didFinishFetch = {
            DispatchQueue.main.async {
                self.detailResult = self.detailViewModel.detailResult
                print(self.detailResult)
                self.configure(result: self.detailResult!)
                self.loadingView.isHidden = true
            }
        }
    }
    
}
