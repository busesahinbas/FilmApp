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
    // MARK: - IBOutles
    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabelPadding!
    @IBOutlet weak var yearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp(label: typeLabel)
        setLottie(view: animationView, lottieName: LottieName.loading)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUp(label: UILabelPadding){
        label.layer.cornerRadius = label.frame.height/2
        label.layer.borderWidth = 0.5
        label.clipsToBounds = true
        label.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func configure(result : [Movie]?, indexRow : Int) {
        guard let result = result else { return }
        typeLabel.text = result[indexRow].type
        yearLabel.text = result[indexRow].year
        nameLabel.text = result[indexRow].title
        
        guard let downloadUrl = URL(string: result[indexRow].poster) else { return }
        
        setImageWithRoundedCorners(fromUrl: downloadUrl, imageView: movieImageView, loadingView: animationView)
    }
}
