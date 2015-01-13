//
//  Extensions.swift
//  MiniCeeting
//
//  Created by Clemente Gomez on 11/16/14.
//  Copyright (c) 2014 Clemente Gomez. All rights reserved.
//

import UIKit

extension UIViewController{
    
    var buttonFactory:ButtonFactory { return ButtonFactory() }
    
    func addChild(child: UIView){
        self.view.addSubview(child);
    }
}