//
//  DrawView01.swift
//  DrawDemo
//
//  Created by 김지훈 on 2023/12/19.
//

import SwiftUI

struct DrawView01: View {
    var body: some View{
        ZStack{
            Path{ path in
                path.move(to: CGPoint(x: 30, y: 50))
                path.addLine(to: CGPoint(x: 30, y: 100))
                path.addLine(to: CGPoint(x: 200, y: 100))
                path.addLine(to: CGPoint(x: 200, y: 50))

                path.addQuadCurve(to: CGPoint(x: 30, y: 50), control: CGPoint(x: 110, y: -10))

            }
            .fill(.purple)

            Path{ path in
                path.move(to: CGPoint(x: 10, y: 50))
                path.addLine(to: CGPoint(x: 10, y: 100))
                path.addLine(to: CGPoint(x: 220, y: 100))
                path.addLine(to: CGPoint(x: 220, y: 50))
            }
            .fill(.purple)
        }
        
        
    }
}
#Preview {
    DrawView01()
}

