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
        
       
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        TGTextSpeechManager.shared.testPlayAudio();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

