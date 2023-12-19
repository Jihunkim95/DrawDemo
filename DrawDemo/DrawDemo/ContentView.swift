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
                GradientShadowView()
                
                PathView()
                
                Spacer()
                    .frame(height: 350)
                
                MyShape()
                    .fill(.yellow)
                    .frame(width: 360, height: 350)
                

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
            //2차 베지어 곡선
            path.addQuadCurve(to: CGPoint(x: 200, y: 200), control: CGPoint(x: 100, y: 200))
            //3차 베지어 곡선
            path.addCurve(to: CGPoint(x:10,y: 10), control1: CGPoint(x: 100, y: 200), control2: CGPoint(x: 100, y: 200))
        }
        .fill(.green)
    }
}

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
#Preview {
    ContentView()
}
