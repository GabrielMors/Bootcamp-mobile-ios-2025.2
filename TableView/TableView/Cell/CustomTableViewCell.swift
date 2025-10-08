//
//  CustomTableViewCell.swift
//  TableView
//
//  Created by Vagner Reis on 06/10/25.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier: String = "CustomTableViewCell"
    
    
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var favoriteLabel: UIImageView!
    
    var model: Model? {
        didSet {
            configure()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure() {
        guard let model else {
            return
        }
        
        if model.isFavorite {
            favoriteLabel.image = UIImage(systemName: "star.fill")
        } else {
            favoriteLabel.image = UIImage(systemName: "star")
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
