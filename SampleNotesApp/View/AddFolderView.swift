//
//  AddFolderView.swift
//  SampleNotesApp
//
//  Created by Bhumika Patel on 20/09/23.
//

import SwiftUI

struct AddFolderView: View {
    @StateObject var viewModel = FolderViewModel()
    @State var folderName: String = ""
    @Binding var showAddBottomSheet: Bool
    var body: some View {
        NavigationView{
            VStack{
                TextField("Folder Name", text: $folderName)
                    .font(.headline)
                    .padding(.leading)
                    .frame(height: 55)
                    .background(Color(uiColor: .systemGray5))
                    .cornerRadius(5)
                Button {
                    viewModel.addDataToCoreData(folderTitle: folderName)
                    self.folderName = ""
                    showAddBottomSheet.toggle()
                   // self.companyOwner = ""
                } label: {
                    Text("Add")
                }
            }
            .padding()
           
        }
    }
}
