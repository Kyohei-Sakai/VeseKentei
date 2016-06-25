//
//  SEManager.swift
//  WinePiano
//
//  Created by 酒井恭平 on 2016/06/17.
//  Copyright © 2016年 酒井恭平. All rights reserved.
//

import Foundation
import AVFoundation

class SEManager: NSObject,AVAudioPlayerDelegate{
    
    //var player: AVAudioPlayer!
    
    var soundArray = [AVAudioPlayer]()
    
    
    func sePlay(soundName: String){
        
        let path = NSBundle.mainBundle().bundleURL.URLByAppendingPathComponent(soundName)
        
        var player: AVAudioPlayer!
        
        do{
            
            try player = AVAudioPlayer(contentsOfURL: path)
            
            //player.numberOfLoops = -1
            soundArray.append(player)
            player.delegate = self
            
            player.prepareToPlay()
            player.play()
        }
        catch{
            print("Error!")
        }
    }
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer,successfully flag: Bool){
        
        let i:Int = soundArray.indexOf(player)!
        
        soundArray.removeAtIndex(i)
        
    }
    
    
}