//
//  SingleNotesViewModel.swift
//  SampleNotesApp
//
//  Created by Bhumika Patel on 25/09/23.
//

import Foundation
import CoreData

class SingleNotesViewModel: ObservableObject {
    private let viewContext = PersistenceController.shared.viewContext
    @Published var snotesArray: [Notes] = []
    
    init() {
        fetchSingleNotesData()
    }
    
    func fetchSingleNotesData() {
        let request = NSFetchRequest<Notes>(entityName: "Notes")
        
        do {
            snotesArray = try viewContext.fetch(request)
        }catch {
            print("DEBUG: Some error occured while fetching")
        }
    }
    
    func addDataToCoreData(snotesContent: String) {
        let sNotes = Notes(context: viewContext)
        sNotes.id = UUID()
        sNotes.content = snotesContent
       // company.owner = companyOwner
        
        save()
        self.fetchSingleNotesData()
    }
    
    func save() {
        do {
            try viewContext.save()
        }catch {
            print("Error saving")
        }
    }
}
