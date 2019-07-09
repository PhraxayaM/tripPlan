//
//  Trip+CoreDataClass.swift
//  tripPlan
//
//  Created by MattHew Phraxayavong on 7/8/19.
//  Copyright © 2019 MattHew Phraxayavong. All rights reserved.
//
//

import Foundation
import CoreData
import MapKit

@objc(Trip)
public class Trip: NSManagedObject {
    
    func addWP(mapItem: MKMapItem)
    {
        waypoints?.append(mapItem)
    }
    func removeWP(index: Int)
    {
        waypoints?.remove(at: index)
    }

}
