//
//  VideoModel.swift
//  Africa
//
//  Created by Supapon Pucknavin on 29/9/2565 BE.
//

import SwiftUI

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed Property
    var thumbnail: String {
        "video-\(id)"
    }
}
