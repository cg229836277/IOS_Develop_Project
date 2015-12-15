//
//  ViewController.swift
//  SoundPlayTest
//
//  Created by chuck chan on 15/12/15.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    
    @IBOutlet weak var startPlaySound: UIButton!
    
    @IBOutlet weak var startPlayAlertSound: UIButton!
    
    
    @IBOutlet weak var startPlayVibration: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        startPlaySound.addTarget(self, action: "startPlaySound:", forControlEvents: UIControlEvents.TouchUpInside)
        
        startPlayAlertSound.addTarget(self, action: "playAlertSound:", forControlEvents: UIControlEvents.TouchUpInside)
        
        startPlayVibration.addTarget(self, action: "playVibration:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    //播放系统声音
    @IBAction func startPlaySound(sender:UIButton){
        var soundId:SystemSoundID = 0
        let path:String = NSBundle.mainBundle().pathForResource("login", ofType: "wav")!
        let soundUrl = NSURL(fileURLWithPath: path)
        AudioServicesCreateSystemSoundID(soundUrl, &soundId)
        AudioServicesPlaySystemSound(soundId)
    }
    
    @IBAction func playAlertSound(sender : UIButton){
        var soundId:SystemSoundID = 0
        let path:String = NSBundle.mainBundle().pathForResource("login", ofType: "wav")!
        let soundUrl = NSURL(fileURLWithPath: path)
        AudioServicesCreateSystemSoundID(soundUrl, &soundId)
        AudioServicesPlayAlertSound(soundId)
    }
    
    //震动
    @IBAction func playVibration(){
        let sound = SystemSoundID(kSystemSoundID_Vibrate)
        AudioServicesPlaySystemSound(sound)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

