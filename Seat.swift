//
//  Seat.swift
//  MiniCeeting
//
//  Created by Clemente Gomez on 1/24/15.
//  Copyright (c) 2015 Clemente Gomez. All rights reserved.
//

import Foundation
import CoreData

@objc(Seat)

class Seat: NSManagedObject {

    @NSManaged var column: NSNumber
    @NSManaged var row: NSNumber
    @NSManaged var seatNumber: String
    @NSManaged var type: String

}
