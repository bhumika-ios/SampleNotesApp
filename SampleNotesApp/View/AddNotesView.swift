//
//  AddNotesView.swift
//  SampleNotesApp
//
//  Created by Bhumika Patel on 20/09/23.
//

import SwiftUI

struct AddNotesView: View {
    @ObservedObject var viewModel : NotesViewModel
    @State var notesName: String = ""
    @Binding var showAddFullSheet: Bool
//    init(folder: Folder) {
//        self.viewModel = NotesViewModel(folder: folder)
//        viewModel.fetchNotes()
//    }
    var body: some View {
        VStack{
            TextEditor(text: $notesName)
               // .frame(minHeight: 100)
                .font(.headline)
                .padding(.leading)
                .background(Color(uiColor: .systemGray5))
                .frame(height: 500)
                .cornerRadius(5)
            
            Button {
                viewModel.addNotes(notesName: notesName)
                self.notesName = ""
                showAddFullSheet.toggle()
            } label: {
                Text("Add")
            }
        }
        .padding()
    }
}

//struct AddNotesView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddNotesView(viewModel: <#NotesViewModel#>)
//    }
//}
