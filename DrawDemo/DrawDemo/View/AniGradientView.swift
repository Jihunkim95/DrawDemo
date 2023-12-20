//
//  AniGradientView.swift
//  DrawDemo
//
//  Created by 김지훈 on 2023/12/20.
//

import SwiftUI

struct AniGradientView: View {
    // 애니메이션 상태를 유지하는 상태 변수
    @State var animateGradient = false

    var body: some View {
        //선형
        LinearGradientView(animateGradient: $animateGradient)
        
        //원뿔
        RadialGradientView(animateGradient: $animateGradient)
    }
}

#Preview {
    AniGradientView()
}


struct LinearGradientView: View {
    // 애니메이션 상태를 유지하는 상태 변수
    @Binding var animateGradient:Bool
    
    var body: some View {
        //왼쪽 상단에서 오른쪽 하단 애니메이션
        // 애니메이션이 시작되면 시작점을 왼쪽 상단에서 왼쪽 하단으로 변경하고, 종료점을 오른쪽 하단에서 오른쪽 상단으로 변경
        LinearGradient(colors:  [Color(red: 195 / 255.0, green: 237 / 255.0, blue: 232 / 255.0),
                                 Color(red: 236 / 255.0, green: 246 / 255.0, blue: 238 / 255.0),
                                 Color(red: 239 / 255.0, green: 207 / 255.0, blue: 246 / 255.0)],
                       startPoint: animateGradient ? .topLeading : .bottomLeading,
                       endPoint: animateGradient ? .bottomTrailing : .topTrailing)
            .ignoresSafeArea()
            .onAppear{
                withAnimation(.linear(duration: 3).repeatForever(autoreverses: true)) {
                    animateGradient.toggle()
                }
            }
    }
}

struct RadialGradientView: View {
    // 애니메이션 상태를 유지하는 상태 변수
    @Binding var animateGradient:Bool
    
    var body: some View {
        //왼쪽 상단에서 오른쪽 하단 애니메이션
        // 애니메이션이 시작되면 시작점을 왼쪽 상단에서 왼쪽 하단으로 변경하고, 종료점을 오른쪽 하단에서 오른쪽 상단으로 변경
        RadialGradient(colors:  [Color(red: 195 / 255.0, green: 237 / 255.0, blue: 232 / 255.0),
                                 Color(red: 236 / 255.0, green: 246 / 255.0, blue: 238 / 255.0),
                                 Color(red: 239 / 255.0, green: 207 / 255.0, blue: 246 / 255.0)],
                           center: .center,
                               startRadius: animateGradient ? 400 : 200,
                               endRadius:   animateGradient ? 20 : 40)
            .ignoresSafeArea()
            .onAppear{
                withAnimation(.linear(duration: 3).repeatForever(autoreverses: true)) {
                    animateGradient.toggle()
                }
            }
    }
}
