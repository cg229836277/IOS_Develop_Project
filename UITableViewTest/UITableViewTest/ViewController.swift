//
//  ViewController.swift
//  UITableViewTest
//
//  Created by chuck chan on 15/11/19.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var imageArray = [UIImage(named: "1.JPG") , UIImage(named: "2.JPG") , UIImage(named: "3.JPG") , UIImage(named: "4.JPG")]
    var nameArray = ["chuck" , "chan" , "yanhui" , "qin"]
    var status = ["today is warm",
                "we will go to shopping",
                "i do not know what to do",
                "it is fine"]
    var time = "2015-11-22"
    
    var rowCount = 4;
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.setEditing(true, animated: true)
        tableView.dataSource = self
        
        var cellNib = UINib(nibName: "ChuckCellView", bundle: nil)
        tableView.registerNib(cellNib, forCellReuseIdentifier: "chuck")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowCount
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "chuck"
        }else if section == 1{
            return "chan"
        }
        return "chuck chan"
    }
    
    /*func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let section = indexPath.section//every section
        let row = indexPath.row//every row
        
        print("init section is \(section) , and row is \(row)")
        
        let cell = UITableViewCell()
        cell.imageView?.image = UIImage(named: "3.JPG")
        cell.textLabel?.text = "chuck"
        cell.detailTextLabel?.text = "this is chuck chan test"
        return cell
    }*/
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "chuck"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ChuckCell
        let row = indexPath.row

        cell.showImageView.image = imageArray[row]
        cell.showNameLabel.text = nameArray[row]
        cell.showStatusLabel.text = status[row]
        cell.showTimeLabel.text = time
        return cell
    }
    
    func tableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func  tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            print("here can do something after delete tableview cell\(indexPath.row) , \(indexPath.section)")
            if rowCount == 1{
                return
            }
            
            rowCount -= 1;
            
            self.tableView.beginUpdates()
            self.tableView?.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Top)
            self.tableView.endUpdates()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

