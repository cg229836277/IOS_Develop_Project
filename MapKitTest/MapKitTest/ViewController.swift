//
//  ViewController.swift
//  MapKitTest
//
//  Created by chuck chan on 16/1/4.
//  Copyright © 2016年 chuck chan. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var myMapView: MKMapView!
    
    var mapRegion:MKCoordinateRegion = MKCoordinateRegion()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapRegion.center.latitude = 60
        mapRegion.center.longitude = 60
        mapRegion.span.latitudeDelta = 0.2
        mapRegion.span.longitudeDelta = 0.2
        myMapView.setRegion(mapRegion, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

