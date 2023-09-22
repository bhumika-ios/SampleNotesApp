//
//  ContentView.swift
//  SampleNotesApp
//
//  Created by Bhumika Patel on 20/09/23.
//
import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var viewModel = FolderViewModel()
    @State var folderName: String = ""
    @State var showAddBottomSheet = false
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationView {
            ZStack{
                Color("BGColor")
                    .ignoresSafeArea(.all)
                VStack {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(viewModel.folderArray, id: \.id) { item in
                                NavigationLink {
                                    NotesView(folder: item)
                                } label: {
                                    VStack {
                                        Image(systemName: "folder.fill")
                                            .resizable()
                                            .foregroundColor(Color("FColor"))
                                            .frame(width: 130, height: 100)
                                        HStack{
                                            Text(item.title ?? "")
                                                .fontWeight(.semibold)
                                                .font(.headline)
                                               
                                                .multilineTextAlignment(.center) // Center-align the title
                                            Image(systemName: "ellipsis.circle")
                                                
                                        }
                                        .foregroundColor(.black)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(.horizontal)
                                    .padding(.bottom)
                                }
                            }
                        }
                    }
                    
                    Button {
                        showAddBottomSheet.toggle()
                    } label: {
                        Label {
                            
                        } icon: {
                            Image(systemName: "plus.app.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color("FColor"))
                                .padding()
                        }
                    }
                    .offset(x: 150)
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
            .navigationTitle("Notes")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
