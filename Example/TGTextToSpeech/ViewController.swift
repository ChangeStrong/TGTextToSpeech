//
//  ViewController.swift
//  TGTextToSpeech
//
//  Created by ChangeStrong on 05/19/2023.
//  Copyright (c) 2023 ChangeStrong. All rights reserved.
//

import UIKit
import TGTextToSpeech

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if TGAppEnviroment == 1{
            
        }
        self.button.frame = CGRect.init(x: 50, y: 150, width: 100, height: 50)
        self.button2.frame = CGRect.init(x: 50, y: 220, width: 100, height: 50)
        print("viewDidLoad")
        TGTextSpeechManager.shared.statusChangeBlock = { (result,status) in
            print("status=\(status)")
        }
        
    }
    // MARK: 懒加载
    lazy var button: UIButton = {
        let view = UIButton()
        view.setTitle("test", for: UIControl.State.normal)
        view.backgroundColor = UIColor.red
        view.frame = CGRect.init(x: 50, y: 100, width: 100, height: 50)
        view.addTarget(self, action: #selector(testAction), for: UIControl.Event.touchUpInside)
        self.view.addSubview(view)
        return view
    }()
    
    let temps = ["老张叔年轻时，曾经跟城里的有钱人当过几年的伴读书童","是村里唯一认识几个字的读书人","村里小孩子的名字"]
    var currentIndex:Int = 0
    @objc func testAction() -> Void {
        if currentIndex >= temps.count {
            currentIndex = 0
        }
        let temp = temps[currentIndex]
        
        TGTextSpeechManager.shared.speakChinese(temp);
        currentIndex += 1;
        if currentIndex > temps.count {
            currentIndex = 0;
        }
    }
    
    lazy var button2: UIButton = {
        let view = UIButton()
        view.setTitle("test2", for: UIControl.State.normal)
        view.backgroundColor = UIColor.red
        view.frame = CGRect.init(x: 50, y: 190, width: 100, height: 50)
        view.addTarget(self, action: #selector(testAction2), for: UIControl.Event.touchUpInside)
        self.view.addSubview(view)
        return view
    }()
    
    @objc func testAction2() -> Void {
        if TGTextSpeechManager.shared.synthesizer.isSpeaking {
            //停止之前的
            TGTextSpeechManager.shared.stopSpeak()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

