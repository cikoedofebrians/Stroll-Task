//
//  PeopleScrollView.swift
//  Stroll Task
//
//  Created by Ciko Edo Febrian on 20/06/25.
//

import SwiftUI

struct PeopleScrollView: View {
    @Binding var selectedPerson: People?
    @EnvironmentObject var matchesViewModel: MatchesViewModel
    @Binding var isShowPerson: Bool
    
    let namespace: Namespace.ID
    var body: some View {
        ScrollView (.horizontal){
            ScalableHStack(spacing: 16) {
                ForEach(matchesViewModel.peoples, id: \.self) { people in
                    Button {
                        withAnimation(.spring(duration: 0.3)) {
                            isShowPerson = true
                            selectedPerson = people
                        }
                    } label: {
                        ZStack (alignment: .center) {
                            ZStack {
                                Image(uiImage: people.image)
                                    .resizable()
                                    .matchedGeometryEffect(id: "\(people.name)", in: namespace, isSource: true)
                                    .scaledToFill()
                                    .scalableFrame(height: 205, width: 145)
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
                            if people.isChecked {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 30))
                                    .foregroundStyle(Color(hex: "908CE3"))
                                    .shadow(color: Color(hex: "908CE3").opacity(0.75), radius: 4, y: 4)
                                    .transition(.blurReplace())
                            }
                            if !people.isUnlocked {
                                Text("Tap to answer")
                                    .scalableFontSize(weight: .bold, size: 10)
//                                    .font(.proximaNova(.bold, size: 10))
                                    .foregroundStyle(Color(hex: "A8AFB7"))
                                    .offset(y: -25)
                            }
                            ScalableVStack(spacing: 6) {
                                if people.isMadeAMove {
                                    ScalableHStack {
                                        if (people.hourSeen == nil) {
                                            Text("📣 They made a move!")
                                                .foregroundStyle(.white)
                                                .scalableFontSize(weight: .semiBold, size: 9)
                                                .scalablePadding(.horizontal, 10)
                                                .scalablePadding(.vertical, 4)
                                                .background{
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .fill(.black)
                                                }
                                        } else if (people.hourSeen != nil && people.hourSeen != nil) {
                                            Text("📣")
                                                .font(.system(size: 12))
                                                .scalablePadding(.horizontal, 6)
                                                .scalablePadding(.vertical, 6)
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
                                                        .foregroundStyle(.white)
                                                        .scalableFontSize(weight: .bold, size: 7)
                                                }
                                            }
                                        }
                                    }
                                    .scalablePadding(.top, 12)
                                }
                                Spacer()
                                Text("\(people.name), \(people.age)")
                                    .foregroundStyle(.white)
//                                    .font(.proximaNova(.bold, size: 16))
                                    .scalableFontSize(weight: .bold, size: 16)
                                Text(people.description)
                                    .foregroundStyle(Color(hex: "CFCFFE"))
//                                    .font(.proximaNova(.regular, size: 10))
                                    .scalableFontSize(weight: .regular, size: 10)
                                    .multilineTextAlignment(.center)
//                                    .padding(.bottom, 16)
                                    .scalablePadding(.bottom, 16)
                            }
//                            .padding(.horizontal, 15)
                            .scalablePadding(.horizontal, 15)
                            
                        }
                        .scalableFrame(height: 205, width: 145)
          
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(hex: "222222"))
                        .shadow(radius: 4, x: 2, y: 4)
         
                    Image(.morePeople)
                        .resizable()
                        .scaledToFit()
//                        .padding(.horizontal, 14)
                        .scalablePadding(.horizontal, 14)
                }
                .scalableFrame(height: 205, width: 90)
            }
        }
        .scrollClipDisabled()
        .scrollIndicators(.hidden)
        .contentMargins(.horizontal, 20)
//        .padding(.top, 12)
        .scalablePadding(.top, 12)

    }
}

#Preview {
    PeopleScrollView(selectedPerson: .constant(nil), isShowPerson: .constant(false), namespace: Namespace().wrappedValue)
        .preferredColorScheme(.dark)
        .environmentObject(MatchesViewModel())
}

