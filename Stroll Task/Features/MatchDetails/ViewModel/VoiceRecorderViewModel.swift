//
//  VoiceRecorderViewModel.swift
//  Stroll Task
//
//  Created by Ciko Edo Febrian on 23/06/25.
//


import SwiftUI
import AVFoundation
import Combine


class VoiceRecorderViewModel: NSObject, ObservableObject, AVAudioRecorderDelegate {
    @Published var bars: [Int] = []
    @Published var position = ScrollPosition(edge: .leading)
    @Published var isRecording = false
    @Published var isPlaying = false
    @Published var hasRecording = false
    @Published var recordingDuration: TimeInterval = 0
    @Published var playbackDuration: TimeInterval = 0
    @Published var playbackBarCount: Int = 0
    @Published var playBackEverStarted: Bool = false
    
    private var audioRecorder: AVAudioRecorder?
    private var audioPlayer: AVAudioPlayer?
    private var recordingURL: URL?
    private var timer: Timer?
    private var levelTimer: Timer?
    private var playbackTimer: Timer?

    
    override init() {
        super.init()
        setupAudioSession()
    }
    
    func startRecording() {
        playBackEverStarted = false
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        recordingURL = documentsPath.appendingPathComponent("recording_\(Date().timeIntervalSince1970).m4a")
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            guard let url = recordingURL else { return }
            audioRecorder = try AVAudioRecorder(url: url, settings: settings)
            audioRecorder?.delegate = self
            audioRecorder?.isMeteringEnabled = true
            audioRecorder?.record()
            isRecording = true
            recordingDuration = 0
            
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                withAnimation {
                    self.recordingDuration += 0.01
                }
            }
            
            levelTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                self.updateBars()
            }
            
        } catch {
            print("Could not start recording: \(error)")
        }
    }
    
    func stopRecording() {
        audioRecorder?.stop()
        isRecording = false
        timer?.invalidate()
        levelTimer?.invalidate()
        hasRecording = true
    }
    
    func togglePlayback() {
        if isPlaying {
            audioPlayer?.pause()
            isPlaying = false
            playbackTimer?.invalidate()
        } else {
            guard let url = recordingURL, hasRecording else { return }
            if audioPlayer == nil {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: url)
                    audioPlayer?.delegate = self
                } catch {
                    print("Could not start playback: \(error)")
                    return
                }
            }
            audioPlayer?.play()
            isPlaying = true
            playBackEverStarted = true
            playbackTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [self] _ in
                guard self.audioPlayer != nil else { return }
          
                withAnimation {
                    self.position.scrollTo(id: playbackBarCount)
                    self.playbackBarCount += 1
                    self.playbackDuration += 0.1
                }

            }
        }
    }
    
    func deleteRecording() {
        stopRecording()
        if let url = recordingURL {
            try? FileManager.default.removeItem(at: url)
        }
        withAnimation {
            bars.removeAll()
            resetState()
        }
    }
    
    private func setupAudioSession() {
        do {
            let session = AVAudioSession.sharedInstance()
            try session.setCategory(.playAndRecord, mode: .default, options: .defaultToSpeaker)
            try session.setActive(true)
        } catch {
            print("Failed to setup audio session: \(error)")
        }
    }
    
    private func stopPlayback() {
        audioPlayer?.stop()
        isPlaying = false
        playbackTimer?.invalidate()
        audioPlayer = nil
        playbackDuration = 0
        playbackBarCount = 0
    }
    
    private func resetState() {
        stopPlayback()
        hasRecording = false
        recordingDuration = 0
        recordingURL = nil
        playBackEverStarted = false
    }
    private func updateBars() {
        
        guard let recorder = audioRecorder, isRecording else { return }
        
        recorder.updateMeters()
        
        let power = recorder.averagePower(forChannel: 0)
        let sileneceThreshold: Float = -40.0
        
        let normalizedPower = max(0, Int(power - sileneceThreshold))
        
        let randomMultiplier = Float.random(in: 1.2...1.5)
        let barHeight = Float(normalizedPower) * randomMultiplier
        
        bars.append(Int(barHeight))
        
        if let lastId = bars.indices.last {
            DispatchQueue.main.async {
                self.position.scrollTo(id: lastId, anchor: .trailing)
            }
        }
    }
    
    func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}


extension VoiceRecorderViewModel: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        stopPlayback()
    }
}
