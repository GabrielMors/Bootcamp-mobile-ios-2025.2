//
//  HomeScreen.swift
//  ViewCodeAula01
//
//  Created by Vagner Reis on 17/11/25.
//

import Foundation
import UIKit

class HomeScreen: UIView {
    
    weak var delegate: HomeScreenDelegate?
    
    // MARK: Properties
    // Atributos devem ficar antes do construtor
    private lazy var exitButton: UIButton = {
        
        let button = UIButton(type: .system)
        
        button.setTitle("Sair", for: .normal)
        button.addTarget(self, action: #selector(didTapExit), for: .touchUpInside)
        
        return button
        
    }()
    
    private lazy var tableView: UITableView = {
        
        let tbView = UITableView()
        
        tbView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        
        return tbView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        removeTranslatesAutoresizingMaskIntoConstraints()
        
        addSubviews()
        configConstraints()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    
    // MARK: Private Methods
    @objc
    private func didTapExit() {
        delegate?.didTapExit()
    }
    
    private func addSubviews() {
        addSubview(tableView)
        //addSubview(exitButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
//            exitButton.centerXAnchor.constraint(equalTo: centerXAnchor),
//            exitButton.centerYAnchor.constraint(equalTo: centerYAnchor)
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func removeTranslatesAutoresizingMaskIntoConstraints() {
        subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    // MARK: Public Methods
    func setTableViewDelegates(_ delegate: UITableViewDelegate, _ dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
}

protocol HomeScreenDelegate: AnyObject {
    func didTapExit()
}
