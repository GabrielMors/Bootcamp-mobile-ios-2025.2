//
//  EmployeeTableViewCell.swift
//  TableView-Avancado
//
//  Created by Gabriel Mors Pulga on 08/10/25.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var jobLabel: UILabel!
    
    @IBOutlet weak var salaryLabel: UILabel!
    
    
    static let identifier: String = String(describing: EmployeeTableViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func setupCell(data: Employee) {
        userImageView.image = data.image
        nameLabel.text = "Nome: \(data.name)"
        ageLabel.text = "Idade: \(data.age)"
        jobLabel.text = "Cargo: \(data.job)"
        salaryLabel.text = "Salário: \(data.salary)"
    }
    
}
