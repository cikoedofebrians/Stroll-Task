//
//  TabView.swift
//  Stroll Task
//
//  Created by Ciko Edo Febrian on 20/06/25.
//


import SwiftUI

struct MatchesView: View {
    @Binding var selectedPerson: People?
    @Binding var isShowPerson: Bool
    
    let namespace: Namespace.ID
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(hex: "0B0D0E").opacity(0), location: 0),
                    Gradient.Stop(color: Color(hex: "0B0D0E").opacity(1),
                                  location: 0.6),
                    Gradient.Stop(color: Color(hex: "0B0D0E").opacity(1), location: 1),
                ], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 0){
                    HeaderView()
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                    PeopleScrollView(
                        selectedPerson: $selectedPerson,
                        isShowPerson: $isShowPerson,
                        namespace: namespace
                    )
                    ChatTitleView()
                    ChatsView()
                }
            }
        }
    }
}


