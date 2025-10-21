//
//  HomeViewController.swift
//  ViewCodeAula01
//
//  Created by Vagner Reis on 20/10/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    var user: UserModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        print("Email: ", user?.email)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
