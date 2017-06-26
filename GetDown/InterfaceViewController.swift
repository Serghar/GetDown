//
//  ViewController.swift
//  GetDown
//
//  Created by Dylan Sharkey on 5/8/17.
//  Copyright © 2017 Dylan Sharkey. All rights reserved.
//

import UIKit

class InterfaceViewController: UIViewController {
    
    //IBOutlets
    @IBOutlet weak var horizontalStack: UIStackView!
    
    //CLASS CONSTS
    let VERT_STACK_SPACING: CGFloat = 10
    let EST_BUTTON_SIZE: CGFloat = 100.0
    
    //CLASS VARS
    var verticalStacks: [UIStackView]? //Maybe dont need, can possibly use horizontal stack arranged subviews
    var numButtonsPerRow: Int = 3
    var numRows: Int = 2
    var playMode: Bool = false
    
    
    //################################################
    //###############Class Methods####################
    //################################################
    override func viewDidLoad() {
        //Map number of rows and columns to screenSize
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        let height = bounds.size.height - (self.navigationController?.navigationBar.frame.size.height)!
        numRows = Int(floor(width / EST_BUTTON_SIZE))
        numButtonsPerRow = Int(floor(height / EST_BUTTON_SIZE))
        
        for x in 0..<numRows {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.distribution = .fillEqually //This keeps the button ratio intact
            stack.spacing = VERT_STACK_SPACING
            stack.tag = x
            
            //Add buttons to the new vertical stack
            for y in 0..<numButtonsPerRow {
                let button = InterfaceButton(tag: y)
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(interfaceButtonPressed(sender:)))
                let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(interfaceButtonPressedAndHeld(sender:)))
                button.addGestureRecognizer(tapGesture)
                button.addGestureRecognizer(longGesture)
                
                stack.addArrangedSubview(button)
            }
            horizontalStack.addArrangedSubview(stack)
            verticalStacks?.append(stack)
        }
    }
    
    func interfaceButtonPressed(sender: UITapGestureRecognizer) {
        let button = sender.view as! UIButton
        print("\(button.tag) is the current button Number")
    }
    
    func interfaceButtonPressedAndHeld(sender: UITapGestureRecognizer) {
        if (sender.state == .began){
            let button = sender.view as! UIButton
            print("Held button with tag \(button.tag)")
            if(!playMode){
                //Segue to button Edit Screen
                performSegue(withIdentifier: "mappingSegue", sender: button)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "mappingSegue"){
            let destination = segue.destination as! MappingTableViewController
            destination.selectedButton = sender as! InterfaceButton
        }
    }

}

