//
//  ViewController.swift
//  AVMediaTest
//
//  Created by chuck chan on 15/12/16.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit
import  AVFoundation

class ViewController:UIViewController , AVAudioPlayerDelegate , AVAudioRecorderDelegate{

    var sourceFile:String!
    var recorderFile:NSURL!
    var soundRecorder:AVAudioRecorder!
    var musicPlayer:AVAudioPlayer!
    
    let recordSettings = [
        AVSampleRateKey : NSNumber(float: Float(44100.0)),
        AVFormatIDKey : NSNumber(int: Int32(kAudioFormatAppleLossless)),
        AVNumberOfChannelsKey : NSNumber(int: 1),
        AVEncoderAudioQualityKey : NSNumber(int: Int32(AVAudioQuality.High.rawValue)),
        AVEncoderBitRateKey : NSNumber(int: Int32(320000))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
    }
    
    func initData(){
        do{
            sourceFile = NSBundle.mainBundle().pathForResource("Free Loop", ofType: "mp3")
            //录音产生的文件放在临时文件夹
            recorderFile = NSURL.fileURLWithPath(NSTemporaryDirectory().stringByAppendingString("chuck.caf"))
        
            try musicPlayer = AVAudioPlayer(contentsOfURL: NSURL.fileURLWithPath(self.sourceFile))
            
            try soundRecorder = AVAudioRecorder(URL: recorderFile, settings: recordSettings)
        
            musicPlayer.delegate = self
            soundRecorder.delegate = self
        }catch{
            print("occur error")
        }
    }
    
    @IBAction func startPlayMusic(sender: UIButton) {
        musicPlayer.play()
    }
    
    @IBAction func stopPlayMusic(sender: UIButton) {
        musicPlayer.pause()
    }
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool){
        print("播放完成")
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool){
        print("录音完成")
    }
    
    
    @IBAction func startRecord(sender: UIButton) {
        soundRecorder.record()
    }
    
    @IBAction func stopRecord(sender: UIButton) {
        soundRecorder.stop()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

