//
//  ViewController.swift
//  UIAnimationTest
//
//  Created by chuck chan on 15/12/3.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var excuteAnimationView: UIView!
    var originFrame:CGRect!
    var secondFrame:CGRect!
    @IBOutlet weak var secondView: UIView!
    
    var firstSubView:UIView = UIView(frame: CGRect(x: 35, y: 55, width: 60, height: 60))
    var firstSubViewFrame:CGRect!
    
    override func viewDidLoad() {
        originFrame = excuteAnimationView.frame
        secondFrame = secondView.frame
        
        firstSubViewFrame = self.firstSubView.frame
        //可以在另外的一个接口中停止所有的动画
        //excuteAnimationView.layer.removeAllAnimations();
        
        firstSubView.backgroundColor = UIColor.purpleColor()
        excuteAnimationView.addSubview(firstSubView)
    }
    @IBAction func showAnimationClicked(sender: UIButton) {
        //moveToAPlace()
        //moveToPlaceWithOptions()
        //begainAndCommitAnimation()
        animationWithViewTransection()
    }
    
    func  backToOrigin(){
        excuteAnimationView.frame = originFrame
        secondView.frame = secondFrame
        firstSubView.frame = firstSubViewFrame
    }
    
    func moveToAPlace(){
        UIView.animateWithDuration(4) { () -> Void in
            self.excuteAnimationView.frame.origin.x += 200
        }
    }
    
    //self.excuteAnimationView.frame.origin.x += 200
    //self.excuteAnimationView.frame = self.originFrame
    //在动画块中操作view是在新的线程中操作，避免阻塞主线程
    func moveToPlaceWithOptions(){
        UIView.animateWithDuration(3, delay: 1, options: [UIViewAnimationOptions.Repeat, UIViewAnimationOptions.CurveEaseOut], animations: {
                self.excuteAnimationView.frame.origin.x += 200
            //内层的动画默认继承外层动画的延迟，执行时间，播放参数
            //UIViewAnimationOptions.OverrideInheritedOptions重新定义内层动画的配置，不继承外层配置
                UIView.animateWithDuration(10, delay: 0, options: [UIViewAnimationOptions.OverrideInheritedCurve, UIViewAnimationOptions.OverrideInheritedDuration,UIViewAnimationOptions.CurveEaseInOut , UIViewAnimationOptions.OverrideInheritedOptions], animations: { () -> Void in
                        self.secondView.frame.origin.y += 300
                    }, completion: { (finished) -> Void in
                        print("内层嵌套的动画执行完毕")
                })
            }, completion: {(chuck) -> Void in
            print("外层动画执行完毕")
        })
    }
    
    //通过开始，提交的方式执行动画 , ios4.0之后不建议使用这种方法
    func begainAndCommitAnimation(){
        UIView.beginAnimations("chuck", context: nil)
        UIView.setAnimationDuration(2)
        UIView.setAnimationRepeatAutoreverses(true)
        UIView.setAnimationRepeatCount(5)
        UIView.setAnimationDelegate(self)
        UIView.setAnimationDidStopSelector("animationDidStop:finished:")
        UIView.setAnimationWillStartSelector("animationDidStart:")
        self.excuteAnimationView.backgroundColor = UIColor.cyanColor()
        UIView.commitAnimations()
    }
    
    override func animationDidStart(anim: CAAnimation) {
        print("动画开始执行")
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        print("动画执行完毕")
    }
    
    func animationWithViewTransection(){
        //UIViewAnimationOptions.AllowAnimatedContent强制不使用layer转场
        UIView.transitionWithView(self.excuteAnimationView, duration: 4, options: [UIViewAnimationOptions.TransitionCurlDown ,UIViewAnimationOptions.AllowAnimatedContent], animations: { (start) -> Void in
                self.firstSubView.frame.origin.x += 80
            }) { (chuck) -> Void in
                print("animate ainished")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

