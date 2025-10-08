//
//  DetailsViewController.swift
//  TableView
//
//  Created by Vagner Reis on 06/10/25.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var labelName: UILabel!
    
    var tempName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelName.text = self.tempName
    }


}
