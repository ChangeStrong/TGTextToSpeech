//
//  TGTextSpeechManager.swift
//  TGTextToSpeech
//
//  Created by luo luo on 2023/5/19.
//

import Foundation
import AVFoundation

public class TGTextSpeechManager: NSObject {
    var synthesizer = AVSpeechSynthesizer()
    // MARK: 公有属性
   public static let shared = TGTextSpeechManager()
    override init() {
        super.init()
    }
    
   public func testPlayAudio() -> Void {
       let avVoice = AVSpeechSynthesisVoice.init(language:"zh-CN")
       let utterance = AVSpeechUtterance.init(string: "二愣子睁大着双眼，直直望着茅草和烂泥糊成的黑屋顶，身上盖着的旧棉被，已呈深黄色，看不出原来的本来面目，还若有若无的散发着淡淡的霉味")
       utterance.rate = 0.5 //语速
       utterance.pitchMultiplier = 0.8// 强度0.5-2.0
       utterance.volume = 0.75; //0-1 音量
       utterance.voice = avVoice

       synthesizer.speak(utterance)
    }
}
