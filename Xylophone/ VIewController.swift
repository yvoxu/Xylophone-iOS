//
//  ViewController.swift
//  Xylophone
//

import UIKit
import AVFoundation


class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    var pianoSoundEffect: AVAudioPlayer!
    let sounds = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func notePressed(_ sender: UIButton) {
        
        playSound(soundFileName : sounds[sender.tag - 1])
    }
    
    func playSound(soundFileName : String){
        
        let path = Bundle.main.path(forResource: soundFileName, ofType: "wav")! // path for the sound file
        let url = URL(fileURLWithPath: path)
        
        do {
            try pianoSoundEffect = AVAudioPlayer(contentsOf: url) // open a CD player and put the CD in
            // this method throws an error if needed and therefore we try and catch it
            // if you believe there won't be an error, use try! to override
        } catch {
            print(error)
        }
        pianoSoundEffect.play()
    }
    
}

