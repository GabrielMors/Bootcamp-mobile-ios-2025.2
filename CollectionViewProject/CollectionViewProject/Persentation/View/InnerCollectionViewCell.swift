//
//  InnerCollectionViewCell.swift
//  CollectionViewProject
//
//  Created by Vagner Reis on 09/10/25.
//

import UIKit

class InnerCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "InnerCollectionViewCell"
    
    
    @IBOutlet weak var imageCar: UIImageView!
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setImage(_ car: CarModel) {
        imageCar.image = car.image
    }

}
