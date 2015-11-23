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
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView === self.searchDisplayController?.searchResultsTableView{
            return self.searchColors.count
        }else{
            return self.colors.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        var color:String
        if tableView === self.searchDisplayController!.searchResultsTableView{
            color = self.searchColors[indexPath.row] as String
        }else{
            color = self.colors[indexPath.row] as String
        }
        cell.textLabel?.text = color
        return cell
    }
    
    func searchDisplayController(controller: UISearchDisplayController! , shouldReloadTableForSearchScope searchOption: Int) -> Bool{
            self.filterContentForRearchText(self.searchDisplayController!.searchBar.text!)
            return true
        }
    
    func searchDisplayController(controller:UISearchDisplayController! , shouldReloadTableForSearchString searchString: String!) -> Bool{
        self.filterContentForRearchText(searchString)
        return true
    }
    
    
    func filterContentForRearchText(searchText:String){
        self.searchColors = self.colors.filter({(colors:String)-> Bool in
            let stringMatch = colors.rangeOfString(searchText)
            return stringMatch != nil
        })
        print(self.colors)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
 
    }
}

