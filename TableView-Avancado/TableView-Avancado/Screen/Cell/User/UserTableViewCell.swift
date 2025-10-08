//
//  UserTableViewCell.swift
//  TableView-Avancado
//
//  Created by Gabriel Mors Pulga on 08/10/25.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    static let identifier: String = String(describing: UserTableViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    //    nibName: nome do arquivo .xib (deve ser igual ao nome da classe).
    //    bundle: nil: significa que o arquivo está no main bundle (ou seja, dentro do app).
    //    Esse método basicamente “prepara” o arquivo XIB para ser usado no código.
        
    //    Você geralmente usa isso ao registrar células personalizadas em uma UITableView ou UICollectionView.
    //    Assim, a UITableView sabe:
    //        •    Qual XIB usar para criar a célula (através do nib()),
    //        •    E qual identificador associar a ela (através do identifier).
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        Como se fosse o viewDidLoad
    }
    
    public func setupCell(data: User) {
        nameLabel.text = data.name
        userImage.image = data.image
    }
    
}
