//
//  TGTextSpeechManager.swift
//  TGTextToSpeech
//
//  Created by luo luo on 2023/5/19.
//

import Foundation
import AVFoundation

public class TGTextSpeechManager: NSObject, AVSpeechSynthesizerDelegate {
   public typealias SpeechStatusDidChange = (_ result: Any,_ status:TGTStatus) -> Void
   public var statusChangeBlock:SpeechStatusDidChange?
   public enum TGTStatus {
    case unknow
    case start
    case playing
    case cancel
    case finished
    }
   
   public var synthesizer = AVSpeechSynthesizer()
    // MARK: 公有属性
   public static let shared = TGTextSpeechManager()
    override init() {
        super.init()
        synthesizer.delegate = self;
    }
    
    public func speakChinese(_ text:String) -> Void {
       let avVoice = AVSpeechSynthesisVoice.init(language:"zh-CN")
       let utterance = AVSpeechUtterance.init(string: text)
//       utterance.rate = 0.5 //语速
//       utterance.pitchMultiplier = 0.8// 强度0.5-2.0
//       utterance.volume = 0.75; //0-1 音量
       utterance.voice = avVoice

       synthesizer.speak(utterance)
    }
    
    public func stopSpeak(){
        synthesizer.stopSpeaking(at: .immediate)
    }
    
    public func pauseSpeak(){
        synthesizer.pauseSpeaking(at: .immediate)
    }
    
    public func continueSpeak() -> Bool{
       return synthesizer.continueSpeaking()
    }
    
}


extension TGTextSpeechManager{
    public func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        print("didStart")
        self.statusChangeBlock?("",.start)
    }
    public func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
        print("didCancel")
        self.statusChangeBlock?("",.cancel)
    }
    public func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        print("didFinish")
        self.statusChangeBlock?("",.finished)
    }
}

