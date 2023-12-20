//
//  PathView.swift
//  DrawDemo
//
//  Created by 김지훈 on 2023/12/20.
//

import SwiftUI

struct PathView: View {
    var body: some View{
        Path{ path in
            path.move(to: CGPoint(x: 10, y: 0))
            path.addLine(to: CGPoint(x: 10, y: 350))
            path.addLine(to: CGPoint(x: 300, y: 300))
            //2차 베지어 곡선
            path.addQuadCurve(to: CGPoint(x: 200, y: 200), control: CGPoint(x: 100, y: 200))
            //3차 베지어 곡선
            path.addCurve(to: CGPoint(x:10,y: 10), control1: CGPoint(x: 100, y: 200), control2: CGPoint(x: 100, y: 200))
        }
        .fill(.green)
    }
}
