//
//  CustomCollectionReusableView.swift
//  CollectionViewProject
//
//  Created by Vagner Reis on 09/10/25.
//

import UIKit

class CustomCollectionReusableView: UICollectionReusableView {
    
    static let identifier: String = "CustomCollectionReusableView"
    
    
    @IBOutlet weak var labelHeader: UILabel!
    
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(_ car: ReturnCarModel) {
        labelHeader.text = car.header
    }
    
}
