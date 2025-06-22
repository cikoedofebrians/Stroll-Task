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
//                LinearGradient(
//                    stops: [
//                        Gradient.Stop(color: Color(hex: "050505").opacity(0.0), location: 0),
//                        Gradient.Stop(color: Color(hex: "050505").opacity(0.65),
//                                      location: 0.45),
//                        Gradient.Stop(color: Color(hex: "050505").opacity(0.8), location: 0.60),
//                        Gradient.Stop(color: Color(hex: "050505").opacity(1), location: 1),
//                    ], startPoint: .top, endPoint: .bottom)
//                    .ignoresSafeArea()
//                
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(hex: "0B0D0E").opacity(0), location: 0),
                        Gradient.Stop(color: Color(hex: "0B0D0E").opacity(1),
                                      location: 0.6),
                        Gradient.Stop(color: Color(hex: "0B0D0E").opacity(1), location: 1),
                
        
                    ], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
//                LinearGradient(
//                    stops: [
//                        Gradient.Stop(color: Color(hex: "0B0D0E").opacity(0.8), location: 0),
//                        Gradient.Stop(color: Color(hex: "0B0D0E").opacity(0.3),
//                                      location: 0.6),
//                        Gradient.Stop(color: Color(hex: "0B0D0E").opacity(0.0), location: 1),
//                
//        
//                    ], startPoint: .top, endPoint: .bottom)
//                    .ignoresSafeArea()
 
                ScrollView {
                    VStack(alignment: .leading, spacing: 0){
                        HeaderView()
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
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
