//
//  ContentView.swift
//  DrawDemo
//
//  Created by 김지훈 on 2023/12/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            VStack{
                
//                GradientShadowView()
//
//                PathView()
//                
//                Spacer()
//                    .frame(height: 350)
//                
//                MyShape()
//                    .fill(.yellow)
//                    .frame(width: 360, height: 350)
//                
//                ShapeView()
                AniNavigationMenuView()
                
                AniGradientView()
            }

    }
}

#Preview {
    ContentView()
}
