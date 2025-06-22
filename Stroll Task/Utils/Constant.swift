//
//  Constant.swift
//  Stroll Task
//
//  Created by Ciko Edo Febrian on 20/06/25.
//

import SwiftUI

struct TabViewOption: Hashable {
    let icon: UIImage
    let activeIcon: UIImage
    let title: String
    let notificationCount: Int
}

struct People: Hashable {
    let name: String
    let age: Int
    let image: UIImage
    let isUnlocked: Bool
    let isMadeAMove: Bool
    let hourSeen: Int?
    let description: String
}


let peoples: [People] = [
    People(name: "Amanda", age: 21, image: .people1, isUnlocked: false, isMadeAMove: false, hourSeen: 16, description: "What is your most favorite childhood memory?"),
    People(name: "Malte", age: 31, image: .people2, isUnlocked: false, isMadeAMove: true, hourSeen: nil, description: "What is the most important quality in friendships to you?"),
    People(name: "Binghan", age: 28, image: .people3, isUnlocked: true, isMadeAMove: true, hourSeen: 16, description: "If you could choose to have one superpower, what would it be?"),

]
    

let tabViewOptions: [TabViewOption] = [
    TabViewOption(icon: .inactiveCardsIcon, activeIcon: .activeCardsIcon,  title: "Cards", notificationCount: 10),
    TabViewOption(icon: .inactiveBonfireIcon, activeIcon: .activeBonfireIcon, title: "Bonfire", notificationCount: 0),
    TabViewOption(icon: .inactiveMatches, activeIcon: .activeMatchesIcon, title: "Matches", notificationCount: 0),
    TabViewOption(icon: .profileIcon, activeIcon: .profileIcon, title: "Profile", notificationCount: 0),
    
]


enum MessageType: Hashable {
    case text(String)
    case voiceRecord(Int)
}

struct Chat: Hashable {
    let name: String
    let image: UIImage
    let lastMessage: MessageType
    let isLastMessageFromMe: Bool
    let unreadCount: Int
    let isFavorite: Bool
    let isNewChat: Bool
    let isToday: Bool
}


let chats: [Chat] = [
    Chat(name: "Jessica", image: .profilePicture, lastMessage: .voiceRecord(10), isLastMessageFromMe: false, unreadCount: 0, isFavorite: true, isNewChat: true, isToday: true),
    Chat(name: "Amanda", image: .profilePicture, lastMessage: .text("Lol I love house music too"), isLastMessageFromMe: false, unreadCount: 0, isFavorite: false, isNewChat: false, isToday: true),
    Chat(name: "Sila", image: .profilePicture, lastMessage: .text("I love the people there tbh, have you been?"), isLastMessageFromMe: true, unreadCount: 0, isFavorite: false, isNewChat: false, isToday: false),
    Chat(name: "Marie", image: .profilePicture, lastMessage: .text("Hahaha that's interesting, it does seem like people here are startin..."), isLastMessageFromMe: false, unreadCount: 4, isFavorite: false, isNewChat: false, isToday: true),
    Chat(name: "Jessica", image: .profilePicture, lastMessage: .voiceRecord(58), isLastMessageFromMe: false, unreadCount: 0, isFavorite: false, isNewChat: false, isToday: true),
]
