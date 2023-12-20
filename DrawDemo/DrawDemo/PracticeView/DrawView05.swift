//
//  DrawView05.swift
//  DrawDemo
//
//  Created by 김지훈 on 2023/12/19.
//

import SwiftUI

struct SunRayView: View {
    let rotation: Angle
    var body: some View{
        Rectangle()
             .fill(Color.yellow)
             .opacity(0.5) // 투명도 조절로 빛살의 강도를 조절
             .frame(width: 10, height: 110)
             .offset(y: -60)
             .rotationEffect(rotation)
    }
}


struct Wave: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let waveLength = rect.width * 0.6
        let amplitude = 10.0 // 파동의 높이
        let midPoint = rect.width / 2

        path.move(to: CGPoint(x: 0, y: rect.midY))

        for x in stride(from: 0, to: rect.width + waveLength, by: 1) {
            let relativeX = x / waveLength
            let y = sin(relativeX * 2 * .pi) * amplitude + rect.midY
            path.addLine(to: CGPoint(x: x, y: y))
        }

        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()

        return path
    }
}

struct DrawView05: View {

    var body: some View {
        VStack{
            ZStack {
                ForEach(0..<10) { i in
                    SunRayView(rotation: .degrees(Double(i) * 40.0))
                }
                Circle()
                    .fill(RadialGradient(gradient: Gradient(colors: [.yellow, .orange]), center: .center, startRadius: 2, endRadius: 100))
                    .frame(width: 180, height: 180)
                    .shadow(color: .orange.opacity(1), radius: 20, x: 0, y: 0)
                
            }
//            .offset(y:-10)
            
            // 바다
            Wave()
                .fill(
                    LinearGradient(gradient: Gradient(colors: [.blue, .blue.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
                )
                .frame(height: 300)
                .offset(y: 200)
        }

    }
}

#Preview {
    DrawView05()
}
