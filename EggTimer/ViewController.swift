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
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var titulozinho: UILabel!
    
    @IBOutlet weak var barrinhaProgresso: UIProgressView!
    
    
    //let softEgg = 5
    //let mediumEgg = 7
    //let hardEgg = 12
    let eggTimes = ["Soft": 3, "Medium": 420, "Hard": 720]
    var secondsRemaining = 60
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    @IBAction func buttonEgss(_ sender: UIButton) {
        
        func playSound() {
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
        
        barrinhaProgresso.progress = 1.0
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = 0
        secondsPassed = 0
        titulozinho.text = hardness
        
        totalTime = eggTimes[hardness]!
       timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
           if self.secondsPassed < self.totalTime {
                   self.secondsPassed += 1
               self.barrinhaProgresso.progress = Float (self.secondsPassed) / Float (self.totalTime)
               
                } else {
                    Timer.invalidate()
                    self.titulozinho.text = "Done!"
                    playSound()
                }
           
           
        //switch hardness {
        //case "Soft":
            //print(softEgg)
        //case "Medium":
            //print(mediumEgg)
        //case "Hard":
            //print(hardEgg)
       // default:
           // print("wtf? where's the goddam egg???")
        //}
        
        //if hardness == "Soft" {
             //print(softEgg)
        //} else if hardness == "Medium" {
             //print(mediumEgg)
        //} else if hardness == "Hard" {
             //print(hardEgg)
        //}
    }

}
   
}
