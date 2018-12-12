//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    var audioPlayer : AVAudioPlayer?
    
    
    let noteList : [String] = ["note1" , "note2" , "note3" ,"note4" , "note5" , "note6" , "note7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        
        if let resourcePath = Bundle.main.path(forResource: noteList[sender.tag - 1], ofType: "wav") {
            let noteSound : URL?
            noteSound = URL(fileURLWithPath: resourcePath)
            
            do {
                audioPlayer =  try AVAudioPlayer.init(contentsOf: noteSound! )
            }
            catch {
                print("Error in obtaining AVAudioPlayer")
            }
            
            if let audioP = audioPlayer {
                audioP.prepareToPlay()
                audioP.play()
            }
        }
        else {
            print("Error - Unable to find sound track in resource folder")
        }
        
    }
    
  

}

