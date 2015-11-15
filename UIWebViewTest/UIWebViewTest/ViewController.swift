//
//  ViewController.swift
//  UIWebViewTest
//
//  Created by chuck chan on 15/11/15.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var showContentWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func segmentedValueChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            loadUrl()
        case 1:
            loadImage()
        case 2:
            loadHtml()
        default:
            loadUrl()
        }
    }
    
    func loadUrl(){
        let webUrl: NSURL = NSURL.init(string: "http://www.hao123.com")!
        let requestUrl: NSURLRequest = NSURLRequest.init(URL: webUrl)
        showContentWebView.loadRequest(requestUrl)
    }
    
    func loadImage(){
        let imagePath: String = NSBundle.mainBundle().pathForResource("1.JPG", ofType: nil)!
        let imageUrl: NSURL = NSURL.fileURLWithPath(imagePath)
        let imageUrlRequest: NSURLRequest = NSURLRequest.init(URL: imageUrl)
        showContentWebView.loadRequest(imageUrlRequest)
    }
    
    func loadHtml(){
        let htmlCode: String = "<b>[手机号码]</b><br />"
        "chuck chan<hr />"
        "<b>[主页] </b><br />"
        "http://www.sina.com"
        showContentWebView.loadHTMLString(htmlCode, baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}

