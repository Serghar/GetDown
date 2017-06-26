//
//  InterfaceButton.swift
//  GetDown
//
//  Created by Dylan Sharkey on 6/26/17.
//  Copyright © 2017 Dylan Sharkey. All rights reserved.
//

import UIKit

class InterfaceButton: UIButton {
    init(tag: Int){
        super.init(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        let FixedAspectRatio = NSLayoutConstraint(item: self,
                                                  attribute: NSLayoutAttribute.height,
                                                  relatedBy: NSLayoutRelation.equal,
                                                  toItem: self,
                                                  attribute: NSLayoutAttribute.width,
                                                  multiplier: 1.0,
                                                  constant: 0)
        FixedAspectRatio.priority = 1000
        self.addConstraint(FixedAspectRatio)
        self.tag = tag
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
