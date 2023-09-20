//
//  NotesViewModel.swift
//  SampleNotesApp
//
//  Created by Bhumika Patel on 20/09/23.
//


import Foundation
import CoreData

class NotesViewModel: ObservableObject {
    private let viewContext = PersistenceController.shared.viewContext
    @Published var notesArray = [Notes]()
    
    
    var folder: Folder // (NSManagedObject)
    
    init(folder: Folder) {
        self.folder = folder
    }
    
    func fetchNotes() {
        notesArray = folder.notesArray
    }
    
    func addNotes(notesName: String) {
        let notes = Notes(context: viewContext)
        notes.id = UUID()
        notes.content = notesName
        
        folder.addToNotes(notes)
        save()
        fetchNotes()
    }
    
    func save() {
        do {
            try viewContext.save()
        }catch {
            print("Error saving")
        }
    }
}
