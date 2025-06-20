//
//  TabBarView.swift
//  Stroll Task
//
//  Created by Ciko Edo Febrian on 20/06/25.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedTab: TabBarItem
    
    var body: some View {
        HStack {
            ForEach(tabViewOptions.indices, id: \.self) { index in
                Button {
                    withAnimation {
                        selectedTab = TabBarItem(rawValue: tabViewOptions[index].title) ?? .matches
                    }
                } label: {
                    ZStack(alignment: .topTrailing) {
                  
                        VStack(spacing: 6){
                            Image(uiImage: selectedTab.rawValue == tabViewOptions[index].title ? tabViewOptions[index].activeIcon :  tabViewOptions[index].icon)
                                .resizable()
                                .frame(width: 24, height: 24)
                            Text(tabViewOptions[index].title)
                                .font(.poppins(.semiBold, size: 10))
                                .foregroundStyle(selectedTab.rawValue == tabViewOptions[index].title ? .activePurple : .tertiaryText)
                        }
                        if tabViewOptions[index].notificationCount > 0 {
                            Text("\(tabViewOptions[index].notificationCount)")
                                .font(.poppins(.semiBold, size: 7))
                                .foregroundStyle(.black)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background {
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color(hex: "B5B2FF"))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 16)
                                                .stroke(Color(hex: "0F1115"), lineWidth: 2)
                                        }

                                }
                            
                                .offset(x: 4, y: -4)
                        }
                    }
                }

              
                if index != tabViewOptions.indices.last {
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(Color(hex:"0F1115"))
        .overlay(
            Rectangle()
                .fill(Color(hex: "1E1E1E"))
                .frame(height: 1)
                .frame(maxHeight: .infinity, alignment: .top),
            alignment: .top
        )
    }
}


#Preview {
    TabBarView(selectedTab: .constant(.bonfire))
}
