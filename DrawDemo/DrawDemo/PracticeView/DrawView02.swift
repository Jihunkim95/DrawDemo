////
////  DrawView02.swift
////  DrawDemo
////
////  Created by 김지훈 on 2023/12/19.
////

import SwiftUI


struct PieSliceData {
    var startAngle: Angle
    var endAngle: Angle
    var color: Color
}


struct PieSliceView: View {
    var data: PieSliceData
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
                path.move(to: center)
                path.addArc(center: center, radius: geometry.size.width / 2, startAngle: data.startAngle, endAngle: data.endAngle, clockwise: false)
                path.closeSubpath()
            }
            .fill(data.color)
        }
    }
}


struct BackgroundDrawView02: View {
    var slices: [PieSliceData] = [
        PieSliceData(startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 110), color: .blue),
        PieSliceData(startAngle: Angle(degrees: 110), endAngle: Angle(degrees: 200), color: .teal),
        PieSliceData(startAngle: Angle(degrees: 200), endAngle: Angle(degrees: 360), color: .yellow)
    ]
    
    var body: some View {
        ZStack {
            ForEach(slices.indices, id: \.self) { index in
                PieSliceView(data: slices[index])
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }
}

struct PieChartSlice: Shape {
    var startAngle: Angle
    var endAngle: Angle

    func path(in rect: CGRect) -> Path {
        Path { path in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            let radius = min(rect.width, rect.height) / 2.1
            path.move(to: center)
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            path.closeSubpath()
        }
    }
}


struct PieSliceLabel: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 40))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .offset(x: 70, y: 70) // 위치를 조정
    }
}
struct StrokeShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = PieChartSlice(startAngle: .degrees(0), endAngle: .degrees(90)).path(in: rect)
        return path
    }
}

struct DrawView02: View {
    var body: some View {
        ZStack {
            BackgroundDrawView02()
                .offset(x: -20, y: -20)
            PieChartSlice(startAngle: .degrees(0), endAngle: .degrees(90))
                .fill(Color.purple)
                .overlay(StrokeShape().stroke(.black, lineWidth: 7))
            PieSliceLabel(text: "25%")
        }
        .padding()
    }
}



#Preview{
    DrawView02()
}
