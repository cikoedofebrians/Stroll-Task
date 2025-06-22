//
//  MatchDetailsView.swift
//  Stroll Task
//
//  Created by Ciko Edo Febrian on 22/06/25.
//


import SwiftUI

struct MatchDetailsView: View {
    @Binding var selectedPerson: People?
    @Binding var isShowPerson: Bool
    let namespace: Namespace.ID
    @Binding var showTabBar: Bool
    
    var body: some View {
        GeometryReader { proxy in
            if let person = selectedPerson {
                ZStack (alignment: .top) {
                    Color.black
                    
                    Image(uiImage: person.image)
                        .resizable()
                        .matchedGeometryEffect(id: "\(person.name)", in: namespace, isSource: true)
                        .scaledToFill()
                        .frame(width: proxy.size.width, height: proxy.size.height * 0.75)
                        .ignoresSafeArea()
                    
                    MatchDetailsOverlayShadow(proxy: proxy)
                        .ignoresSafeArea()
                    MatchDetailsHeader(isShowPerson: $isShowPerson, selectedPerson: $selectedPerson, showTabBar: $showTabBar)
                    VStack (spacing: 0){
                        
                        Spacer()
                        VStack (spacing: -6){
                            Image(uiImage: person.image)
                                .resizable()
                                .scaledToFill()
                                .blur(radius: 1)
                                .frame(width: 54, height: 54)
                                .clipShape(Circle())
                                .padding(6)
                                .background {
                                    Circle()
                                        .fill(Color(hex: "121518").opacity(0.9))
                                    
                                }
                            Text("Stroll question")
                                .font(.proximaNova(.semiBold, size: 11))
                                .foregroundStyle(.white)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 4)
                                .background {
                                    Capsule()
                                        .fill(Color(hex: "121518").opacity(0.9))
                                        .shadow(color: .black, radius: 16, x: 1, y: 16)
                                }
                        }
                        .padding(.bottom, 8)
                        Text(person.description)
                            .font(.proximaNova(.bold, size: 24))
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 8)
                        Text("Mine is definitely sneaking the late night snacks")
                            .font(.proximaNova(.regular, size: 13))
                            .italic()
                            .foregroundStyle(Color(hex: "CBC9FF"))
                            .padding(.bottom, 42)
                        
                        VoiceRecorderView(proxy: proxy, isShowPerson: $isShowPerson, selectedPerson: $selectedPerson)
                        
                        Text("Unmatch")
                            .font(.proximaNova(.regular, size: 14))
                            .foregroundStyle(.red)
                            .padding(.top, 24)
                        
                    }
                    .padding(.bottom, 36)
                    .foregroundStyle(Color(hex: "5C6770"))
             
                }
            }
        }
        
    }
}

//
//#Preview {
//    MatchDetailsView(selectedPerson: .constant(
//
//    ), isShowPerson: .constant(false), namespace: Namespace().wrappedValue, showTabBar: .constant(false))
//        .preferredColorScheme(.dark)
//        .environmentObject(VoiceRecorderViewModel())
//}
