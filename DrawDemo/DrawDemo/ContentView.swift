//
//  ContentView.swift
//  DrawDemo
//
//  Created by 김지훈 on 2023/12/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView{
            VStack{
                PathView()
                
                Spacer()
                    .frame(height: 350)
                
                ShapeView()
                
            }
        }
    }
}

struct ShapeView: View {
    var body: some View {
        VStack{
            Text("기본모형")
                .font(.title2)
            
            Rectangle()
            
            Circle()
                .fill(.red)
                .frame(width: 200,height: 100)
            Capsule()
                .stroke(lineWidth:10)
                .foregroundStyle(.blue)
                .frame(width:200, height: 100)
                
            RoundedRectangle(cornerRadius: CGFloat(20))
                .stroke(style: StrokeStyle(lineWidth: 10, dash: [CGFloat(10)]))
                .frame(width: 200,height: 100)
            
            Ellipse()
                .stroke(style: StrokeStyle(lineWidth: 20,
                                          dash: [CGFloat(10),CGFloat(5),CGFloat(2)],
                                          dashPhase: CGFloat(10)))
                .foregroundStyle(.blue)
                .frame(width: 200, height: 150)
            
            Text("테두리 오버레이")
            Ellipse()
                .fill(.red)
                .overlay{
                    Ellipse()
                    .stroke(.blue,lineWidth: 10)
                }
                .frame(width: 250, height: 150)
            
        }
        .padding()

    }
}

struct PathView: View {
    var body: some View{
        Path{ path in
            path.move(to: CGPoint(x: 10, y: 0))
            path.addLine(to: CGPoint(x: 10, y: 350))
            path.addLine(to: CGPoint(x: 300, y: 300))
        }
        .fill(.green)
    }
}
#Preview {
    ContentView()
}
