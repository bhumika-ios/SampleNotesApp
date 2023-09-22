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
    @FocusState private var focusedField: FocusField?
    enum FocusField: Hashable {
       case field
     }
//    init(folder: Folder) {
//        self.viewModel = NotesViewModel(folder: folder)
//        viewModel.fetchNotes()
//    }
    var body: some View {
        ZStack{
            Color("BGColor")
                .ignoresSafeArea(.all)
            VStack{
                TextEditor(text: $notesName)
                // .frame(minHeight: 100)
                    .focused($focusedField, equals: .field)
                    .onAppear {
                        self.focusedField = .field
                    }
                    .font(.headline)
                    .padding(.leading)
                   .frame(maxHeight: .infinity)
                .cornerRadius(5)
                .background(Color("BGColor"))
               
                .scrollContentBackground(.hidden)
               //  .background(Color(uiColor: .systemGray5))
                   
                    
                
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
}

//struct AddNotesView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddNotesView(viewModel: <#NotesViewModel#>)
//    }
//}
