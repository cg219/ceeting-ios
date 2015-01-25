//
//  SeatArray.swift
//  MiniCeeting
//
//  Created by Clemente Gomez on 1/17/15.
//  Copyright (c) 2015 Clemente Gomez. All rights reserved.
//

import UIKit

struct Array2D<T> {
    let columns: Int;
    let rows: Int;
    private var array: Array<T?>
    
    init(columns:Int, rows:Int){
        self.columns = columns;
        self.rows = rows;
        
        array = Array<T?>(count: rows*columns, repeatedValue: nil);
    }
    
    subscript(column:Int, row:Int) -> T?{
        get{
            return array[row*column + column];
        }
        set{
            array[row*column + column] = newValue;
        }
    }
}
