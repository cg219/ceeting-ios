//
//  SeatController.swift
//  MiniCeeting
//
//  Created by Clemente Gomez on 1/17/15.
//  Copyright (c) 2015 Clemente Gomez. All rights reserved.
//

import UIKit

enum SeatType: String{
    case Normal = "NormalSeat.png"
    case Reserved = "ReservedSeat.png"
    case Taken = "TakenSeat.png"
    case Comped = "CompedSeat.png"
}

class SeatController: UIButton {
    
    let normalSeat = UIImage(named: SeatType.Normal.rawValue);
    let takenSeat = UIImage(named: SeatType.Taken.rawValue);
    let compedSeat = UIImage(named: SeatType.Comped.rawValue);
    let reservedSeat = UIImage(named: SeatType.Reserved.rawValue);
    var seatNumber:UILabel?;
    var currentSeat = SeatType.Normal;
    var attributes:Dictionary<String, AnyObject> = Dictionary(
        dictionaryLiteral:
            ("seatNumber", 0),
            ("row", 0),
            ("column", 0),
            ("type", 0)
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.setImage(normalSeat, forState: .Normal);
        self.seatNumber = UILabel(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height));
        self.seatNumber!.textAlignment = .Center;
        self.seatNumber!.font = UIFont(name: "Helvetica", size: 12);
        self.addSubview(self.seatNumber!);
    }
    
    convenience init(frame: CGRect, number:String, column:Int, row:Int) {
        self.init(frame: frame);
        self.setSeatNumber(number);
        self.attributes.updateValue(number, forKey: "seatNumber");
        self.attributes.updateValue(row, forKey: "row");
        self.attributes.updateValue(column, forKey: "column");
        self.attributes.updateValue(currentSeat.rawValue, forKey: "type");
    }

    required init(coder: NSCoder) {
        super.init(coder: coder);
    }
    
    func changeSeat(type:SeatType){
        switch type{
            case SeatType.Normal:
                self.setImage(normalSeat, forState: .Normal);
                currentSeat = SeatType.Taken;
            case SeatType.Reserved:
                self.setImage(reservedSeat, forState: .Normal);
                currentSeat = SeatType.Reserved;
            case SeatType.Comped:
                self.setImage(compedSeat, forState: .Normal);
                currentSeat = SeatType.Comped;
            case SeatType.Taken:
                self.setImage(takenSeat, forState: .Normal);
                currentSeat = SeatType.Taken;
        }
        self.attributes.updateValue(currentSeat.rawValue, forKey: "type");
    }
    
    func setSeatNumber(number:String){
        self.seatNumber!.text = number;
    }
}
