//
//  Player+CoreDataProperties.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 23/2/23.
//
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player")
    }

    @NSManaged public var playerId: Int32
    @NSManaged public var playerName: String?
    @NSManaged public var playerImage: String?
    @NSManaged public var country: String?

}

extension Player : Identifiable {

}
