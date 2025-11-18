//
//  HomeTableViewCell.swift
//  ViewCodeAula01
//
//  Created by Vagner Reis on 17/11/25.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: HomeTableViewCell.self)

    static var nib: UINib {
        UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
