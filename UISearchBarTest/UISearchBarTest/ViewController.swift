//
//  ViewController.swift
//  UISearchBarTest
//
//  Created by chuck chan on 15/11/23.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import UIKit

class ViewController:UITableViewController,UISearchBarDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var searchTableView: UITableView!
    
    
    var colors = ["red","orange", "yellow","green","blue","cyan","purple","gray"]
    var searchColors = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //searchTableView.delegate = self
        //searchTableView.dataSource = self
        searchBar.delegate = self
        searchBar.showsScopeBar = true
        self.searchColors = colors
        
        self.searchTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchColors.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        let color = self.searchColors[indexPath.row] as String
        cell.textLabel?.text = color
        return cell
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""{
            self.searchColors = self.colors
        }else{
            self.searchColors = []
            for tempData in colors{
                if tempData.lowercaseString.hasPrefix(searchText){
                    self.searchColors.append(tempData)
                }
            }
        }
        self.searchTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
 
    }
}

