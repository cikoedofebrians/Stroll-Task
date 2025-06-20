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
                        .font(.poppins(.bold, size: 22))
                    Text("7")
                        .font(.poppins(.bold, size: 10))
                        .foregroundStyle(.black)
                        .padding(.vertical, 2)
                        .padding(.horizontal, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.activePurple)
                        )
                    
                }
                Text("Make your move, they are waiting 🎵")
                    .font(.poppins(.italic, size: 12))
                    .foregroundStyle(.secondaryText)
            }
            .padding(.bottom, 12)
            
            Spacer()
            VStack (spacing: 0) {
                ZStack {
                    Circle()
                        .fill(Color(hex: "B5B2FF").opacity(0.6))
                        .frame(width: 44, height: 44)
                        .blur(radius: 16)
                    Image(.profilePicture)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 44 - 8, height: 44 - 8)
                        .mask {
                            Circle()
                        }
                    Circle()
                        .trim(from: 0.35, to: 1)
                        .stroke(AngularGradient(colors: [Color(hex: "4C8D25"), Color(hex: "36631A")], center: .center), style: StrokeStyle(lineWidth: 4, lineCap: .round))
                        .rotationEffect(.degrees(27))
                    
                        .frame(width: 44, height: 44)
                }
                Text("90")
                    .font(.poppins(.bold, size: 10))
                    .padding(.vertical, 3)
                    .padding(.horizontal, 14)
                    .background {
                        RoundedRectangle(cornerRadius: 22)
                            .fill(Color(hex: "12161F"))
                            .shadow(color: .black, radius: 4, x: 0, y: 4)
                        
                    }
                    .offset(y: -12)
            }
            
        }
    }
}
