//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Supapon Pucknavin on 30/9/2565 BE.
//

import SwiftUI


struct MotionAnimationView: View {
    // MARK: - PROPERTIES
    @StateObject private var viewModel = ViewModel()
    
    
    // MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...viewModel.randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: viewModel.randomSize(), height: viewModel.randomSize(), alignment: .center)
                        .scaleEffect(viewModel.isAnimating ? viewModel.randomScale() : 1)
                        .position(
                            x: viewModel.randomCoordimate(max: geometry.size.width),
                            y: viewModel.randomCoordimate(max: geometry.size.height)
                    )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(viewModel.randonSpeed())
                                .delay(viewModel.randomDelay())
                            , value: viewModel.isAnimating)
                        .onAppear{
                            viewModel.isAnimating = true
                        }
                        
                }//: LOOP
                
                
            }//: ZSTACK
            .drawingGroup()
        }//: GEOMETRY
    }
}

extension MotionAnimationView {
    @MainActor class ViewModel: ObservableObject {
        
        @Published var randomCircle = Int.random(in: 12...16)
        @Published var isAnimating: Bool = false
        
        // MARK: - FUNCTIONS
        // 1. RANDOM COORDINATE
        func randomCoordimate(max: CGFloat) -> CGFloat {
            return CGFloat.random(in: 0...max)
        }
        
        // 2. RANDOM SIZE
        func randomSize() -> CGFloat {
            return CGFloat(Int.random(in: 10...300))
            
        }
        
        // 3. RANDOM SCALE
        func randomScale() -> CGFloat {
            return CGFloat(Double.random(in: 0.1...2.0))
        }
        
        // 4. RANDOM SPEED
        func randonSpeed() -> Double {
            return Double.random(in: 0.025...1.0)
        }
        // 5. RANDOM DELAY
        func randomDelay() -> Double {
            return Double.random(in: 0...2)
        }
        
        
    }
}

// MARK: - PREVIEW
struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
