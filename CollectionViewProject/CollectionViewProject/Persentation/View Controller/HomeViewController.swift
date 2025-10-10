//
//  ViewController.swift
//  CollectionViewProject
//
//  Created by Vagner Reis on 09/10/25.
//

import UIKit

class HomeController: UIViewController {
    
    // Poderia ser uma TableView, e daca section ser
    // uma UICollectionView
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let cars: [ReturnCarModel] = [ CarModel.favoriteMock, CarModel.allMock ]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    // Deffinimos o DataSource e o Delegate via Storyboard
    private func configureCollectionView() {
        
        // Registrando a UICollectionView
        collectionView.register(CustomCollectionViewCell.nib, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        
        // Registrando o header
        collectionView.register(CustomCollectionReusableView.nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CustomCollectionReusableView.identifier)
    }

}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        cars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell
        
        
        guard let cell else {
            return UICollectionViewCell()
        }
        
        cell.setCars(cars[indexPath.section].items)
        
        return cell
    }
    
    // Essa e a section do header, mesmo exemplo da implementacao normal -> UICollectionReusableView
    // Criar um arquivo que conforme com UICollectionReusableView
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CustomCollectionReusableView.identifier, for: indexPath) as? CustomCollectionReusableView
        
        
        guard let header else {
            return UICollectionReusableView()
        }
        
        header.configure(cars[indexPath.section])
        
        return header
    }
    
}

// Dimens, nao precisa usar por ex.: viewController.anyDelegate = self
extension HomeController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // TODO: Tarefa 1
        // Deixar isso dinamico escala 16/9
        // Deixar dinamico para oustros dispositivos
        let spacing: CGFloat = 16
        return CGSize(width: collectionView.bounds.width - (spacing * 2), height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 32, height: 40)
    }
}

