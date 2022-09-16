//
//  SoundManager.swift
//  MatchApp
//
//  Created by Kevin Nyangena on 9/16/22.
//

import Foundation

import AVFoundation

class SoundManager {
    
    var audioPlayer:AVAudioPlayer?
    
    enum SoundEffect {
        case flip
        case match
        case nomatch
        case shuffle
    }
    
    func playSound(effect:SoundEffect) {
        
        var soundFileName = ""
        
        switch effect {
            
            case .flip:
                soundFileName = "cardflip"
                
            case .match:
                soundFileName = "dingcorrect"
                
            case .nomatch:
                soundFileName = "dingwrong"
                
            case .shuffle:
                soundFileName = "shuffle"
        }
    
        // Get the path to the sound resource
        let bundlePath = Bundle.main.path(forResource: soundFileName, ofType: ".wav")
        
        // Check that it's not nil
        guard bundlePath != nil else {
            // Couldn't find the resource, exit.
            return
        }
       
        let soundURL = URL(fileURLWithPath: bundlePath!)
        
        do {
            
            // Create the audio player
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
           
            
            // Play the sound effect
            audioPlayer?.play()
            
        }
        
        catch {
            print("Could not create an audio player")
            return
        }
    }
}
