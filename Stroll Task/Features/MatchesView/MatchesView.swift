//
//  TabView.swift
//  Stroll Task
//
//  Created by Ciko Edo Febrian on 20/06/25.
//


import SwiftUI

struct MatchesView: View {
    var body: some View {
            ZStack {
                Image(.background)
                    .resizable()
                    .ignoresSafeArea()
                LinearGradient(colors: [Color.clear, Color(hex: "0B0D0E"), Color(hex: "0B0D0E")], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading, spacing: 0){
                        HeaderView()
                            .padding(.horizontal, 20)
                        PeopleScrollView()
                        ChatTitleView()
                        ChatsView()
                    }
                }
            }
        
    }
}

#Preview {
    MatchesView()
        .preferredColorScheme(.dark)
}
