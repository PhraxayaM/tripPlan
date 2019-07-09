//
//  mapItem.swift
//  
//
//  Created by MattHew Phraxayavong on 7/8/19.
//

import Foundation
import UIKit

public class mapItem: NSObject, NSCoding {
    
    var name: String
    var xLoc: String?
    var yLoc: String?
    
    enum Keys: String {
        case name = "name"
        case xLoc = "xLoc"
        case yLoc = "yLoc"
        
    }
    
    init(name: String, xLoc: String?, yLoc: String?) {
      
        self.name = name
        self.xLoc = xLoc
        self.yLoc = yLoc
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(xLoc, forKey: "xLoc")
        aCoder.encode(yLoc, forKey: "yLoc")
    }
    public required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        xLoc = aDecoder.decodeObject(forKey: "xLoc") as? String
        yLoc = aDecoder.decodeObject(forKey: "yLoc") as? String
        super.init()
    }
    
}
