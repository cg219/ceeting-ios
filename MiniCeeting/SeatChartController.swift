//
//  ViewController.swift
//  MiniCeeting
//
//  Created by Clemente Gomez on 1/17/15.
//  Copyright (c) 2015 Clemente Gomez. All rights reserved.
//

import UIKit
import CoreData

class SeatChartController: UIViewController, UIPopoverPresentationControllerDelegate, UIPopoverControllerDelegate {
    
    let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate;
    let request:NSFetchRequest = NSFetchRequest();//NSFetchRequest(entityName: "Seat");
    var context: NSManagedObjectContext!;
    var entity: NSEntityDescription!;
    var storedSeats:[String: AnyObject] = Dictionary<String, AnyObject>();
    var seats:[SeatController] = [SeatController]();
    let notificationCenter = NSNotificationCenter.defaultCenter();
    let options = OptionsPanel();
    var splashShown = false;
    let imkreative = UIViewController();
    let imkreativeView = UIImageView(image: UIImage(named: "iPad-landscape.png"));
    
    var seatLayout:Array<[Int]> = [
        [1, 1, 1, 1, 1, 1, 1, 1, 1 ,1 ,1, 1, 1, 1, 1, 1, 1, 1, 1],
        [0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0],
        [0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0],
        [0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0],
        [0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0],
        [0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0],
        [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0],
        [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0],
        [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0],
        [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0]
    ];
    
    var seatNumbers:Array<[String]> = [
        ["K1", "K2", "K3", "K4", "K5", "K6", "K7", "K8", "K9", "K10", "K11", "K12", "K13", "K14", "K15", "K16", "K17", "K18", "K19"],
        ["nil", "nil", "J1", "J2", "J3", "J4", "J5", "J6", "J7", "J8", "J9", "J10", "J11", "J12", "J13", "J14", "J15", "nil", "nil"],
        ["nil", "nil", "I1", "I2", "I3", "I4", "I5", "I6", "I7", "I8", "I9", "I10", "I11", "I12", "I13", "I14", "I15", "nil", "nil"],
        ["nil", "nil", "H1", "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12", "H13", "H14", "H15", "nil", "nil"],
        ["nil", "nil", "G1", "G2", "G3", "G4", "G5", "G6", "G7", "G8", "G9", "G10", "G11", "G12", "G13", "G14", "G15", "nil", "nil"],
        ["nil", "nil", "F1", "nil", "nil", "nil", "F3", "F4", "nil", "nil", "nil", "F7", "F8", "nil", "nil", "nil", "F11", "nil", "nil"],
        ["nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil", "nil"],
        ["E1", "E2", "E3", "E4", "E5", "E6", "E7", "E8", "E9", "E10", "E11", "E12", "E13", "E14", "E15", "E16", "E17", "E18", "nil"],
        ["D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9", "D10", "D11", "D12", "D13", "D14", "D15", "D16", "D17", "D18", "nil"],
        ["C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "C10", "C11", "C12", "C13", "C14", "C15", "C16", "C17", "C18", "nil"],
        ["B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8", "B9", "B10", "B11", "B12", "B13", "B14", "B15", "B16", "B17", "B18", "nil"],
        ["A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9", "A10", "A11", "A12", "A13", "A14", "A15", "A16", "A17", "A18", "nil"]
    ];
    
    var seatLayer:UIView?;
    
//    var seatArray:Array2D<Int> = Array2D<Int>(columns: 19, rows: 11);
    
    required init(coder: NSCoder) {
        super.init(coder: coder);
        self.request.returnsObjectsAsFaults = false;
        self.context = appDelegate.managedObjectContext?;
        self.entity = NSEntityDescription.entityForName("Seat", inManagedObjectContext: self.context!);
        self.request.entity = self.entity;
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
        self.request.returnsObjectsAsFaults = false;
        self.context = appDelegate.managedObjectContext?;
        self.entity = NSEntityDescription.entityForName("Seat", inManagedObjectContext: self.context!);
        self.request.entity = self.entity;
    }
    
    override init() {
        super.init();
        self.request.returnsObjectsAsFaults = false;
        self.context = appDelegate.managedObjectContext?;
        self.entity = NSEntityDescription.entityForName("Seat", inManagedObjectContext: self.context!);
        self.request.entity = self.entity;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0, green: 0.06, blue: 0.1, alpha: 1);
        seatLayer = UIView( frame: CGRect(
            x: 40,
            y: 40,
            width: self.view.frame.size.width,
            height: self.view.frame.size.height));
        initSeats();
        addScreen();
        addTopBar();
        self.view.addSubview(seatLayer!);
        addLegend();
        imkreative.view.addSubview(imkreativeView);
        self.view.addSubview(imkreative.view);
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        if (!splashShown) {
            self.splashShown = true;
            UIView.animateWithDuration(0.5, delay: 1.0, options: .CurveEaseInOut, animations: { _ in
                    self.imkreative.view.alpha = 0;
                }, completion: { finished in
                    self.imkreative.view.removeFromSuperview();
            })
        }
    }
    
