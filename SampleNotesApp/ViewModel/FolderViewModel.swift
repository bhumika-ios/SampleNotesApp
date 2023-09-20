//
//  FolderViewModel.swift
//  SampleNotesApp
//
//  Created by Bhumika Patel on 20/09/23.
//

import Foundation
import CoreData

class FolderViewModel: ObservableObject {
    private let viewContext = PersistenceController.shared.viewContext
    @Published var folderArray: [Folder] = []
    
    init() {
        fetchFolderData()
    }
    
    func fetchFolderData() {
        let request = NSFetchRequest<Folder>(entityName: "Folder")
        
        do {
            folderArray = try viewContext.fetch(request)
        }catch {
            print("DEBUG: Some error occured while fetching")
        }
    }
    
    func addDataToCoreData(folderTitle: String) {
        let folder = Folder(context: viewContext)
        folder.id = UUID()
        folder.title = folderTitle
       // company.owner = companyOwner
        
        save()
        self.fetchFolderData()
    }
    
    func save() {
        do {
            try viewContext.save()
        }catch {
            print("Error saving")
        }
    }
}
