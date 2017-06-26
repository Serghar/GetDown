//
//  MappingViewController.swift
//  GetDown
//
//  Created by Dylan Sharkey on 6/26/17.
//  Copyright © 2017 Dylan Sharkey. All rights reserved.
//

import UIKit

class MappingTableViewController: UITableViewController {
    var selectedButton: InterfaceButton!
    
    @IBOutlet weak var primaryColorButton: UIButton!
    @IBOutlet weak var activeColorButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Trying to set a border
        primaryColorButton.layer.borderColor = UIColor.black.cgColor
        primaryColorButton.layer.borderWidth = 1.0
        primaryColorButton.layer.cornerRadius = 5
        primaryColorButton.layer.masksToBounds = true
        
        activeColorButton.layer.borderColor = UIColor.black.cgColor
        activeColorButton.layer.borderWidth = 1.0
        activeColorButton.layer.cornerRadius = 5
        activeColorButton.layer.masksToBounds = true
    }
    
    @IBAction func SetSampleButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "mediaSampleSegue", sender: self)
    }
}
