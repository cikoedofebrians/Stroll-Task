//
//  ChatTitleView.swift
//  Stroll Task
//
//  Created by Ciko Edo Febrian on 20/06/25.
//


import SwiftUI

struct ChatTitleView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("Chats")
                    .padding(.trailing, 16)
                Rectangle()
                    .fill(.white)
                    .frame(width: 70, height: 1)
            }
            Text("Pending")
                .foregroundStyle(.tertiaryText)
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 34)
        .font(.poppins(.bold, size: 22))
        Text("The ice is broken. Time to hit it off")
            .font(.poppins(.italic, size: 12))
            .foregroundStyle(.secondaryText)
            .padding(.leading, 20)
            .padding(.top, 10)
    }
}
