//
//  Notes+CoreDataProperties.swift
//  SampleNotesApp
//
//  Created by Bhumika Patel on 20/09/23.
//
//

import Foundation
import CoreData


extension Notes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Notes> {
        return NSFetchRequest<Notes>(entityName: "Notes")
    }

    @NSManaged public var timestamp: Date?
    @NSManaged public var content: String?
    @NSManaged public var id: UUID?
    @NSManaged public var folder: Folder?
    
    public var unwrappedName: String {
        return content ?? ""
    }


}

extension Notes : Identifiable {

}
