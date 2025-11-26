//
//  HomeTableViewCell.swift
//  ViewCodeAula01
//
//  Created by Vagner Reis on 17/11/25.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: HomeTableViewCell.self)
    
    private lazy var yearLabel: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    private lazy var nameLabel: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
       
        addSubviews()
        configConstraints()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func addSubviews() {
        contentView.addSubview(yearLabel)
        contentView.addSubview(nameLabel)
        //addSubview(yearLabel)
        //addSubview(nameLabel)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            yearLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            yearLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            yearLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
            
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
            
        ])
    }
    
    func configure(_ car: CarModel) {
        yearLabel.text = "\(car.year)"
        nameLabel.text = car.name
    }

}
