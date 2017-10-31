//
//  Channel+CoreDataProperties.swift
//  Astro
//
//  Created by TriNgo on 10/31/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation
import CoreData

extension Channel {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Channel> {
        return NSFetchRequest<Channel>(entityName: "Channel")
    }
    
    @NSManaged public var favorited: NSNumber?
    @NSManaged public var category: String?
    @NSManaged public var number: String?
    @NSManaged public var logo: String?
    @NSManaged public var name: String?
    @NSManaged public var id: Int32
}
