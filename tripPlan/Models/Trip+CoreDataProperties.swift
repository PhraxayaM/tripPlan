//
//  Trip+CoreDataProperties.swift
//  tripPlan
//
//  Created by MattHew Phraxayavong on 7/8/19.
//  Copyright © 2019 MattHew Phraxayavong. All rights reserved.
//
//

import Foundation
import CoreData
import MapKit


extension Trip {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Trip> {
        return NSFetchRequest<Trip>(entityName: "Trip")
    }

    @NSManaged public var tripname: String?
    @NSManaged public var waypoints: [MKMapItem]?

}
