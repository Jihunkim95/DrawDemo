//
//  DrawView03.swift
//  DrawDemo
//
//  Created by 김지훈 on 2023/12/19.
//

import SwiftUI

struct DrawView03: View {
    var body: some View {
        Path{ Path in
            
            Path.move(to: CGPoint(x: 200, y: 300))
            Path.addLine(to: CGPoint(x: 300, y: 450))
            Path.addLine(to: CGPoint(x:100, y: 450))
            Path.closeSubpath()
        }
        .stroke(.blue, lineWidth: 4)
    }
}

#Preview {
    DrawView03()
}
