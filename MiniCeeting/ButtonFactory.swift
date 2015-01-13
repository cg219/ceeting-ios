//
//  ButtonFactory.swift
//  MiniCeeting
//
//  Created by Clemente Gomez on 11/16/14.
//  Copyright (c) 2014 Clemente Gomez. All rights reserved.
//

import UIKit

struct ButtonFactory {
    var frame:CGRect = CGRect(x: 0, y: 0, width: 200, height: 75);
    
    func create(title: String) -> UIButton {
        var button:UIButton = UIButton(frame: frame);
        
        button.backgroundColor = UIColor(red: 0.5, green: 0.3, blue: 0.4, alpha: 1);
        button.layer.cornerRadius = 10;
        button.setTitle(title, forState: .Normal);
        
        return button;
    }
}
