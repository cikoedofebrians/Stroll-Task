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
                        .font(.poppins(.bold, size: 24))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.blurReplace())
                case .bonfire:
                    Text("Bonfire View")
                        .font(.poppins(.bold, size: 24))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.blurReplace())
                case .matches:
                    MatchesView()
                        .transition(.blurReplace())
                case .profile:
                    Text("Profile View")
                        .font(.poppins(.bold, size: 24))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.blurReplace())
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
