//
//  SampleNotesAppApp.swift
//  SampleNotesApp
//
//  Created by Bhumika Patel on 20/09/23.
//

import SwiftUI

@main
struct SampleNotesAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
