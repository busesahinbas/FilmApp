//
//  DetailViewController.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 9.06.2023.
//

import UIKit
import Lottie
import Firebase
import Kingfisher

class DetailViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var blurImageView: UIImageView!
    @IBOutlet weak var loadingView: AnimationView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var boxLabel: UILabel!
    @IBOutlet weak var plotTextView: UITextView!
    
    // MARK: - Data
    var detailViewModel = DetailViewModel(service: Service())
    var detailResult: Detail? {
        didSet {
            if detailResult != nil {
                loadingView.isHidden = true
            }
        }
    }
    var selectedID : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLottie(view: loadingView, lottieName: LottieName.loading)
        DispatchQueue.main.async {
            self.fetch(searchID: self.selectedID ?? "")
        }
    }
    
    func configure(result: Detail) {
        let util = Util()
        titleLabel.text = util.safelyHandleNA(value: result.title)
        dateLabel.text = util.safelyHandleNA(value: result.year)
        rateLabel.text = util.safelyHandleNA(value: result.formattedImdbRating)
        timeLabel.text = util.safelyHandleNA(value: result.runtime)
        genreLabel.text = util.safelyHandleNA(value: result.firstGenre)
        directorLabel.text = util.safelyHandleNA(value: result.formattedDirector)
        boxLabel.text = util.safelyHandleNA(value: result.dollar)
        plotTextView.text = util.safelyHandleNA(value: result.plot)
        
        guard let downloadUrl = URL(string: result.poster) else { return }
        setBlurredImage(withUrl: downloadUrl, blurImageView: blurImageView)
        setImageWithoutCorners(fromUrl: downloadUrl, imageView: posterImageView, loadingView: loadingView)
         
        DispatchQueue.main.async {
            analtytics(data: self.detailResult!)
        }
    }
    
    func fetch(searchID: String) {
        detailViewModel.getMovie(id: searchID)
        detailViewModel.didFinishFetch = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.detailResult = self.detailViewModel.detailResult
                self.configure(result: self.detailResult!)
            }
        }
    }
}
