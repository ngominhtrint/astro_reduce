//
//  ChannelListLocalDataManager.swift
//  Astro
//
//  Created by TriNgo on 10/31/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation
import CoreData

class ChannelListLocalDataManager: ChannelListLocalDataManagerInputProtocol {
    
    func retrieveChannelList() throws -> [Channel] {
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
    
        let request: NSFetchRequest<Channel> = NSFetchRequest(entityName: String(describing: Channel.self))
        return try managedOC.fetch(request)
    }
    
    func saveChannel(id: Int, name: String, logo: String, category: String, number: String) throws {
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        if let newChannel = NSEntityDescription.entity(forEntityName: "Channel", in: managedOC) {
            let channel = Channel(entity: newChannel, insertInto: managedOC)
            channel.id = Int32(id)
            channel.name = name
            channel.number = number
            channel.category = category
            channel.logo = logo
            
            try managedOC.save()
        }
        
        throw PersistenceError.couldNotSaveObject
    }
}
