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
                            
                            
                            if !people.isUnlocked  {
                                LinearGradient(colors: [.clear, .black], startPoint: .center, endPoint: .bottom)
                                LinearGradient(colors: [.clear, .black], startPoint: .center, endPoint: .bottom)
                                LinearGradient(colors: [.clear, .black], startPoint: .center, endPoint: .bottom)
                            } else {
                                LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
                            }
                      
                            
                            if !people.isUnlocked {
                                Rectangle()
                                    .fill(
                                        .ultraThinMaterial
                                    )
                            }
                            

                            
                        }
                        .clipShape(
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                        )
                        .shadow(color: .black, radius: 4, x: 2, y: 4)
                        
                        if !people.isUnlocked {
                            Text("Tap to answer")
                                .font(.proximaNova(.bold, size: 10))
                                .foregroundStyle(Color(hex: "A8AFB7"))
                                .offset(y: -25)
                        }
                        VStack(spacing: 6) {
                            if people.isMadeAMove {
                                HStack {
                                    if (people.hourSeen == nil) {
                                        Text("📣 They made a move!")
                                            .font(.proximaNova(.semiBold, size: 9))
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 4)
                                            .background{
                                                RoundedRectangle(cornerRadius: 20)
                                                    .fill(.black)
                                            }
                                    } else if (people.hourSeen != nil && people.hourSeen != nil) {
                                        Text("📣")
                                            .font(.system(size: 12))
                                            .padding(6)
                                            .background {
                                                Circle()
                                                    .fill(.black)
                                            }
                                        
                                        if let hourSeen = people.hourSeen {
                                            Spacer()
                                            ZStack {
                                                Circle()
                                                    .fill(.black)
                                                    .frame(width: 32, height: 32)
                                                    .blur(radius: 5)
                                                Circle()
                                                    .fill(.white.opacity(0.5))
                                                    .frame(width: 22, height: 22)
                                                Circle()
                                                    .trim(from: 0.35, to: 1)
                                                    .stroke(.white, style: StrokeStyle(lineWidth: 2, lineCap: .round))
                                                    .rotationEffect(.degrees(150))
                                                    .frame(width: 24, height: 24)
                                                Text("\(hourSeen)h")
                                                    .font(.proximaNova(.bold, size: 7))
                                            }
                                        }
                                    }
                                }
                                .padding(.top, 12)
                            }
                            Spacer()
                            Text("\(people.name), \(people.age)")
                                .font(.proximaNova(.bold, size: 16))
                            Text(people.description)
                                .foregroundStyle(Color(hex: "CFCFFE"))
                                .font(.proximaNova(.regular, size: 10))
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 16)
                        }
                        .padding(.horizontal, 15)
                        
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
        .scrollClipDisabled()
        .scrollIndicators(.hidden)
        .contentMargins(.horizontal, 20)
        .padding(.top, 12)
    }
}

#Preview {
    PeopleScrollView()
//        .preferredColorScheme(.dark)
}

