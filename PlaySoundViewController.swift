//
//  PlaySoundViewController.swift
//  VoiceTwist
//
//  Created by kushal on 17/05/15.
//  Copyright (c) 2015 Voice Twist Ltd. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {

    var audioPlayer:AVAudioPlayer!
    var recievedAudio:RecordedAudio!
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: recievedAudio.filePathUrl, error: nil)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: recievedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func playSnailSound(sender: UIButton) {
        stopAllPlayerEngine()
        playAtRate(0.2)
    }
    
    @IBAction func PlayRabbitSound(sender: UIButton) {
        stopAllPlayerEngine()
        playAtRate(3.0)
    }
    
    @IBAction func StopAudioPlay(sender: UIButton) {
        stopAllPlayerEngine()
    }
    
    @IBAction func PlayChipMunksound(sender: UIButton) {
        playAudioWithVariablePitch(1000)
    }
    
    @IBAction func PlayDragSound(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
    }
    
    /**
    Plays the sound at a certain rate/speed
    
    :param: rate: rate at which we want the sound to play.
    */
    func playAtRate(rate: Float){
        stopAllPlayerEngine()
        audioPlayer.rate = rate
        audioPlayer.play()
    }
    
    /**
    Stops the audioPlayer and sets the time to 0.0
    and stops the audioEngine and resets it.
    */
    func stopAllPlayerEngine(){
        audioPlayer.stop()
        audioPlayer.currentTime = 0.0
        audioEngine.stop()
        audioEngine.reset()
    }
    
    /**
    Plays the sound at a certain given pitch
    
    :param: pitch: pitch at which we want the sound to play.
    */
    func playAudioWithVariablePitch(pitch: Float){
        stopAllPlayerEngine()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)

        audioPlayerNode.play()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
