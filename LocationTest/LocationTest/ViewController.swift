//
//  ViewController.swift
//  LocationTest
//
//  Created by chuck chan on 15/12/29.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController , CLLocationManagerDelegate {

    
    @IBOutlet weak var showLocationLabel1: UILabel!
    @IBOutlet weak var showLocationLabel: UILabel!
    
    var locationManager:CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.distanceFilter = 250
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestAlwaysAuthorization()
    }
    //http://sledgedev.com/corelocation-ios-8-and-swift/
    //http://shrikar.com/swift-tutorial-corelocation-and-region-monitoring-in-ios-8/
    
    @IBAction func startGetLocation(sender: UIButton) {
        locationManager?.startUpdatingLocation()
        print("开始定位")
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        //print("\(newLocation.coordinate.longitude)")
        //print("\(newLocation.coordinate.latitude)")
        var locationStr = "\(newLocation.coordinate.longitude)" + "\n" + "\(newLocation.coordinate.latitude)";
        showLocationLabel.text = "\(newLocation.coordinate.longitude)"
        showLocationLabel1.text = "\(newLocation.coordinate.latitude)"
        print(locationStr)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        showLocationLabel.text = "定位失败"
        print("定位失败")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewDidAppear(animated: Bool) {
        locationManager?.stopUpdatingLocation()
    }
}

