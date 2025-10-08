//
//  ViewController.swift
//  TableView
//
//  Created by Vagner Reis on 06/10/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var models: [Model] = Model.mock()
    
    var currentModel: Model?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: CustomTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue" {
            let detailsVC = segue.destination as? DetailsViewController
            detailsVC?.tempName = self.currentModel?.name
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        
        guard let cell else {
            return UITableViewCell()
        }
        
        cell.model = models[indexPath.row]
        
        cell.labelName.text = models[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentModel = models[indexPath.row]
        performSegue(withIdentifier: "detailsSegue", sender: self)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let message = self.models[indexPath.row].isFavorite ? "Retirar" : "Favoritar"
        
        let favoriteAction = UIContextualAction(style: .normal, title: message) { ac, view, handler in
            self.models[indexPath.row].isFavorite.toggle()
            tableView.reloadData()
            handler(true)
        }
        
        favoriteAction.backgroundColor = .blue
        
        let action = UISwipeActionsConfiguration(actions: [favoriteAction])
        
        return action
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
       
        let deleteAction = UIContextualAction(style: .destructive, title: "Remover") { ac, view, handler in
            self.models.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            handler(true)
        }
        
        let action = UISwipeActionsConfiguration(actions: [deleteAction])
        
        return action
    }
    
}

