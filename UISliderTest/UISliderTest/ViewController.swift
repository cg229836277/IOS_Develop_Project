//
//  ViewController.swift
//  UISliderTest
//
//  Created by chuck chan on 15/11/11.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sliderView: UISlider!
    
    @IBOutlet weak var changeWordSize: UILabel!
    @IBOutlet weak var showValueLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderView.maximumValue = 100
        sliderView.minimumValue = 0
        sliderView.center = self.view.center
        
        sliderView.addTarget(self, action: "slidervalueChanged:", forControlEvents:UIControlEvents.ValueChanged )

    }
    @IBAction
    func slidervalueChanged(sender:UISlider){
        showValueLabel.text = String(sender.value)
        //changeWordSize.font = UIFont(name: "Arial", size: CGFloat(sender.value * 0.5))
        changeWordSize.font = UIFont.systemFontOfSize(CGFloat(sender.value * 0.5))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}
