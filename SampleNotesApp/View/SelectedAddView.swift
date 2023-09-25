//
//  SelectedAddView.swift
//  SampleNotesApp
//
//  Created by Bhumika Patel on 25/09/23.
//

import SwiftUI

struct SelectedAddView: View {
    @StateObject var viewModel = FolderViewModel()
    //@ObservedObject var viewModel1: NotesViewModel
    @StateObject var viewModel1 = SingleNotesViewModel()
    
    @State var showAddBottomSheet = false
    @State var folderName: String = ""
    @State var showAddFullSheet = false
    var body: some View {
        VStack{
            Button{
                showAddBottomSheet.toggle()
               // showAddBottomSheet.toggle()
            }label: {
                HStack{
                    Image(systemName: "folder.badge.plus")
                    Text("Folder")
                }
            }
            Divider()
            Button{
                showAddFullSheet.toggle()
            }label: {
                HStack{
                    Image(systemName: "square.and.pencil")
                    Text("Notes")
                }
            }
        }
        .fullScreenCover(isPresented: $showAddFullSheet) {
            if #available(iOS 16.0, *) {
                AddSingleNoteView(viewModel1: viewModel1, showAddFullSheet: $showAddFullSheet)
            } else {
                // Fallback on earlier versions
            }
        }
        .sheet(isPresented: $showAddBottomSheet) {
            if #available(iOS 16.0, *) {
                AddFolderView(viewModel: viewModel, folderName: folderName, showAddBottomSheet: $showAddBottomSheet)
                    .presentationDetents([.height(180), .height(180)])
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

//struct SelectedAddView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectedAddView()
//    }
//}
