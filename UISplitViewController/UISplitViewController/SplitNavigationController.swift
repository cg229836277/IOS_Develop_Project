//
//  SplitNavigationController.swift
//  UISplitViewController
//
//  Created by chuck chan on 15/11/29.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class SplitNavigationController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

   /* override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let row = indexPath.row
        let detailViewControlelr = ViewController()
        detailViewControlelr.setSelectedImage(selectedImage: row)
    }*/
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier ( "chuck" , forIndexPath: indexPath) as UITableViewCell
        cell.backgroundColor = UIColor.brownColor()
        cell.textLabel?.text = String(indexPath.row)
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue , sender: AnyObject?) {
        if segue.identifier == "chan"{
            var destController:ViewController?
            if let tempController = segue.destinationViewController as? UINavigationController{
                destController = tempController.topViewController as? ViewController
            }else{
                destController = segue.destinationViewController as? ViewController
            }
            let path = tableView.indexPathForSelectedRow
            destController!.selectedIndex = (path?.row)!
        }
    }
}
