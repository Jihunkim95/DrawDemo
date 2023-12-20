//
//  AniNavigationView.swift
//  DrawDemo
//
//  Created by 김지훈 on 2023/12/20.
//

import SwiftUI

struct AniNavigationMenuView: View {

    // 메뉴 항목 선택시 뷰변경 애니메이션 적용 변수
    @Namespace private var menuItemTransition
    
    let menuItems = ["Travel", "Nature", "Architecture"]

    //색 변경 구분 코드
    @State var selectIndex = 0
    
    
    var body: some View {
        HStack {
            ForEach(menuItems.indices, id: \.self){ index in
                //선택한 메뉴 항목을 추적하기 위한 상태 변수 추가 (selectedIndex)
                if index == selectIndex{
                    Text(menuItems[index])
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                        .background(Capsule().foregroundStyle(.purple))
                        .foregroundStyle(.white)
                        // 메뉴 항목이 선택될 때마다 보기 변경에 애니메이션을 적용
                        // ID 와 네임스페이스는 동일한 전환의 일부인 뷰를 식별하는데 사용
                        .matchedGeometryEffect(id: "menuItem", in: menuItemTransition)
                    
        
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
            //애니메이션 활성화를 위해 연결
            .animation(.easeOut, value: selectIndex)

        }
    }
}
#Preview {
    AniNavigationMenuView()
}
