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
   // @State var companyOwner: String = ""
    @State var showAddBottomSheet = false
    var body: some View {
        NavigationView {
            VStack {
//                HStack {
//                    VStack {
//                        TextField("Folder Name", text: $companyName)
//                            .font(.headline)
//                            .padding(.leading)
//                            .frame(height: 55)
//                            .background(Color(uiColor: .systemGray5))
//                            .cornerRadius(5)
//
////                        TextField("Enter Owner Name", text: $companyOwner)
////                            .font(.headline)
////                            .padding(.leading)
////                            .frame(height: 55)
////                            .background(Color(uiColor: .systemGray5))
////                            .cornerRadius(5)
//                    }
//
//                    Button {
//                        viewModel.addDataToCoreData(companyTitle: companyName)
//                        self.companyName = ""
//                       // self.companyOwner = ""
//                    } label: {
//                        Text("Add")
//                    }
//
//                }.padding(.horizontal)
                
                ScrollView {
                    ForEach(viewModel.folderArray, id: \.id) { item in
                        NavigationLink {
                         //   EmployeesView(company: item)
                        } label: {
                            VStack(alignment: .leading) {
                                Image(systemName: "folder")
                                    .resizable()
                                    .frame(width: 80, height: 70)
                                Text(item.title ?? "")
                                    .fontWeight(.semibold)
                                    .font(.headline)
//                                Text(item.owner ?? "")
//                                    .font(.subheadline)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                            .padding(.bottom)
                        }

                        
                    }
                }
                Button{
                    //taskModel.OpenEditTask.toggle()
                    showAddBottomSheet.toggle()
                        
                    //isAddTodoOpen = true
                }label: {
                    Label{
                        
                    }icon: {
                        Image(systemName: "plus.app.fill")
                      //  Image(systemName: "plus")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding()
                        
                        
                    }
                }
                .offset(x:150)
                .sheet(isPresented: $showAddBottomSheet){
                    if #available(iOS 16.0, *) {
                        AddFolderView(viewModel: viewModel, folderName: folderName, showAddBottomSheet: $showAddBottomSheet)
                            .presentationDetents([.height(180), .height(180)])
                    } else {
                        // Fallback on earlier versions
                    }
                }
            }.navigationTitle("Folder")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
