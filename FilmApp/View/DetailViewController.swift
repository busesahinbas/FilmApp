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
    var selectedID : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.fetch(searchID: self.selectedID ?? "")
        }
    }
    
    func configure(result: Detail) {
        
        titleLabel.text = safelyHandleNA(value: result.title)
        dateLabel.text = safelyHandleNA(value: result.year)
        rateLabel.text = safelyHandleNA(value: result.formattedImdbRating)
        timeLabel.text = safelyHandleNA(value: result.runtime)
        countryLabel.text = safelyHandleNA(value: result.firstGenre)
        directorLabel.text = safelyHandleNA(value: result.formattedDirector)
        boxLabel.text = safelyHandleNA(value: result.dollar)
        plotTextView.text = safelyHandleNA(value: result.plot)
        
    }
    
    func fetch(searchID: String) {
        detailViewModel.getMovie(id: searchID)
        detailViewModel.didFinishFetch = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.detailResult = self.detailViewModel.detailResult
                print(self.detailResult)
                self.configure(result: self.detailResult!)
                self.loadingView.isHidden = true
            }
        }
    }
    
}
