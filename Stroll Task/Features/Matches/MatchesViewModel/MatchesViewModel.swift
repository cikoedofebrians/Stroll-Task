//
//  MatchesViewModel.swift
//  Stroll Task
//
//  Created by Ciko Edo Febrian on 23/06/25.
//


import SwiftUI

class MatchesViewModel: ObservableObject {
    @Published var peoples: [People] = [
        People(name: "Amanda", age: 21, image: .people1, isUnlocked: true, isMadeAMove: false, hourSeen: 16, description: "What is your most favorite childhood memory?", isChecked: false),
        People(name: "Malte", age: 31, image: .people2, isUnlocked: true, isMadeAMove: true, hourSeen: nil, description: "What is the most important quality in friendships to you?", isChecked: false),
        People(name: "Binghan", age: 28, image: .people3, isUnlocked: true, isMadeAMove: true, hourSeen: 16, description: "If you could choose to have one superpower, what would it be?", isChecked: false),
    ]
    
    func checkPerson(_ person: People) {
        if let index = peoples.firstIndex(where: { $0.name == person.name }) {
            peoples[index].isChecked.toggle()
        }
    }
}
