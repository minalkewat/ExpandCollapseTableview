//
//  DataModel.swift
//  ExpandCollapseTableview
//
//  Created by Meenal Kewat on 3/2/19.
//  Copyright © 2019 Happykrafts Innovations. All rights reserved.
//

import Foundation

class DataModel{
    
    var headerName:String?
    var subType = [String]()
    var isExpandable:Bool = false
    
    init(headerName:String, subType:[String], isExpandable:Bool) {
        self.headerName = headerName
        self.subType = subType
        self.isExpandable = isExpandable
    }
}
