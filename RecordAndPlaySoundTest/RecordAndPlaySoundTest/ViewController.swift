//
//  ViewController.swift
//  RecordAndPlaySoundTest
//
//  Created by chuck chan on 15/12/21.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var soundRecorder:AVAudioRecorder?
    var soundPlayer:AVAudioPlayer?
    var src:String?
    
    let recordSettings = [
        AVSampleRateKey : 44100.0,
        AVFormatIDKey : NSNumber(unsignedInt : kAudioFormatMPEG4AAC),
        AVNumberOfChannelsKey : 2,
        AVEncoderAudioQualityKey : AVAudioQuality.Max.rawValue,
        AVEncoderBitRateKey : 320000
    ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session:AVAudioSession = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        try! session.setActive(true)
        let docDir = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        src = docDir + "/chuck.aac"
    }
    
    
    @IBAction func startRecord(sender: UIButton) {
        try! soundRecorder = AVAudioRecorder(URL: NSURL.fileURLWithPath(src!), settings:recordSettings )
        soundRecorder?.prepareToRecord()
        soundRecorder?.record()
    }
    
    
    @IBAction func stopAndPlaySound(sender: UIButton) {
        soundRecorder?.stop()
        try! soundPlayer = AVAudioPlayer(contentsOfURL: NSURL.fileURLWithPath(src!))
        soundPlayer?.play()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

