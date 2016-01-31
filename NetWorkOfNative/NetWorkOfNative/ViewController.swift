//
//  ViewController.swift
//  NetWorkOfNative
//
//  Created by chuck chan on 16/1/31.
//  Copyright © 2016年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showQrCodeImage: UIImageView!
    
    @IBOutlet weak var showCityLabel: UILabel!
    
    @IBOutlet weak var showWeatherLabel: UILabel!
    
    @IBOutlet weak var showTempratureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startLoadQRCode()
        
        startLoadWeatherInfo()
        
    }
    
    func startLoadQRCode(){
        let qrUrl = "http://api.k780.com:88/?app=qr.get&data=chukchan&level=L&size=12"
        
        let requestUrl = NSURL(string: qrUrl)!
        let requestObject = NSURLRequest(URL: requestUrl)
        NSURLConnection.sendAsynchronousRequest(requestObject, queue: NSOperationQueue.mainQueue()) { (_, data, e) -> Void in
            if e == nil && data != nil{
                self.showQrCodeImage.image = UIImage(data: data!)
            }
        }

    }
    
    func startLoadWeatherInfo(){
        let weatherUrl = "http://api.k780.com:88/?app=weather.future&weaid=1&&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json"
        let weatherRequest = NSURLRequest(URL: NSURL(string: weatherUrl)!)
        NSURLConnection.sendAsynchronousRequest(weatherRequest, queue: NSOperationQueue.mainQueue()) { (_, data, e) -> Void in
            if data != nil && e == nil{
                var jsonMainObject = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                
                //let resultArray = jsonMainObject.valueForKey("result") as! NSDictionary
                let childResult = jsonMainObject.valueForKey("result") as! NSArray
                let childValue = childResult[0] as! NSDictionary
                let city = childValue.valueForKey("citynm") as! String
                let weather = childValue.valueForKey("weather") as! String
                let temperature = childValue.valueForKey("temperature") as! String
                print("city is \(city)")
                print("weather is \(weather)")
                print("temperatuer is \(temperature)")
                
                self.showCityLabel.text = city
                self.showWeatherLabel.text = weather
                self.showTempratureLabel.text = temperature
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

