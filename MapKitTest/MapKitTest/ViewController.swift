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

class ViewController: UIViewController , MKMapViewDelegate{
    
    @IBOutlet weak var myMapView: MKMapView!
    
    var mapRegion:MKCoordinateRegion = MKCoordinateRegion()
    //http://www.hangge.com/blog/cache/detail_787.html

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //myMapView.delegate = self
        myMapView.mapType = .Satellite
        var lalDelta = 0.5
        var longDelta = 0.5
        var currentLocationSpan = MKCoordinateSpanMake(lalDelta, longDelta)
        var center = CLLocation(latitude: 22, longitude: 113)
        var centerRegion = MKCoordinateRegion(center: center.coordinate, span: currentLocationSpan)
        myMapView.setRegion(centerRegion, animated: true)
        
        var pointAnnocation = MKPointAnnotation()
        pointAnnocation.coordinate = CLLocation(latitude: 22.58, longitude: 113.96).coordinate
        pointAnnocation.title = "chuck"
        pointAnnocation.subtitle = "chuck chan"
        myMapView.addAnnotation(pointAnnocation)
        
    }
    
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation{
            return nil
        }
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier("chuck") as? MKPinAnnotationView
        if pinView == nil{
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "chuck")
            pinView?.canShowCallout = true
            pinView?.animatesDrop = true
            pinView?.rightCalloutAccessoryView = UIButton(type: UIButtonType.DetailDisclosure)
            pinView?.pinColor = MKPinAnnotationColor.Purple
        }else{
            pinView?.annotation = annotation
        }
        return pinView
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

