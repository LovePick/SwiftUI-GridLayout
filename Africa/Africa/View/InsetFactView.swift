//
//  InsetFactView.swift
//  Africa
//
//  Created by Supapon Pucknavin on 28/9/2565 BE.
//

import SwiftUI

struct InsetFactView: View {
    // MARK: - PROPERTIES
    var animal: Animal
    
    
    // MARK: - BODY
    var body: some View {
        GroupBox{
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }//: LOOP
            }//: TABS
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }//: GROUPBOX
    }
}


// MARK: - PREVIEW
struct InsetFactView_Previews: PreviewProvider {
    static let animal: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetFactView(animal: animal[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
