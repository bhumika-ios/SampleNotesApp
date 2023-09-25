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
                ScrollView( showsIndicators: false){
                    VStack(alignment: .leading) {
                        VStack{
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 16) {
                                    ForEach(0..<viewModel.folderArray.count / 2) { rowIndex in
                                        VStack(spacing: 16) {
                                            ForEach(0..<2, id: \.self) { colIndex in
                                                let index = rowIndex * 2 + colIndex
                                                if index < viewModel.folderArray.count {
                                                    let item = viewModel.folderArray[index]
                                                    NavigationLink {
                                                        NotesView(folder: item)
                                                    } label: {
                                                        VStack {
                                                            Image(systemName: "folder.fill")
                                                                .resizable()
                                                                .foregroundColor(Color("FColor"))
                                                                .frame(width: 130, height: 100)
                                                            HStack {
                                                                Text(item.title ?? "")
                                                                    .fontWeight(.semibold)
                                                                    .font(.headline)
                                                                    .multilineTextAlignment(.center)
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
                                    }
                                }
                                
                            }
                        }
                        .padding(.horizontal,25)
                        Text("Recent Title")
                            .font(.system(size: 20).bold())
                            .padding(.horizontal)
                           
                        VStack{
                            SingleNotesView()
                        }
                        .padding(.horizontal,1)
                        .padding(.vertical,-10)
                        
                        
                    }
                }
                //  .padding()
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
                .offset(x: 150, y:310)
                .sheet(isPresented: $showAddBottomSheet) {
                    if #available(iOS 16.0, *) {
                        SelectedAddView(viewModel: viewModel, showAddBottomSheet: showAddBottomSheet, folderName: folderName)
                       // AddFolderView(viewModel: viewModel, folderName: folderName, showAddBottomSheet: $showAddBottomSheet)
                            .presentationDetents([.height(180), .height(180)])
                    } else {
                        // Fallback on earlier versions
                    }
                }
            }
            .navigationBarTitle(Text("Notes"), displayMode: .inline)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
