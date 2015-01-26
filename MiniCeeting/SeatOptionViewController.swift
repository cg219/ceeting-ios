//
//  SeatOptionViewController.swift
//  MiniCeeting
//
//  Created by Clemente Gomez on 1/24/15.
//  Copyright (c) 2015 Clemente Gomez. All rights reserved.
//

import UIKit

class SeatOptionViewController: UIViewController{
    var selectedOption:SeatType?;
    var chartController:SeatChartController?;
    var seat:SeatController?;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.view.backgroundColor = UIColor.whiteColor();
        
        let empty:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50));
        empty.setTitle("Empty Seat", forState: .Normal);
        empty.titleLabel?.font = UIFont(name: "Helvetica", size: 12);
        empty.setTitleColor(UIColor(red: 0, green: 0.06, blue: 0.1, alpha: 1), forState: .Normal);
        empty.addTarget(self, action: "chooseEmpty", forControlEvents: UIControlEvents.TouchUpInside);
        empty.addTarget(self, action: "onTouchDown:", forControlEvents: UIControlEvents.TouchDown);
        empty.addTarget(self, action: "onTouchUp:", forControlEvents: UIControlEvents.TouchUpInside);
        empty.addTarget(self, action: "onTouchUp:", forControlEvents: UIControlEvents.TouchUpOutside);
        
        let reserved:UIButton = UIButton(frame: CGRect(x: 0, y: 50, width: 100, height: 50));
        reserved.setTitle("Reserved Seat", forState: .Normal);
        reserved.titleLabel?.font = UIFont(name: "Helvetica", size: 12);
        reserved.setTitleColor(UIColor(red: 0, green: 0.06, blue: 0.1, alpha: 1), forState: .Normal);
        reserved.addTarget(self, action: "chooseReserved", forControlEvents: UIControlEvents.TouchUpInside);
        reserved.addTarget(self, action: "onTouchDown:", forControlEvents: UIControlEvents.TouchDown);
        reserved.addTarget(self, action: "onTouchUp:", forControlEvents: UIControlEvents.TouchUpInside);
        reserved.addTarget(self, action: "onTouchUp:", forControlEvents: UIControlEvents.TouchUpOutside);
        
        let comped:UIButton = UIButton(frame: CGRect(x: 0, y: 100, width: 100, height: 50));
        comped.setTitle("Comped Seat", forState: .Normal);
        comped.titleLabel?.font = UIFont(name: "Helvetica", size: 12);
        comped.setTitleColor(UIColor(red: 0, green: 0.06, blue: 0.1, alpha: 1), forState: .Normal);
        comped.addTarget(self, action: "chooseComped", forControlEvents: UIControlEvents.TouchUpInside);
        comped.addTarget(self, action: "onTouchDown:", forControlEvents: UIControlEvents.TouchDown);
        comped.addTarget(self, action: "onTouchUp:", forControlEvents: UIControlEvents.TouchUpInside);
        comped.addTarget(self, action: "onTouchUp:", forControlEvents: UIControlEvents.TouchUpOutside);
        
        let taken:UIButton = UIButton(frame: CGRect(x: 0, y: 150, width: 100, height: 50));
        taken.setTitle("Taken Seat", forState: .Normal);
        taken.titleLabel?.font = UIFont(name: "Helvetica", size: 12);
        taken.setTitleColor(UIColor(red: 0, green: 0.06, blue: 0.1, alpha: 1), forState: .Normal);
        taken.addTarget(self, action: "chooseTaken", forControlEvents: UIControlEvents.TouchUpInside);
        taken.addTarget(self, action: "onTouchDown:", forControlEvents: UIControlEvents.TouchDown);
        taken.addTarget(self, action: "onTouchUp:", forControlEvents: UIControlEvents.TouchUpInside);
        taken.addTarget(self, action: "onTouchUp:", forControlEvents: UIControlEvents.TouchUpOutside);
        
        self.view.addSubview(empty);
        self.view.addSubview(reserved);
        self.view.addSubview(comped);
        self.view.addSubview(taken);
    }
    
    func sendOption(){
        var controller = self.chartController;
        self.chartController?.onSeatOptionPicked(seat!, option: selectedOption!);
    }
    
    func chooseEmpty(){
        selectedOption = .Normal;
        self.dismissViewControllerAnimated(true, completion: {
            self.sendOption();
        })
    }
    
    func chooseReserved(){
        selectedOption = .Reserved;
        self.dismissViewControllerAnimated(true, completion: {
            self.sendOption();
        })
    }
    
    func chooseComped(){
        selectedOption = .Comped;
        self.dismissViewControllerAnimated(true, completion: {
            self.sendOption();
        })
    }
    
    func chooseTaken(){
        selectedOption = .Taken;
        self.dismissViewControllerAnimated(true, completion: {
            self.sendOption();
        })
    }
    
    func onTouchDown(button:UIButton){
        button.backgroundColor = UIColor.lightGrayColor();
    }
    
    func onTouchUp(button:UIButton){
        button.backgroundColor = UIColor.clearColor();
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
}
