//
//  CreateSeatingChartController.swift
//  MiniCeeting
//
//  Created by Clemente Gomez on 11/12/14.
//  Copyright (c) 2014 Clemente Gomez. All rights reserved.
//

import Foundation
import UIKit

class CreateSeatingChartController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad();
        
        let createSectionButton:UIButton = buttonFactory.create("Create Section");
        let homeButton:UIButton = buttonFactory.create("Home");
        
        homeButton.addTarget(
            self,
            action: "onHomeTouch:",
            forControlEvents: UIControlEvents.TouchUpInside);
        
        createSectionButton.frame.origin = CGPoint(x: 10, y: 10);
        homeButton.frame.origin = CGPoint(
            x: ((view.frame.width * 0.5) - (homeButton.frame.width * 0.5)),
            y: view.frame.height - homeButton.frame.height - 10);
        
        addChild(createSectionButton);
        addChild(homeButton);
    }
    
    func onHomeTouch(target : UIButton){
        UIApplication.sharedApplication().delegate?.window??.rootViewController = ChoosePathController();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
}