    func addScreen(){
        let screen = UIView(frame: CGRect(x: 40, y: UIScreen.mainScreen().bounds.size.height - 15.0, width: UIScreen.mainScreen().bounds.size.width - 80.0, height: 5));
        screen.backgroundColor = UIColor.whiteColor();
        self.view.addSubview(screen);
    }
    
    func addTopBar(){
        let screen = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.size.width, height: 20));
        screen.backgroundColor = UIColor.whiteColor();
        self.view.addSubview(screen);
    }
    
    func addLegend(){
        let optionsX = UIScreen.mainScreen().bounds.width - (options.view.frame.size.width + 40);
        let optionsY = UIScreen.mainScreen().bounds.height - (options.view.frame.size.height + 10);
        options.view.frame = CGRect(origin: CGPoint(x: optionsX, y: optionsY), size: options.view.frame.size);
        notificationCenter.addObserverForName("ResetButtonTouched", object: nil, queue: NSOperationQueue.mainQueue()){ _ in
            var alertView = UIAlertController(title: "Reset Seats", message: "Are you sure you want to reset all the seats? This can't be undone.", preferredStyle: UIAlertControllerStyle.Alert);
            alertView.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.Cancel, handler: nil))
            alertView.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.Default){ _ in
                self.resetSeats();
            })
            self.presentViewController(alertView, animated: true, completion: nil);
        }
        
        self.view.addSubview(options.view);
    }
    
    func addSeat(seat: SeatController){
        seatLayer!.addSubview(seat as UIView);
        seat.addTarget(self, action: "onSeatTouch:", forControlEvents: UIControlEvents.TouchUpInside);
    }
    
    func initSeats(){
        getSavedSeats()
        var seat:SeatController;
        for(row, rowArray) in enumerate(seatLayout){
            for(column, value) in enumerate(rowArray){
                if(value != 1){
                    continue
                }
                
                if let stored:SeatController = self.storedSeats[seatNumbers[row][column]] as? SeatController {
                    seats.append(stored)
                    addSeat(stored);
                    continue;
                }
                
                seat = SeatController(
                    frame: CGRect(
                        x: (column * 50),
                        y: (row * 50),
                        width: 40,
                        height: 40),
                    number: seatNumbers[row][column],
                    column: column,
                    row: row);
                seats.append(seat);
                addSeat(seat);
            }
        }
    }
    
    func getSavedSeats(){
        let savedSeats = self.context!.executeFetchRequest(request, error: nil) as [Seat]!;
        
        if(savedSeats.count > 0){
            for seat in savedSeats{
                var currentFrame = CGRect(
                    x: (seat.column.integerValue * 50),
                    y: (seat.row.integerValue * 50),
                    width: 40,
                    height: 40)
                var currentSeat = SeatController(frame: currentFrame, number: seat.seatNumber, column: seat.column.integerValue, row: seat.row.integerValue);
                currentSeat.changeSeat(SeatType(rawValue: seat.type)!);
                self.storedSeats[seat.seatNumber] = currentSeat;
            }
        }
    }
    
    func resetSeats(){
        for seat in self.seats{
            seat.changeSeat(.Normal);
        }
        
        let savedSeats = self.context!.executeFetchRequest(request, error: nil) as [Seat]!;
        if(savedSeats.count > 0){
            for seat in savedSeats{
                self.context.deleteObject(seat);
            }
        }
    }
    
    func onSeatTouch(seat:SeatController){
        println("Seat Touched");
        let popoverController:SeatOptionViewController = SeatOptionViewController(nibName: nil, bundle: nil);
        popoverController.modalPresentationStyle = .Popover;
        popoverController.preferredContentSize = CGSizeMake(100, 200);
        
        var popover = UIPopoverController(contentViewController: popoverController);
        popover.contentViewController = popoverController;
        popoverController.chartController = self;
        popoverController.seat = seat;
        popover.presentPopoverFromRect(seat.frame, inView: self.seatLayer!, permittedArrowDirections: .Any, animated: true);
    }
    
    func onSeatOptionPicked(seat:SeatController, option:SeatType){
        seat.changeSeat(option);
        
        var seatData = Seat(entity: self.entity, insertIntoManagedObjectContext: self.context);
        seatData.seatNumber = seat.attributes["seatNumber"] as String;
        seatData.row = seat.attributes["row"] as Int;
        seatData.column = seat.attributes["column"] as Int;
        seatData.type = seat.attributes["type"] as String;
        
        println(seatData);
        seatData.managedObjectContext?.save(nil);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

