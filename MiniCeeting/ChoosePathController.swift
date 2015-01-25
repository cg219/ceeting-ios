//
//  ViewController.swift
//  MiniCeeting
//
//  Created by Clemente Gomez on 11/8/14.
//  Copyright (c) 2014 Clemente Gomez. All rights reserved.
//

import UIKit
import Crashlytics

class ChoosePathController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let createButton = buttonFactory.create("Create Seating Chart");
        
        createButton.addTarget(self, action: "onCreateTouch:", forControlEvents: UIControlEvents.TouchUpInside);
        
        createButton.frame.origin = CGPoint(
            x: (self.view.frame.width * 0.5) - (createButton.frame.width * 0.5),
            y: (self.view.frame.height * 0.5) - (createButton.frame.height * 0.5));
        
        addChild(createButton);
    }
    
    func onCreateTouch(target : UIButton){
        UIApplication.sharedApplication().delegate?.window??.rootViewController = CreateSeatingChartController();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

