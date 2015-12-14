//
//  ViewController.swift
//  CoreAnimationTest
//
//  Created by chuck chan on 15/12/13.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstLayer:CALayer!
    
    
    @IBOutlet weak var startRunAnimation: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        //firstLayer = CALayer()
        
        //setLayerProperty()
        
        startRunAnimation.addTarget(self, action: "startRun:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    @IBAction
    func startRun(sender:UIButton){
        //moveLayer()
        //caBaseAnimation()
        keyFrameAnimation()
    }
    
    func setLayerProperty(){
        firstLayer.backgroundColor = UIColor.cyanColor().CGColor
        firstLayer.borderColor = UIColor.purpleColor().CGColor
        firstLayer.borderWidth = 5.0
        firstLayer.cornerRadius = 10
        firstLayer.borderWidth = 3.0
        firstLayer.shadowColor = UIColor.redColor().CGColor
        firstLayer.shadowOpacity = 0.8
        firstLayer.shadowRadius = 8.0
        firstLayer.shadowOffset = CGSize(width: 10, height: 10)
        firstLayer.frame = CGRectMake(80, 80, 100, 100)
        self.view.layer.addSublayer(firstLayer)
    }
    //相当于隐式动画
    func moveLayer(){
        //firstLayer.frame.origin.y += 100
        firstLayer.position.y += 200
    }
    
    func caBaseAnimation(){
        let animationImage = UIImageView(image: UIImage(named: "4.JPG"))
        animationImage.frame = CGRectMake(150, 150, 100, 100)
        self.view.addSubview(animationImage)
        
        let layer = animationImage.layer
        //缩放动画
        let caBasic = CABasicAnimation(keyPath:"transform.scale")
        caBasic.fromValue = 1.0
        caBasic.toValue = 2.0
        caBasic.autoreverses = true
        caBasic.repeatCount = MAXFLOAT
        caBasic.duration = 3.0
        
        //透明度变化
        let opacityBasic = CABasicAnimation(keyPath:"opacity")
        opacityBasic.fromValue = 0.0
        opacityBasic.toValue = 0.8
        opacityBasic.autoreverses = true
        opacityBasic.repeatCount = MAXFLOAT
        opacityBasic.duration = 3.0
    
        layer.addAnimation(caBasic, forKey: "chuck")
        layer.addAnimation(opacityBasic , forKey:"chan")
        
    }
    
    func keyFrameAnimation(){
        let animationImage = UIImageView(image: UIImage(named: "3.JPG"))
        animationImage.frame = CGRectMake(100, 100, 60, 60)
        self.view.addSubview(animationImage)
        
        let layer = animationImage.layer
        
        let keyAnimation = CAKeyframeAnimation(keyPath:"position")
        let value0 = NSValue(CGPoint: layer.position)
        let value1 = NSValue(CGPoint: CGPointMake(layer.position.x + 150, layer.position.y))
        let value2 = NSValue(CGPoint: CGPointMake(layer.position.x + 150, layer.position.y + 150))
        let value3 = NSValue(CGPoint: CGPointMake(layer.position.x, layer.position.y + 150))
        let value4 = NSValue(CGPoint: layer.position)
        
        //keyAnimation.keyTimes = [0.0 , 0.8 , 0.7 , 0.6]
        keyAnimation.values = [value0 , value1 , value2 , value3 ,value4]
        keyAnimation.autoreverses = false
        keyAnimation.duration = 6.0
        keyAnimation.repeatCount = MAXFLOAT
        
        let opacityBasic = CABasicAnimation(keyPath:"opacity")
        opacityBasic.fromValue = 0.2
        opacityBasic.toValue = 1.0
        opacityBasic.repeatCount = MAXFLOAT
        opacityBasic.duration = 6.0
        
        let timingFunc = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        let timingFunc1 = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        let timingFunc2 = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        let timingFunc3 = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        keyAnimation.timingFunctions = [timingFunc , timingFunc1,timingFunc2 , timingFunc3]
        
        //layer.addAnimation(opacityBasic , forKey:"chan")
        
        layer.addAnimation(keyAnimation, forKey: "chuck chan")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

