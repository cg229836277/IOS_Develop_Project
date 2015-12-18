//
//  ViewController.swift
//  MediaPlayerTest
//
//  Created by chuck chan on 15/12/15.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController ,MPMediaPickerControllerDelegate{
    var movieController:MPMoviePlayerController!
    
    var mediaPickerController:MPMediaPickerController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let moviePath = NSBundle.mainBundle().pathForResource("UIKit", ofType: "mp4")
        let path = NSURL(fileURLWithPath: moviePath!)
        movieController = MPMoviePlayerController(contentURL: path)
        movieController.allowsAirPlay = true
        movieController.view.frame = CGRectMake(150 , 350, 180, 120)
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
    
    
    @IBAction func startMediaPickerView(sender: UIButton) {
        startMediaPicker()
    }
    
    func startMediaPicker(){
        mediaPickerController = MPMediaPickerController(mediaTypes: MPMediaType.VideoPodcast)
        mediaPickerController.prompt = "Choose Movies"
        mediaPickerController.allowsPickingMultipleItems = true
        mediaPickerController.delegate = self
        self.presentViewController(mediaPickerController, animated: true, completion: nil)
    }
    
    func mediaPicker(mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        print("have selected items")
        mediaPicker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func mediaPickerDidCancel(mediaPicker: MPMediaPickerController) {
        print("cancel selected")
        mediaPicker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func startPlaySongs(sender: UIButton) {
        startPlayMusic()
    }
    
    //在选择多媒体文件为音乐之后可以调用这个方法播放音乐
    func startPlayMusic(){
        let musicPlayer = MPMusicPlayerController.systemMusicPlayer()
        let mediaItems = MPMediaQuery.songsQuery().items
        let mediaItemCollection = MPMediaItemCollection(items: mediaItems!)
        if mediaItems == nil{
            return
        }
        musicPlayer.setQueueWithItemCollection(mediaItemCollection)
        musicPlayer.play()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

