//
//  PeopleScrollView.swift
//  Stroll Task
//
//  Created by Ciko Edo Febrian on 20/06/25.
//

import SwiftUI

struct PeopleScrollView: View {
    var body: some View {
        ScrollView (.horizontal){
            HStack(spacing: 16) {
                ForEach(peoples, id: \.self) { people in
                    ZStack (alignment: .center) {
                        ZStack {
                            Image(uiImage: people.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 145, height: 205)
                                .clipped()
                                .blur(radius: people.isUnlocked ? 0 : 16)
                            LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
                        }
                        .clipShape(
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                        )
                        .shadow(radius: 4, x: 2, y: 4)
                        
                        if !people.isUnlocked {
                            Text("Tap to answer")
                                .font(.poppins(.bold, size: 10))
                                .foregroundStyle(Color(hex: "A8AFB7"))
                                .offset(y: -25)
                        }
                        VStack(spacing: 6) {
                            if people.isMadeAMove {
                                HStack {
                                    Text(people.hourSeen == nil ? "📣 They made a move!" : "📣")
                                        .font(.poppins(.semiBold, size: 8))
                                        .padding(.horizontal, people.hourSeen == nil ? 10 : 8)
                                        .padding(.vertical, people.hourSeen == nil ? 4 : 8)
                                        
                                        .background{
                                            RoundedRectangle(cornerRadius: 20)
                                                .fill(.black)
                                        }
                                    
                                    if let hourSeen = people.hourSeen {
                                        Spacer()
                                        ZStack {
                                            Circle()
                                                .fill(.white.opacity(0.5))
                                                .frame(width: 22, height: 22)
                                                .shadow(color: .black, radius: 8)
                                            Circle()
                                                .trim(from: 0.35, to: 1)
                                                .stroke(lineWidth: 2)
                                                .rotationEffect(.degrees(150))
                                                .frame(width: 24, height: 24)
                                            Text("\(hourSeen)h")
                                                .font(.poppins(.bold, size: 7))
                                        }
                                    }
                                }
                                .padding(.top, 16)
                            }
                            Spacer()
                            Text("\(people.name), \(people.age)")
                                .font(.poppins(.bold, size: 16))
                            Text(people.description)
                                .foregroundStyle(Color(hex: "CFCFFE"))
                                .font(.poppins(.regular, size: 10))
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 16)
                        }
                        .padding(.horizontal,14)
                        
                    }
                    .frame(width: 145, height: 205)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(hex: "222222"))
                        .shadow(radius: 4, x: 2, y: 4)
         
                    Image(.morePeople)
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 14)
                }
                .frame(width: 90, height: 205)
            }
        }
        .scrollIndicators(.hidden)
        .contentMargins(.horizontal, 20)
        .padding(.top, 12)
    }
}

#Preview {
    PeopleScrollView()
        .preferredColorScheme(.dark)
}

