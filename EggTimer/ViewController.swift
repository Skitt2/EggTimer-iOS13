//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimer = ["Soft": 10, "Medium": 20, "Hard": 30]
    
    var totalTime = 0
    
    var secondPassed = 0
    
    var timer = Timer()
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var barProgressView: UIProgressView!
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimer[hardness]!
        
        barProgressView.progress = 0.0
        secondPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)

        
    }
    
    @objc func updateCounter() {
        //example functionality
        if secondPassed < totalTime {
            secondPassed += 1
            
            let percentageProgress = Float(secondPassed) / Float(totalTime)
            
            barProgressView.progress = percentageProgress
            
            print(secondPassed)
            print(percentageProgress)
        } else {
            timer.invalidate()
            titleLabel.text = "done!"
            
            playSound(soundName: "alarm_sound")
        
        }
        
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }

}
    
