//
//  HeaderView.swift
//  Stroll Task
//
//  Created by Ciko Edo Febrian on 20/06/25.
//


import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: 10) {
                    Text("Your Turn")
                        .foregroundStyle(.primaryText)
                        .font(.proximaNova(.bold, size: 22))
                    Text("7")
                        .font(.proximaNova(.bold, size: 10))
                        .foregroundStyle(.black)
                        .padding(.vertical, 2)
                        .padding(.horizontal, 7)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.activePurple)
                        )
                    
                }
                Text("Make your move, they are waiting 🎵")
                    .font(.proximaNova(.regular, size: 12))
                    .italic()
                    .foregroundStyle(.secondaryText)
            }
            
            Spacer()
            VStack (spacing: 0) {
                ZStack {
                    Circle()
                        .fill(Color(hex: "B5B2FF").opacity(0.4))
                        .frame(width: 44, height: 44)
                        .blur(radius: 12)
                    Image(.profilePicture)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 37, height: 37)
                        .mask {
                            Circle()
                        }
                    Circle()
                        .trim(from: 0.35, to: 1)
                        .stroke(Color(hex: "363636"), style: StrokeStyle(lineWidth: 4, lineCap: .round))
                        .rotationEffect(.degrees(27))
                    
                        .frame(width: 44, height: 44)
                    Circle()
                        .trim(from: 0.35, to: 0.92)
                        .stroke(AngularGradient(stops:[
                            Gradient.Stop(color: Color(hex: "4C8D25").opacity(1), location: 0.02),
                            Gradient.Stop(color: Color(hex: "36631A").opacity(1), location: 0.77),
                            
                        ], center: .center), style: StrokeStyle(lineWidth: 3, lineCap: .round))
                        .rotationEffect(.degrees(27))
                        .frame(width: 44, height: 44)
                    
                    Rectangle()
                        .fill(
                            LinearGradient(stops: [
                                Gradient.Stop(color: Color(hex: "B5B2FF").opacity(0.0), location: 0.0),
                                Gradient.Stop(color: Color(hex: "B5B2FF").opacity(1), location: 0.2),
                                Gradient.Stop(color: Color(hex: "B5B2FF").opacity(1), location: 0.8),
                                Gradient.Stop(color: Color(hex: "B5B2FF").opacity(0.0), location: 1),
                            ], startPoint: .leading, endPoint: .trailing)
                        )
                        .frame(width: 10, height: 2)
                        .offset(x: 22)
                    Text("90")
                        .font(.proximaNova(.bold, size: 12))
                        .padding(.vertical, 3)
                        .padding(.horizontal, 14)
                        .background {
                            RoundedRectangle(cornerRadius: 22)
                                .fill(Color(hex: "12161F"))
                                .shadow(color: .black, radius: 4, x: 0, y: 4)
                            
                        }
                        .offset(y: 22)
                }

            }

            
        }
    }
}

#Preview {
    HeaderView()
        .preferredColorScheme(.dark)
}
