//
//  OptionsPanel.swift
//  MiniCeeting
//
//  Created by Clemente Gomez on 1/25/15.
//  Copyright (c) 2015 Clemente Gomez. All rights reserved.
//

import UIKit

class OptionsPanel: UIViewController {
    
    let legendView = UIView(frame: CGRect(x: 0, y: 30, width: 175, height: 60));
    let notificationCenter = NSNotificationCenter.defaultCenter();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var resetButton =  UIButton(frame: CGRect(x: 30, y: 0, width: 100, height: 20));
        resetButton.setTitle("Reset Seats", forState: .Normal);
        resetButton.titleLabel?.font = UIFont(name: "Helvetica", size: 12);
        resetButton.backgroundColor = UIColor.whiteColor();
        resetButton.setTitleColor(UIColor.blackColor(), forState: .Normal);
        resetButton.layer.cornerRadius = 3.0;
        resetButton.addTarget(self, action: "onResetTouched:", forControlEvents: UIControlEvents.TouchUpInside);
        
        let normalView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 60));
        let normalLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 20));
        let normalImage = UIImageView(image: UIImage(named: SeatType.Normal.rawValue));
        
        let reservedView = UIView(frame: CGRect(x: 45, y: 0, width: 40, height: 60));
        let reservedLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 20));
        let reservedImage = UIImageView(image: UIImage(named: SeatType.Reserved.rawValue));
        
        let compedView = UIView(frame: CGRect(x: 90, y: 0, width: 40, height: 60));
        let compedLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 20));
        let compedImage = UIImageView(image: UIImage(named: SeatType.Comped.rawValue));
        
        let takenView = UIView(frame: CGRect(x: 135, y: 0, width: 40, height: 60));
        let takenLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 20));
        let takenImage = UIImageView(image: UIImage(named: SeatType.Taken.rawValue));
        
        normalLabel.text = "Empty";
        normalLabel.textAlignment = .Center;
        normalLabel.font = UIFont(name: "Helvetica", size: 10);
        normalLabel.textColor = UIColor.whiteColor();
        normalImage.frame = CGRect(x: 10, y: 20, width: 20, height: 20);
        
        reservedLabel.text = "RSVP";
        reservedLabel.textAlignment = .Center;
        reservedLabel.font = UIFont(name: "Helvetica", size: 10);
        reservedLabel.textColor = UIColor.whiteColor();
        reservedImage.frame = (CGRect(x: 10, y: 20, width: 20, height: 20));
        
        compedLabel.text = "Comped";
        compedLabel.textAlignment = .Center;
        compedLabel.textColor = UIColor.whiteColor();
        compedLabel.font = UIFont(name: "Helvetica", size: 10);
        compedImage.frame = (CGRect(x: 10, y: 20, width: 20, height: 20));
        
        takenLabel.text = "Taken";
        takenLabel.textAlignment = .Center;
        takenLabel.font = UIFont(name: "Helvetica", size: 10);
        takenLabel.textColor = UIColor.whiteColor();
        takenImage.frame = (CGRect(x: 10, y: 20, width: 20, height: 20));
        
        normalView.addSubview(normalLabel);
        normalView.addSubview(normalImage);
        
        reservedView.addSubview(reservedLabel);
        reservedView.addSubview(reservedImage);
        
        compedView.addSubview(compedLabel);
        compedView.addSubview(compedImage);
        
        takenView.addSubview(takenLabel);
        takenView.addSubview(takenImage);
        
        legendView.addSubview(normalView);
        legendView.addSubview(reservedView);
        legendView.addSubview(compedView);
        legendView.addSubview(takenView);
        
        self.view.addSubview(resetButton);
        self.view.addSubview(legendView);
    }
    
    func onResetTouched(sender:UIButton){
        notificationCenter.postNotificationName("ResetButtonTouched", object: nil);
    }
    
    override func didReceiveMemoryWarning() {
        print("Memorty Error")
        super.didReceiveMemoryWarning();
    }
}
