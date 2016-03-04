//
//  ViewController.swift
//  NetWorkNSURLSession
//
//  Created by chuck chan on 16/2/24.
//  Copyright © 2016年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,NSURLSessionDelegate , NSURLSessionDownloadDelegate{
    var sessionConfigure:NSURLSessionConfiguration?
    var session:NSURLSession?

    override func viewDidLoad() {
        super.viewDidLoad()
        sessionConfigure = NSURLSessionConfiguration.defaultSessionConfiguration()
        session = NSURLSession(configuration: sessionConfigure!, delegate: self, delegateQueue: NSOperationQueue())
    }
    
    @IBAction func startRequest(sender: UIButton) {
        //httpPostMethod()
        //downloadFile()
        //downloadFileWithProcess()
        if isNetWorkAvailable(){
            print("网络可用")
        }else{
            print("网络不可用")
            return
        }
        uploadFile()
    }
    
    func httpGetMethod(){
        var resuqest = NSURLRequest(URL: NSURL(string: "http://www.hao123.com")!)
        var task = session!.dataTaskWithRequest(resuqest, completionHandler: { (data, response, e) -> Void in
            if e == nil{
                var requestData = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print(requestData)
            }
        }) as NSURLSessionDataTask
        task.resume()
    }
    
    func httpPostMethod(){
        var url = NSURL(string: "http://api.k780.com:88/")
        var request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "POST"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
        let parameters = "app=life.time&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json"
        request.HTTPBody = parameters.dataUsingEncoding(NSUTF8StringEncoding)
        let task = (session!.dataTaskWithRequest(request, completionHandler: { (data , response, e) -> Void in
            if e == nil{
                var responseStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print(responseStr!)
            }
        })) as NSURLSessionDataTask
        task.resume()
    }
    
    func downloadFile(){
        var downloadFileUrl = NSURL(string: "https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png")
        var request:NSURLRequest = NSURLRequest(URL: downloadFileUrl!)
        
        var downloadTask = session?.downloadTaskWithRequest(request, completionHandler: { (url, response,e ) -> Void in
            if e == nil{
                print("path = \(url)")
                var path = url?.path
                var documents:String = NSHomeDirectory() + "/Documents/1.png"
                var fileManager = NSFileManager.defaultManager()
                try! fileManager.moveItemAtPath(path!, toPath: documents)
                print("new location = \(documents)")
                
            }
        })
        downloadTask?.resume()
    }
    
    func downloadFileWithProcess(){
        var downloadUrl = NSURL(string: "https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png")
        var request = NSURLRequest(URL: downloadUrl!)
        var session = createProcessMode()
        var downloadTask = session.downloadTaskWithRequest(request)
        downloadTask.resume()
    }
    
    func createProcessMode() -> NSURLSession{
        var precidate : dispatch_once_t = 0
        var currentSession:NSURLSession? = nil
        dispatch_once(&precidate) { () -> Void in
            var config = NSURLSessionConfiguration.defaultSessionConfiguration()
            currentSession = NSURLSession(configuration: config, delegate: self, delegateQueue: NSOperationQueue())
        }
        return currentSession!
    }
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
        print("path = \(location)")
        var path = location.path
        var documents:String = NSHomeDirectory() + "/Documents/2.png"
        var fileManager = NSFileManager.defaultManager()
        try! fileManager.moveItemAtPath(path!, toPath: documents)
        print("new location = \(documents)")
    }
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        var written:CGFloat = (CGFloat)(totalBytesWritten)
        var total:CGFloat = (CGFloat)(totalBytesExpectedToWrite)
        var process = written / total
        print("进度 ＝ \(process)")
        
    }
    
    func uploadFile(){
        var uploadUrl = NSURL(string: "http://hangge.com/")
        var request = NSURLRequest(URL: uploadUrl!)
        var filePath = NSHomeDirectory() + "/Documents/1.png"
        var data = NSData(contentsOfFile: filePath)
        var sessionTask = session?.uploadTaskWithRequest(request, fromData: data,completionHandler: { (data , response, e) -> Void in
            if e == nil{
                print("上传成功")
            }else{
                print("upload fail \(e?.description)")
            }
        })
        sessionTask?.resume()
    }
    
    func isNetWorkAvailable() -> Bool{
        var status = Reach().connectionStatus()
        switch status{
            case .Online(ReachabilityType.WiFi):
                return true
            case .Online(ReachabilityType.WWAN):
                return true
        default:
            return false
        }
        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

