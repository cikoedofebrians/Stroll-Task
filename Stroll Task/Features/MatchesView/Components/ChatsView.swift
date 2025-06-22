//
//  ChatsView.swift
//  Stroll Task
//
//  Created by Ciko Edo Febrian on 21/06/25.
//


import SwiftUI

struct ChatsView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 0){
            ForEach(chats, id: \.self) { chat in
                HStack (alignment: .center, spacing: 0){
                    Image(uiImage: chat.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 52, height: 52)
                        .clipShape(Circle())
                        .padding(.trailing, 16)
                    VStack(spacing: 0) {
                        HStack(alignment: .top, spacing: 0) {
                            VStack(alignment: .leading, spacing: 2) {
                                HStack (alignment: .center, spacing: 0) {
                                    Text(chat.name)
                                        .font(.proximaNova(.bold, size: 16))
                                        .padding(.trailing, 10)
                                    
                                    if chat.isNewChat || !chat.isLastMessageFromMe {
                                        HStack (spacing: 4){
                                            if chat.isNewChat {
                                                Circle()
                                                    .fill(.white)
                                                    .frame(width: 5, height: 5)
                                            }
                                            Text(chat.isNewChat ? "New chat" : "Your move")
                                                .font(.proximaNova(.semiBold, size: 10))
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
                                        .font(.proximaNova(chat.isLastMessageFromMe ? .regular : .semiBold, size: 14))
                                        .foregroundStyle(chat.isLastMessageFromMe ? .tertiaryText : .primaryText)
                                        .lineLimit(2)
                                case .voiceRecord(let duration):
                                    HStack(spacing: 4) {
                                        Image(.voiceRecordIcon)
                                            .resizable()
                                            .frame(width: 48, height: 20)
                                            .padding(.trailing, 8)
                                        Text("00:\(duration < 10 ? "0\(duration)" : "\(duration)")")
                                            .font(.proximaNova(.bold, size: 14))
                                            .foregroundStyle(
                                                LinearGradient(colors: [Color(hex: "8669A8"),
                                                                        Color(hex: "9B82B9")], startPoint: .bottom, endPoint: .top)
                                            )
                                    }
                                    .padding(.top, 4)
                                    
                                }
                            }
                            .padding(.trailing, 12)
                            Spacer()
                            
                            VStack(alignment: .trailing, spacing: 4) {
                                Text(chat.isToday ? "\(Int.random(in: 10...23)):\(Int.random(in: 11...59)) pm" : "Wed")
                                    .font(.proximaNova(.semiBold, size: 12))
                                    .foregroundStyle(chat.isToday ? Color(hex: "555390") : .secondaryText)
                                
                                
                                Group {
                                    if chat.isNewChat {
                                        Image(systemName: "star.fill")
                                            .font(.system(size: 8))
                                    }
                                    if chat.unreadCount > 0 {
                                        Text("\(chat.unreadCount)")
                                            .font(.proximaNova(.bold, size: 10))
                                        
                                    }
                                }
                                .foregroundStyle(.black)
                                .padding(.vertical, 2)
                                .padding(.horizontal, 6)
                                .background {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color(hex: "B5B2FF"))
                                }
                                
                                
                            }
                        }
                        .padding(.vertical, 6)
                        .frame(height: 69, alignment: .top)
                        Divider()
                            .frame(height: 1)
                    }
                
                }
                .frame(height: 70)
          
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 16)
        .padding(.bottom, 50)
    }
}

#Preview {
    ChatsView()
        .preferredColorScheme(.dark)
}
