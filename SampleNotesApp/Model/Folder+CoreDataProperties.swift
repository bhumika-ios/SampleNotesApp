//
//  Folder+CoreDataProperties.swift
//  SampleNotesApp
//
//  Created by Bhumika Patel on 20/09/23.
//
//

import Foundation
import CoreData


extension Folder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Folder> {
        return NSFetchRequest<Folder>(entityName: "Folder")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var notes: NSSet?
    
    public var notesArray: [Notes] {
        let notesSet = notes as? Set<Notes> ?? []
        
        return notesSet.sorted {
            $0.unwrappedName > $1.unwrappedName
        }
    }

}

// MARK: Generated accessors for notes
extension Folder {

    @objc(addNotesObject:)
    @NSManaged public func addToNotes(_ value: Notes)

    @objc(removeNotesObject:)
    @NSManaged public func removeFromNotes(_ value: Notes)

    @objc(addNotes:)
    @NSManaged public func addToNotes(_ values: NSSet)

    @objc(removeNotes:)
    @NSManaged public func removeFromNotes(_ values: NSSet)

}

extension Folder : Identifiable {

}
