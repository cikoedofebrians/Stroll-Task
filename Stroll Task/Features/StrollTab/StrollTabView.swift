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
    @StateObject private var voiceRecorderViewModel = VoiceRecorderViewModel()
    @StateObject private var matchesViewModel = MatchesViewModel()
    
    @State private var selectedTab: TabBarItem = .matches
    @State private var showTabBar: Bool = true
    @State var isShowPerson: Bool = false
    @State var selectedPerson: People? = nil
    @Namespace var namespace
    
    var body: some View {
        NavigationStack {
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
                        MatchesView(selectedPerson: $selectedPerson, isShowPerson: $isShowPerson, namespace: namespace)
                    case .profile:
                        Text("Profile View")
                            .font(.proximaNova(.bold, size: 24))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                    }
                    if showTabBar {
                        Rectangle()
                            .fill(
                                LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
                            )
                            .frame(height: 50)
                            .onAppear(perform: {
                                print(UIScreen.main.bounds.width)
                                print(UIScreen.main.bounds.height)
                            })
                    }
                }
                if showTabBar {
                    TabBarView(selectedTab: $selectedTab)
                }
                
            }
            .overlay {
                if isShowPerson {
                    MatchDetailsView(selectedPerson: $selectedPerson, isShowPerson: $isShowPerson, namespace: namespace, showTabBar: $showTabBar)
                }
            }
        }
        .environmentObject(matchesViewModel)
        .environmentObject(voiceRecorderViewModel)
    }
}


#Preview {
    StrollTabView()
        .preferredColorScheme(.dark)
}
