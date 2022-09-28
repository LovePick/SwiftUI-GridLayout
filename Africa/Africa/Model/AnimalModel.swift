//
//  AnimalModel.swift
//  Africa
//
//  Created by Supapon Pucknavin on 28/9/2565 BE.
//

import SwiftUI

struct Animal : Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
    
}
