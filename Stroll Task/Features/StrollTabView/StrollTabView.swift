//
//  StrollTabView.swift
//  Stroll Task
//
//  Created by Ciko Edo Febrian on 21/06/25.
//

import SwiftUI

enum TabBarItem: String {
    case cards = "Cards"
    case bonfire = "Bonfire"
    case matches = "Matches"
    case profile = "Profile"
}

struct StrollTabView: View {
    
    @State private var selectedTab: TabBarItem = .matches
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottom) {
                switch selectedTab {
                case .cards:
                    Text("Cards View")
                        .font(.proximaNova(.bold, size: 24))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                case .bonfire:
                    Text("Bonfire View")
                        .font(.proximaNova(.bold, size: 24))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                case .matches:
                    MatchesView()
                case .profile:
                    Text("Profile View")
                        .font(.proximaNova(.bold, size: 24))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                Rectangle()
                    .fill(
                        LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
                    )
                    .frame(height: 50)
            }
            TabBarView(selectedTab: $selectedTab)
            
        }
    }
}


#Preview {
    StrollTabView()
        .preferredColorScheme(.dark)
}
