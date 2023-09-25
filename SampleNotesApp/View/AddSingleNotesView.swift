//
//  AddSingleNotesView.swift
//  SampleNotesApp
//
//  Created by Bhumika Patel on 25/09/23.
//

import SwiftUI
import CoreData

struct AddSingleNoteView: View {
    @State private var noteText: String = ""
    @StateObject var viewModel1 = SingleNotesViewModel()
    @Binding var showAddFullSheet: Bool
    var body: some View {
        VStack {
            Text("Add a Single Note")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            TextEditor(text: $noteText)
                .frame(minHeight: 200)
                .padding()
            
            Button("Save Note") {
                viewModel1.addDataToCoreData(snotesContent: noteText)
                self.noteText = ""
                showAddFullSheet.toggle()
                // For example: presentationMode.wrappedValue.dismiss()
            }
            .font(.headline)
            .padding()
            
            Spacer()
        }
    }
}


//struct AddSingleNoteView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddSingleNoteView()
//    }
//}
