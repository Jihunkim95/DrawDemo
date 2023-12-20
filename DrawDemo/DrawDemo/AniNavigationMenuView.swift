//
//  AniNavigationView.swift
//  DrawDemo
//
//  Created by 김지훈 on 2023/12/20.
//

import SwiftUI

struct AniNavigationMenuView: View {

    let menuItems = ["Travel", "Nature", "Architecture"]

    @State var selectIndex = 0
    
    var body: some View {
        HStack {
            ForEach(menuItems.indices, id: \.self){ index in
                
                if index == selectIndex{
                    Text(menuItems[index])
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                        .background(Capsule().foregroundStyle(.purple))
                        .foregroundStyle(.white)
                }else{
                    Text(menuItems[index])
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                        .background(Capsule().foregroundStyle(Color(uiColor: UIColor.systemGray5)))
                        .foregroundStyle(.black)
                        .onTapGesture {
                            selectIndex = index
                        }
                }
            }

        }
    }
}
#Preview {
    AniNavigationMenuView()
}