//
//  NotesView.swift
//  SampleNotesApp
//
//  Created by Bhumika Patel on 21/09/23.
//

import SwiftUI
import MasonryStack

struct NotesView: View {
    @ObservedObject var viewModel: NotesViewModel
    @State var showAddFullSheet = false

    init(folder: Folder) {
        self.viewModel = NotesViewModel(folder: folder)
        viewModel.fetchNotes()
    }

    var body: some View {
        
        ZStack {
            Color("BGColor")
                .ignoresSafeArea(.all)
            VStack {
                ScrollView(showsIndicators: false) {
                    MasonryVStack(spacing: 6) {
                        ForEach(viewModel.notesArray.indices, id: \.self) { index in
                            let item = viewModel.notesArray[index]
                            let height = calculateHeight(index: index)
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .frame(width: 165, height: height)
                               // .padding()
                                .overlay(
                                    VStack(alignment: .leading) {
                                        Text(item.unwrappedName)
                                            .fontWeight(.semibold)
                                            .font(.headline)
//                                        Text(item.folder?.title ?? "")
//                                            .font(.subheadline)
                                    }
                                    .padding()
                                )
                                .onTapGesture {
                                    // Handle tapping on a note
                                }
                        }
                    }

                  //  .padding()
                }
               
               
               
            }
            .padding()
            Button {
                showAddFullSheet.toggle()
            } label: {
                Image(systemName: "plus.app.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color("FColor"))
                  
            }
            .offset(x: 150, y:300)
            .fullScreenCover(isPresented: $showAddFullSheet) {
                if #available(iOS 16.0, *) {
                    AddNotesView(viewModel: viewModel, showAddFullSheet: $showAddFullSheet)
                } else {
                    // Fallback on earlier versions
                }
            }
            .navigationBarTitle(Text(viewModel.folder.title!), displayMode: .inline)
            
           
           
        }
    }

    func calculateHeight(index: Int) -> CGFloat {
        let repeatingHeights: [CGFloat] = [300, 150, 200, 250] // Heights for the first four notes
        let minHeight: CGFloat = 100 // Minimum height for smaller notes

        let repeatingPatternIndex = index % repeatingHeights.count
        let calculatedHeight = repeatingHeights[repeatingPatternIndex]

        // Use the larger height if it's greater than or equal to the minimum height, otherwise use the minimum height
        return max(calculatedHeight, minHeight)
    }


}
