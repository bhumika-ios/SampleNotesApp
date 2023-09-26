//
//  SingleNotesView.swift
//  SampleNotesApp
//
//  Created by Bhumika Patel on 25/09/23.
//

import SwiftUI
import MasonryStack

struct SingleNotesView: View {
    @StateObject var viewModel1 = SingleNotesViewModel()
    @State var showAddFullSheet = false
    var body: some View {
        ZStack{
            Color("BGColor")
                .ignoresSafeArea(.all)
            VStack{
                ScrollView(showsIndicators: false) {
                    MasonryVStack(spacing: 6) {
                        ForEach(viewModel1.snotesArray.indices, id: \.self) { index in
                            let item = viewModel1.snotesArray[index]
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
//            Button {
//                 showAddFullSheet.toggle()
//            } label: {
//                Image(systemName: "plus.app.fill")
//                    .resizable()
//                    .frame(width: 50, height: 50)
//                    .foregroundColor(Color("FColor"))
//                
//            }
//            .offset(x: 150, y:300)
//            .fullScreenCover(isPresented: $showAddFullSheet) {
//                if #available(iOS 16.0, *) {
//                    AddSingleNoteView(viewModel1: viewModel1, showAddFullSheet: $showAddFullSheet)
//                } else {
//                    // Fallback on earlier versions
//                }
//            }
          //  .navigationBarTitle(Text("Recent Notes"), displayMode: .inline)
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

struct SingleNotesView_Previews: PreviewProvider {
    static var previews: some View {
        SingleNotesView()
    }
}
