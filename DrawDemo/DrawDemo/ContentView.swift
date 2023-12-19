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
                ShapeView()
            }
        }
    }
}

struct ShapeView: View {
    var body: some View {
        VStack{
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
#Preview {
    ContentView()
}
