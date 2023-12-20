//
//  AniGradientView.swift
//  DrawDemo
//
//  Created by 김지훈 on 2023/12/20.
//

import SwiftUI

struct AniGradientView: View {

    var body: some View {
        //왼쪽 상단에서 오른쪽 하단 애니메이션        
        LinearGradient(colors: [.purple, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

#Preview {
    AniGradientView()
}
