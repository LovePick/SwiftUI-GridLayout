//
//  ContentView.swift
//  Africa
//
//  Created by Supapon Pucknavin on 26/9/2565 BE.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive: Bool = false
  
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    
    // MARK : - FUNCTION
    func gridSwitch() {
        gridLayout = Array(repeating: GridItem(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        
        switch (gridColumn) {
        case 1:
            toolbarIcon = "square.grid.2x2"
            break
        case 2:
            toolbarIcon = "square.grid.3x2"
            break
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
            break
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    //MARK: - BODY
    var body: some View {
        
        NavigationView {
            
            Group{
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))//: COVERIMAGE
                        
                        
                        ForEach(animals) { animal in
                            NavigationLink {
                                AnimalDetailView(animal: animal)
                            } label: {
                                AnimalListItemView(animal: animal)
                            }//: NAVIGATION LINK
                            
                            
                        }//:FOR EACH
                        
                        
                    }//: LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { item in
                                NavigationLink(destination: AnimalDetailView(animal: item)) {
                                    AnimalGridItemView(animal: item)
                                }//: LINK
                            }//: LOOP
                        }//: GRID
                        .padding(10)
                        
                        
                    }//: SCROLL
                }//: CONDITION
                
            }//: GROUP
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        HStack{
                            //LIST
                            Button {
                                print("List view is activated")
                                isGridViewActive = false
                                haptics.impactOccurred()
                            } label: {
                                Image(systemName: "square.fill.text.grid.1x2")
                                    .font(.title2)
                                    .foregroundColor(isGridViewActive ? .primary : .accentColor)
                                
                            }
                            
                            //GRID
                            Button {
                                print("Grid view is activated")
                                isGridViewActive = true
                                haptics.impactOccurred()
                                
                                withAnimation(Animation.easeIn) {
                                    gridSwitch()
                                }
                            } label: {
                                Image(systemName: toolbarIcon)
                                    .font(.title2)
                                    .foregroundColor(isGridViewActive ? .accentColor : .primary)
                                
                            }
                            
                            
                        }//: HSTACK
                    }//:HSTACK
                }//:TOOLBAT ITEM
            }//: TOOLBAR
        }//: NAVIGATION
    }
}


//MARK: - PREVIEWS
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
