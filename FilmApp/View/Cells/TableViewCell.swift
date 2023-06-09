//
//  TableViewCell.swift
//  FilmApp
//
//  Created by Buse Şahinbaş on 9.06.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabelPadding!
    @IBOutlet weak var yearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUp(label: typeLabel)
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
      
        let downloadUrl = URL(string: (result[indexPath.row].poster))!
       /* movieImageView.kf.setImage(with: ImageResource(downloadURL: downloadUrl),
                               placeholder: UIImage(named: "loading.gif"),
                               options: [.processor(RoundCornerImageProcessor(cornerRadius: 50))])
        */
    }
    
}
