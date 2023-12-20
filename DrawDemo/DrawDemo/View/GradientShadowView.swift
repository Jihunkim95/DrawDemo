//
//  GradientShadowView.swift
//  DrawDemo
//
//  Created by 김지훈 on 2023/12/20.
//

import SwiftUI


struct MyShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY),
                          control: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct GradientShadowView: View {
    //방사형 gradient
    let colors = Gradient(colors: [Color.red, Color.yellow, Color.green, Color.blue, Color.purple])
    
    var body: some View {
        ScrollView{
            VStack{
                Text("그레디언트")
                Circle()
                    .fill(.blue.gradient)
                    .frame(width: 100, height: 100)
                Text("shadow")
                HStack{
                    Circle()
                        .fill(.orange.shadow(.drop(color: .black, radius: 10)))
                        .frame(width: 100, height: 100)
                        
                    Circle()
                        .fill(.orange.shadow(.inner(color: .black, radius: 10)))
                        .frame(width: 100, height: 100)
                }
                Text("여러형태 그레디언트")
                HStack{
                    Circle()
                        .fill(RadialGradient(gradient: colors, center: .center, startRadius: CGFloat(0), endRadius: CGFloat(300)))
                    
                    Circle()
                        .fill(AngularGradient(gradient: colors, center: .center))
                    
                    Rectangle()
                        .fill(LinearGradient(gradient: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
                    
                }
        

                MyShape()
                    .fill(RadialGradient(gradient: colors, center: .center, startRadius: CGFloat(0), endRadius: CGFloat(100)))
                    .background(LinearGradient(gradient: Gradient(colors: [Color.orange,Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 360, height: 350)

                


                
            }
            .padding()
        }
    }
}
