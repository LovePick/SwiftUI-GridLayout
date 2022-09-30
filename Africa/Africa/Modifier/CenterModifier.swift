//
//  CenterModifier.swift
//  Africa
//
//  Created by Supapon Pucknavin on 30/9/2565 BE.
//

import Foundation
import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
