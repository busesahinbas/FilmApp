//
//  TableViewCell.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 9.06.2023.
//

import UIKit
import Lottie
import Kingfisher

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabelPadding!
    @IBOutlet weak var yearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUp(label: typeLabel)
        setLottie(view: animationView, lottieName: loading)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUp(label:UILabelPadding){
        label.layer.cornerRadius = label.frame.height/2
        label.layer.borderWidth = 0.5
        label.clipsToBounds = true
        label.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func configure(result : [Movie]?, indexPath : IndexPath) {
        guard let result = result else { return }
        typeLabel.text = result[indexPath.row].type
        yearLabel.text = result[indexPath.row].year
        nameLabel.text = result[indexPath.row].title
        
        guard let downloadUrl = URL(string: result[indexPath.row].poster) else { return }
        movieImageView.kf.setImage(with: ImageResource(downloadURL: downloadUrl),
                                   placeholder: placeholderImage,
                                   options: [.processor(RoundCornerImageProcessor(cornerRadius: 50)),
                                             .cacheOriginalImage],
                                   completionHandler: { _ in
            // Hide the animation view when the image is downloaded
            self.animationView.isHidden = true
        })
    }
    
}
