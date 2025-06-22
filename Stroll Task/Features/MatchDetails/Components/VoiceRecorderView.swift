//
//  VoiceRecorderView.swift
//  Stroll Task
//
//  Created by Ciko Edo Febrian on 22/06/25.
//

import SwiftUI
import AVFoundation
import Combine



struct VoiceRecorderView: View {
    var proxy: GeometryProxy
    @EnvironmentObject var viewModel: VoiceRecorderViewModel
    @EnvironmentObject var matchesViewModel: MatchesViewModel
    @Binding var isShowPerson: Bool
    @Binding var selectedPerson: People?
    
    var body: some View {
        VStack(spacing: 0) {
            if !viewModel.hasRecording {
                Text(viewModel.formatTime(viewModel.recordingDuration))
                    .font(.proximaNova(.regular, size: 14))
                    .foregroundStyle(Color(hex: "AEADAF"))
                    .contentTransition(.numericText())
            } else {
                Group {
                    Text(viewModel.formatTime(viewModel.playbackDuration))
                        .font(.proximaNova(.regular, size: 14))
                        .foregroundStyle(Color(hex: "B5B2FF"))
                    + Text(" / \(viewModel.formatTime(viewModel.recordingDuration))")
                        .font(.proximaNova(.regular, size: 14))
                        .foregroundStyle(Color(hex: "AEADAF"))
                }
                .contentTransition(.numericText())
                 
            }
            HStack {
                ScrollView(.horizontal) {
                    HStack(spacing: 2) {
                        if !(viewModel.hasRecording && viewModel.playBackEverStarted) {
                            RoundedRectangle(cornerRadius: 2)
                                .fill(Color(hex: "36393E"))
                                .frame(width: proxy.size.width, height: 2)
                        }
                        ForEach(viewModel.bars.indices, id: \.self) { index in
                            RoundedRectangle(cornerRadius: 2)
                                .fill(
                                    viewModel.hasRecording && index < viewModel.playbackBarCount  ?
                                        .activePurple  :Color(hex: "36393E")
                                )
                                .frame(width: 4, height: max(4, CGFloat(viewModel.bars[index])))
                                .id(index)
                        }
                    }
                }
                .scrollDisabled(true)
                .scrollPosition($viewModel.position)
                .scrollIndicators(.hidden)
            }
            .frame(height: 80)
            HStack {
                Button {
                    viewModel.deleteRecording()
                } label: {
                    Text("Delete")
                        .foregroundStyle(.white)
                        .font(.proximaNova(.regular, size: 18))
                }
                .padding(.trailing, 30)

                ZStack {
                    if viewModel.isRecording && viewModel.recordingDuration <= 15 {
                        Circle()
                            .trim(from: 0, to: viewModel.recordingDuration / 15)
                            .stroke(AngularGradient(stops: [
                                Gradient.Stop(color: Color(hex: "4F4CB1"), location: 0),
                                Gradient.Stop(color: Color(hex: "CFCFFE"), location: (viewModel.recordingDuration / 15) - (viewModel.recordingDuration / 15) < 0.04 ? 0.0 : 0.04) ,
                                Gradient.Stop(color: Color(hex: "FFFFFF"), location:(viewModel.recordingDuration / 15)),
                            ], center: .center), lineWidth: 3)
                            .frame(width: 52, height: 52)
                            .rotationEffect(.degrees(-90))
                            .transition(.blurReplace())
                            .blur(radius: 4)
                    }
                    Circle()
                        .stroke(Color(hex: "#B4B4B4"), lineWidth: 2)
                        .frame(width: 52, height: 52)
                    Button {
                        if viewModel.hasRecording {
                            viewModel.togglePlayback()
                        }
                        else if viewModel.isRecording {
                            viewModel.stopRecording()
                        } else {
                            viewModel.startRecording()
                        }
                    } label: {
                        if viewModel.hasRecording {
                            Image(systemName: viewModel.isPlaying ? "pause.fill" : "play.fill")
                                .font(.system(size: 20))
                                .foregroundStyle(Color(hex: "4F4CB1"))
                        }
                        else if viewModel.isRecording {
                            Image(systemName: "stop.fill")
                                .font(.system(size: 20))
                                .foregroundStyle(.white)
                        } else {
                            Circle()
                                .fill(Color(hex: "#4F4CB1"))
                                .frame(width: 44, height: 44)
                        }
                    }
                    
                    if viewModel.isRecording && viewModel.recordingDuration <= 15 {
                        Circle()
                            .trim(from: 0, to: viewModel.recordingDuration / 15)
                            .stroke(AngularGradient(stops: [
                                Gradient.Stop(color: Color(hex: "4F4CB1"), location: 0),
                                Gradient.Stop(color: Color(hex: "CFCFFE"), location: (viewModel.recordingDuration / 15)),
                                Gradient.Stop(color: Color(hex: "FFFFFF"), location:(viewModel.recordingDuration / 15)),
                            ], center: .center), lineWidth: 3)
                            .frame(width: 52, height: 52)
                            .rotationEffect(.degrees(-90))
                            .transition(.blurReplace())
                    }
                }
                Button {
                    withAnimation (.easeInOut(duration: 0.3)){
                        isShowPerson = false
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        if let selectedPerson = selectedPerson {
                            withAnimation {
                                matchesViewModel.checkPerson(selectedPerson)
                            }
                        }
                        selectedPerson = nil
                        viewModel.deleteRecording()
                    }
                } label: {
                    Text("Submit")
                        .foregroundStyle(viewModel.recordingDuration < 15 ? Color(hex: "36393E") : .white)
                        .font(.proximaNova(.regular, size: 18))
                }
                .padding(.leading, 30)
            }
            .padding(.top, 15)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    GeometryReader { proxy in
        
        VoiceRecorderView(proxy: proxy, isShowPerson: .constant(false), selectedPerson: .constant(nil))
            .preferredColorScheme(.dark)
            .background(Color.black)
            .environmentObject(VoiceRecorderViewModel())
    }
}
