//
//  CustomCollectionViewCell.swift
//  CollectionViewProject
//
//  Created by Vagner Reis on 09/10/25.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var innerCollectionViewCell: UICollectionView!
    
    // TODO: Tarefa 2
    // Quero que isso nao fique se repetindo
    static let identifier: String = "CustomCollectionViewCell" // Esses dois
    // Quero que isso nao fique se repetindo
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    private var cars: [CarModel] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        configureInnerCollectionView()
    }
    
    func configureInnerCollectionView() {
        innerCollectionViewCell.delegate = self
        innerCollectionViewCell.dataSource = self
        innerCollectionViewCell.register(InnerCollectionViewCell.nib, forCellWithReuseIdentifier: InnerCollectionViewCell.identifier)
        innerCollectionViewCell.showsHorizontalScrollIndicator = false
        
        if let flow = innerCollectionViewCell.collectionViewLayout as? UICollectionViewFlowLayout {
            flow.scrollDirection = .horizontal
        }
        
    }
    
    func setCars(_ cars: [CarModel]) {
        self.cars = cars
        innerCollectionViewCell.reloadData()
    }

}

extension CustomCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InnerCollectionViewCell.identifier, for: indexPath) as? InnerCollectionViewCell
        
        guard let cell else {
            return UICollectionViewCell()
        }
        
        cell.setImage(cars[indexPath.row])
        
        return cell
    }
    
}

extension CustomCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}
