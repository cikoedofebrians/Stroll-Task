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
                        VStack (alignment: .leading){
                            ForEach(chats, id: \.self) { chat in
                                HStack (alignment: .top, spacing: 0){
                                    Image(uiImage: chat.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                        .padding(.trailing, 16)
                                    VStack(alignment: .leading, spacing: 2) {
                                        HStack (spacing: 0) {
                                        Text(chat.name)
                                            .font(.poppins(.bold, size: 16))
                                            .padding(.trailing, 10)
                                        
                                            if chat.isNewChat || !chat.isLastMessageFromMe {
                                                HStack (spacing: 4){
                                                    if chat.isNewChat {
                                                        Circle()
                                                            .fill(.white)
                                                            .frame(width: 5, height: 5)
                                                    }
                                                    Text(chat.isNewChat ? "New chat" : "Your move")
                                                        .font(.poppins(.semiBold, size: 10))
                                                }
                                                .padding(.horizontal, 8)
                                                .padding(.vertical, 2)
                                                .background {
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .fill(
                                                            chat.isNewChat ? Color(hex: "42406F").opacity(0.8) : Color(hex: "282828").opacity(0.8)
                                                        )
                                                }
                                            }
                                        }

                                        switch chat.lastMessage  {
                                        case .text(let textMessage):
                                            Text("\(chat.isLastMessageFromMe ? "You: ": "")\(textMessage)")
                                                .font(.poppins(.regular, size: 14))
                                                .foregroundStyle(chat.isLastMessageFromMe ? .tertiaryText : .primaryText)
                                        case .voiceRecord(let duration):
                                            HStack(spacing: 4) {
                                                Image(.voiceRecordIcon)
                                                    .resizable()
                                                    .frame(width: 48, height: 20)
                                                    .padding(.trailing, 8)
                                                Text("00:\(duration < 10 ? "0\(duration)" : "\(duration)")")
                                                    .font(.poppins(.bold, size: 14))
                                                    .foregroundStyle(Color(hex: "8669A8"))
                                            }
                                        }
                                    }
                                    .padding(.trailing, 12)
                                    Spacer()
                                    VStack(alignment: .trailing, spacing: 4) {
                                        Text("05:21 PM")
                                            .font(.poppins(.semiBold, size: 12))
                                            .foregroundStyle(Color(hex: "555390"))
                                        
                    
                                        Group {
                                            if chat.isNewChat {
                                                Image(systemName: "star.fill")
                                                    .font(.system(size: 10))
                                            }
                                            if chat.unreadCount > 0 {
                                                Text("\(chat.unreadCount)")
                                                    .font(.poppins(.bold, size: 10))
                                           
                                            }
                                        }
                                        .foregroundStyle(.black)
                                        .padding(.vertical, 2)
                                        .padding(.horizontal, 8)
                                        .background {
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color(hex: "B5B2FF"))
                                        }
                                                
                    
                                    }
                                }
                                .frame(height: 80)
                                Divider()
                            }
         
        
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 10)
                    }
                }
            }
        
    }
}

#Preview {
    MatchesView()
        .preferredColorScheme(.dark)
}
