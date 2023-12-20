//
//  DrawView04.swift
//  DrawDemo
//
//  Created by 김지훈 on 2023/12/19.
//

import SwiftUI

struct DrawView04: View {
    var body: some View {
        Link("튜토리얼 해보기", destination: URL(string: "https://developer.apple.com/tutorials/swiftui/drawing-paths-and-shapes")!)
            .font(.title) // 폰트 크기 설정
            .foregroundColor(.blue) // 링크의 색상을 설정
    }
}

#Preview {
    DrawView04()
}
