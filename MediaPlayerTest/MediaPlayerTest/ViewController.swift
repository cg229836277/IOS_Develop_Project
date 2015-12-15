//
//  ViewController.swift
//  MediaPlayerTest
//
//  Created by chuck chan on 15/12/15.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {
    var movieController:MPMoviePlayerController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let moviePath = NSBundle.mainBundle().pathForResource("UIKit", ofType: "mp4")
        let path = NSURL(fileURLWithPath: moviePath!)
        movieController = MPMoviePlayerController(contentURL: path)
        movieController.allowsAirPlay = true
        movieController.view.frame = CGRectMake(150 , 150, 180, 120)
        self.view.addSubview(movieController.view)
        movieController.setFullscreen(true, animated: true)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"playVideoFinished:", name: MPMoviePlayerPlaybackDidFinishNotification, object: movieController)
        
    }
    @IBAction func startPlayVideo(sender: UIButton) {
        movieController.play()
    }
    
    @IBAction func playVideoFinished(receiver:NSNotification){
        print("play finished")
        if receiver.object is MPMoviePlayerController{
            let unknowObject = receiver.object as! MPMoviePlayerController
            NSNotificationCenter.defaultCenter().removeObserver(self, name: MPMoviePlayerPlaybackDidFinishNotification, object: unknowObject)
            unknowObject.view.removeFromSuperview()
        }
    }

    @IBAction func pausePlay(sender: UIButton) {
        movieController.pause()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

