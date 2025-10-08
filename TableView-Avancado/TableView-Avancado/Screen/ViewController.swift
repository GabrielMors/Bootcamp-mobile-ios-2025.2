//
//  ViewController.swift
//  TableView-Avancado
//
//  Created by Gabriel Mors Pulga on 08/10/25.
//

import UIKit

// 1 - Criar sua TableView
// 2 - Fazer conexão
// 3 - ASSINAR os protocolos ( UITableViewDelegate, UITableViewDataSource)
// 4 - Criar sua célula
// 5 - Criar o modelo
// 6 - Criar identifier da célula
// 7 - Registrar nossa célula
// 8 - Popular nossa célula na tableView
// 9 - Retornar nossa célula

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var employeeList: [Employee] = [
                                    Employee(name: "Vagner Reis", age: 30, job: "iOS Developer", salary: "R$: 10.000,00", image: UIImage(systemName: "person.circle.fill") ?? UIImage()),
                                    Employee(name: "Diego Fernando", age: 30, job: "iOS Developer", salary: "R$: 20.000,00", image: UIImage(systemName: "person.circle.fill") ?? UIImage()),
                                    Employee(name: "Jade", age: 30, job: "iOS Developer", salary: "R$: 19.000,00", image: UIImage(systemName: "person.circle.fill") ?? UIImage()),
                                    Employee(name: "Gabriel Mors", age: 30, job: "iOS Developer", salary: "R$: 1.000,00", image: UIImage(systemName: "person.circle.fill") ?? UIImage()),
                                    Employee(name: "Vagner Reis", age: 30, job: "iOS Developer", salary: "R$: 10.000,00", image: UIImage(systemName: "person.circle.fill") ?? UIImage()),
                                    Employee(name: "Diego Fernando", age: 30, job: "iOS Developer", salary: "R$: 20.000,00", image: UIImage(systemName: "person.circle.fill") ?? UIImage()),
                                    Employee(name: "Jade", age: 30, job: "iOS Developer", salary: "R$: 19.000,00", image: UIImage(systemName: "person.circle.fill") ?? UIImage()),
                                    Employee(name: "Vagner Reis", age: 30, job: "iOS Developer", salary: "R$: 10.000,00", image: UIImage(systemName: "person.circle.fill") ?? UIImage()),
                                    Employee(name: "Diego Fernando", age: 30, job: "iOS Developer", salary: "R$: 20.000,00", image: UIImage(systemName: "person.circle.fill") ?? UIImage()),
                                    Employee(name: "Jade", age: 30, job: "iOS Developer", salary: "R$: 19.000,00", image: UIImage(systemName: "person.circle.fill") ?? UIImage()),
                                    Employee(name: "Gabriel Mors", age: 30, job: "iOS Developer", salary: "R$: 1.000,00", image: UIImage(systemName: "person.circle.fill") ?? UIImage()),
                                    Employee(name: "Vagner Reis", age: 30, job: "iOS Developer", salary: "R$: 10.000,00", image: UIImage(systemName: "person.circle.fill") ?? UIImage()),
                                    Employee(name: "Diego Fernando", age: 30, job: "iOS Developer", salary: "R$: 20.000,00", image: UIImage(systemName: "person.circle.fill") ?? UIImage()),
                                    Employee(name: "Jade", age: 30, job: "iOS Developer", salary: "R$: 19.000,00", image: UIImage(systemName: "person.circle.fill") ?? UIImage()),
]

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UserTableViewCell.nib(), forCellReuseIdentifier: UserTableViewCell.identifier)
        tableView.register(EmployeeTableViewCell.nib(), forCellReuseIdentifier: EmployeeTableViewCell.identifier)
    }


}

//UITableViewDataSource
//Fornece os dados que a tabela vai mostrar.
//Pensa nele como o “garçom dos dados” — ele diz quantas linhas tem e o que vai dentro de cada célula.

//UITableViewDelegate
//Controla o comportamento e a aparência da tabela.
//Pensa nele como o “supervisor de interação” — ele cuida do que acontece quando o usuário toca, rola ou seleciona algo.

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + employeeList.endIndex
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell
            cell?.setupCell(data: User(image: UIImage(systemName: "person.fill") ?? UIImage(), name: "Gabriel Mors"))
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.identifier, for: indexPath) as? EmployeeTableViewCell
            cell?.setupCell(data: employeeList[indexPath.row - 1])
            return cell ?? UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 150
        } else {
            return 250
        }
    }
    
}
