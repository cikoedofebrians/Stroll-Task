//
//  MatchDetailsHeader.swift
//  Stroll Task
//
//  Created by Ciko Edo Febrian on 22/06/25.
//

import SwiftUI

struct MatchDetailsHeader: View {
    @Binding var isShowPerson: Bool
    @Binding var selectedPerson: People?
    @Binding var showTabBar: Bool
    @EnvironmentObject var voiceRecorder: VoiceRecorderViewModel
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                RoundedRectangle(cornerRadius: 100)
                    .fill(Color(hex: "B0B0B0"))
                    .frame(maxWidth: .infinity, maxHeight: 4)
                RoundedRectangle(cornerRadius: 100)
                    .fill(Color(hex: "505050"))
                    .frame(maxWidth: .infinity, maxHeight: 4)
            }
            .padding(.bottom, 18)
            HStack {
                Button {
                    withAnimation(.spring(duration: 0.3)) {
                        showTabBar = true
                        isShowPerson = false
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        voiceRecorder.deleteRecording()
                        selectedPerson = nil
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 24))
                        .foregroundStyle(.white)
                }
                Spacer()
                Text("\(selectedPerson?.name ?? ""), \(selectedPerson?.age ?? 0)")
                    .font(.proximaNova(.bold, size: 18))
                    .foregroundStyle(.white)
                Spacer()
                Image(systemName: "ellipsis")
                    .font(.system(size: 24))
                    .foregroundStyle(.white)
                
            }
            
        }
        .padding(.horizontal, 20)
    }
}
    

