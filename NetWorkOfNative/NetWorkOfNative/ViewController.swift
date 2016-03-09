//
//  ViewController.swift
//  NetWorkOfNative
//
//  Created by chuck chan on 16/1/31.
//  Copyright © 2016年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController , NSURLConnectionDelegate , NSURLConnectionDataDelegate{

    @IBOutlet weak var showQrCodeImage: UIImageView!
    
    @IBOutlet weak var showCityLabel: UILabel!
    
    @IBOutlet weak var showWeatherLabel: UILabel!
    
    @IBOutlet weak var showTempratureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startLoadQRCode()
        
        startLoadWeatherInfo()
        
    }
    //async get request
    func startLoadQRCode(){
        let qrUrl = "http://api.k780.com:88/?app=qr.get&data=chukchan&level=L&size=12"
        
        let requestUrl = NSURL(string: qrUrl)!
        let requestObject = NSURLRequest(URL: requestUrl)
        NSURLConnection.sendAsynchronousRequest(requestObject, queue: NSOperationQueue.mainQueue()) { (_, data, e) -> Void in
            if e == nil && data != nil{
                self.showQrCodeImage.image = UIImage(data: data!)
            }
        }
        
//        NSURLConnection.sendAsynchronousRequest(requestObject, queue: NSOperationQueue()) { (_, data, e) -> Void in
//            if e == nil && data != nil{
//                dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                    self.showQrCodeImage.image = UIImage(data: data!)
//                })
//            }
//        }

    }
    //get异步请求
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
    
    //同步请求
    func startSyncRequest(){
        var response:NSURLResponse?
        var syncUrl = NSURL(string: "http://api.k780.com:88/?app=weather.future&weaid=1&&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json")
        var request = NSURLRequest(URL: syncUrl!)
        var data = try! NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
        var jsonString = NSString(data: data, encoding: NSUTF8StringEncoding)
        print("data is \(jsonString)")
    }
    //异步请求
    func startAsyncRequest(){
        var response:NSURLResponse?
        var syncUrl = NSURL(string: "http://api.k780.com:88/?app=weather.future&weaid=1&&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json")
        var request = NSURLRequest(URL: syncUrl!)
        var connection = NSURLConnection(request: request, delegate: self)
        connection?.scheduleInRunLoop(NSRunLoop.currentRunLoop() , forMode: NSRunLoopCommonModes)
        connection?.start()
    }
    
    //get同步请求
    func startGetSyncRequest(){
        var response:NSURLResponse?
        var syncUrl = NSURL(string: "http://api.k780.com:88/?app=weather.future&weaid=1&&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json")
        var request = NSURLRequest(URL: syncUrl!
            , cachePolicy: NSURLRequestCachePolicy.UseProtocolCachePolicy, timeoutInterval: 10)
        var data = try! NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
        var jsonString = NSString(data: data, encoding: NSUTF8StringEncoding)
        print("data is \(jsonString)")
    }
    
    //post同步请求
    func startPostSyncRequest(){
        var response:NSURLResponse?
        var syncUrl = NSURL(string: "http://api.k780.com:88/")
        var request = NSMutableURLRequest(URL: syncUrl!
            , cachePolicy: NSURLRequestCachePolicy.UseProtocolCachePolicy, timeoutInterval: 10)
        request.HTTPMethod = "POST"
        var config = "app=weather.future&weaid=1&&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json"
        var data:NSData = config.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)!
        request.HTTPBody = data
        var receiveData = try! NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
        var jsonString = NSString(data: receiveData, encoding: NSUTF8StringEncoding)
        print("data is \(jsonString)")
    }
    //post异步请求
    func startPostAsyncRequest(){
        var response:NSURLResponse?
        var syncUrl = NSURL(string: "http://api.k780.com:88/")
        var request = NSMutableURLRequest(URL: syncUrl!
            , cachePolicy: NSURLRequestCachePolicy.UseProtocolCachePolicy, timeoutInterval: 10)
        request.HTTPMethod = "POST"
        var config = "app=weather.future&weaid=1&&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json"
        var data:NSData = config.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)!
        request.HTTPBody = data
        var connection = NSURLConnection(request: request, delegate: self)
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        print("请求失败")
    }
    
    func connection(connection: NSURLConnection, willSendRequest request: NSURLRequest, redirectResponse response: NSURLResponse?) -> NSURLRequest?{
        return request
    }
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse){
        //接收响应
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData){
        //收到数据
    }
    
    func connection(connection: NSURLConnection, needNewBodyStream request: NSURLRequest) -> NSInputStream?{
        //新的数据流
        return request.HTTPBodyStream
    }
    func connection(connection: NSURLConnection, didSendBodyData bytesWritten: Int, totalBytesWritten: Int, totalBytesExpectedToWrite: Int){
        //请求进度
    }
    
    func connection(connection: NSURLConnection, willCacheResponse cachedResponse: NSCachedURLResponse) -> NSCachedURLResponse?{
        //缓存响应
        return cachedResponse
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection){
        //请求结束
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

