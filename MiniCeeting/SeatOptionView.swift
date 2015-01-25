//
//  SeatOptionView.swift
//  MiniCeeting
//
//  Created by Clemente Gomez on 1/24/15.
//  Copyright (c) 2015 Clemente Gomez. All rights reserved.
//

import UIKit

class SeatOptionView: UIView{
    var selectedOption:SeatType?;
    var popoverController:UIPopoverController?;
    var controller:UIViewController?;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        self.backgroundColor = UIColor.blackColor();
        self.frame = frame;
        
        let empty:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50));
        empty.setTitle("Empty Seat", forState: .Normal);
        empty.titleLabel?.font = UIFont(name: "Helvetica", size: 12);
        empty.addTarget(self, action: "chooseEmpty", forControlEvents: UIControlEvents.TouchUpInside);
        empty.addTarget(self, action: "onTouchDown:", forControlEvents: UIControlEvents.TouchDown);
        empty.addTarget(self, action: "onTouchUp:", forControlEvents: UIControlEvents.TouchUpInside);
        empty.addTarget(self, action: "onTouchUp:", forControlEvents: UIControlEvents.TouchUpOutside);
        
        let reserved:UIButton = UIButton(frame: CGRect(x: 0, y: 50, width: 100, height: 50));
        reserved.setTitle("Reserved Seat", forState: .Normal);
        reserved.titleLabel?.font = UIFont(name: "Helvetica", size: 12);
        reserved.addTarget(self, action: "chooseReserved", forControlEvents: UIControlEvents.TouchUpInside);
        reserved.addTarget(self, action: "onTouchDown:", forControlEvents: UIControlEvents.TouchDown);
        reserved.addTarget(self, action: "onTouchUp:", forControlEvents: UIControlEvents.TouchUpInside);
        reserved.addTarget(self, action: "onTouchUp:", forControlEvents: UIControlEvents.TouchUpOutside);
        
        let comped:UIButton = UIButton(frame: CGRect(x: 0, y: 100, width: 100, height: 50));
        comped.setTitle("Comped Seat", forState: .Normal);
        comped.titleLabel?.font = UIFont(name: "Helvetica", size: 12);
        comped.addTarget(self, action: "chooseComped", forControlEvents: UIControlEvents.TouchUpInside);
        comped.addTarget(self, action: "onTouchDown:", forControlEvents: UIControlEvents.TouchDown);
        comped.addTarget(self, action: "onTouchUp:", forControlEvents: UIControlEvents.TouchUpInside);
        comped.addTarget(self, action: "onTouchUp:", forControlEvents: UIControlEvents.TouchUpOutside);
        
        let taken:UIButton = UIButton(frame: CGRect(x: 0, y: 150, width: 100, height: 50));
        taken.setTitle("Taken Seat", forState: .Normal);
        taken.titleLabel?.font = UIFont(name: "Helvetica", size: 12);
        taken.addTarget(self, action: "chooseTaken", forControlEvents: UIControlEvents.TouchUpInside);
        taken.addTarget(self, action: "onTouchDown:", forControlEvents: UIControlEvents.TouchDown);
        taken.addTarget(self, action: "onTouchUp:", forControlEvents: UIControlEvents.TouchUpInside);
        taken.addTarget(self, action: "onTouchUp:", forControlEvents: UIControlEvents.TouchUpOutside);
        
        self.addSubview(empty);
        self.addSubview(reserved);
        self.addSubview(comped);
        self.addSubview(taken);
    }
    
    func chooseEmpty(){
        selectedOption = .Normal;
        println(self.popoverController);
        controller?.dismissViewControllerAnimated(true, completion: nil);
        //        self.popoverController?.dismissPopoverAnimated(true);
    }
    
    func chooseReserved(){
        selectedOption = .Reserved;
        controller?.dismissViewControllerAnimated(true, completion: nil);
    }
    
    func chooseComped(){
        selectedOption = .Comped;
        controller?.dismissViewControllerAnimated(true, completion: nil);
    }
    
    func chooseTaken(){
        selectedOption = .Taken;
        controller?.dismissViewControllerAnimated(true, completion: nil);
    }
    
    func onTouchDown(button:UIButton){
        button.backgroundColor = UIColor.lightGrayColor();
    }
    
    func onTouchUp(button:UIButton){
        button.backgroundColor = UIColor.clearColor();
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
