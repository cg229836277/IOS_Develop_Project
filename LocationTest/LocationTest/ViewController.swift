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
        locationManager?.headingFilter = 10
    }
    //http://sledgedev.com/corelocation-ios-8-and-swift/
    
    @IBAction func startGetLocation(sender: UIButton) {
        locationManager?.startUpdatingLocation()
        locationManager?.startUpdatingHeading()
        print("开始定位")
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        //print("\(newLocation.coordinate.longitude)")
        //print("\(newLocation.coordinate.latitude)")
        var locationStr = "\(newLocation.coordinate.longitude)" + "\n" + "\(newLocation.coordinate.latitude)"
        var verticalAndHorizontal = "\(newLocation.horizontalAccuracy)" + "\n" + "\(newLocation.verticalAccuracy)"
        showLocationLabel.text = "\(newLocation.coordinate.longitude)"
        showLocationLabel1.text = "\(newLocation.coordinate.latitude)"
        print(locationStr)
        print(verticalAndHorizontal)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        showLocationLabel.text = "定位失败"
        print("定位失败")
    }
    
    func locationManager(manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        if newHeading.headingAccuracy >= 0{
            var trueHeading = String(newHeading.trueHeading);
            var magneticHeading = String(newHeading.magneticHeading);
            print("地理学：" + trueHeading)//地理学方向
            print("磁场学：" + magneticHeading)//磁场学方向
            //0 is north , 90 is earst , 180 is south , 270 is west
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewDidAppear(animated: Bool) {
        locationManager?.stopUpdatingLocation()
    }
}

