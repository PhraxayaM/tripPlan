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
  

    enum Keys: String {
        case name = "name"
    
    }
    
    init(name: String) {

        
        self.name = name

    }
    
    // Protocol requires an encode method to encode our variables based on the Key
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
      
    }
    
    // Protocol requires an init method which acts as a decoder for our variables based on the Key
    public required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        super.init()
    }
    
}
