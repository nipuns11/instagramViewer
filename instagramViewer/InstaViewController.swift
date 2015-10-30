//
//  InstaViewController.swift
//  instagramViewer
//
//  Created by nipun sharma on 2015-10-28.
//  Copyright © 2015 nipun. All rights reserved.
//

import UIKit
import Alamofire

let accessToken = "30915799.1fb234f.598400f78bcd411ab34de2b59e58768e"

class InstaViewController: UIViewController , UITableViewDataSource {

    var results:[JSON]? = []
    @IBOutlet var tableview:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadInsta()
        // Do any additional setup after loading the view.
    }
    
    func loadInsta()
    {
        let url = "https://api.instagram.com/v1/tags/instago/media/recent?access_token=\(accessToken)"
       
        
        
        Alamofire.request(.GET, url).response { (request, response, json, Error) -> Void in
            if (json != nil){
                var jsonObj = JSON(json!)
                if let data = jsonObj["data"].arrayValue as [JSON]? {
                    self.results = data
                    self.tableview.reloadData()
                }
            }
        }
        }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results?.count ?? 0
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("instacell") as! InstaTableViewCell
        cell.insta = self.results?[indexPath.row]
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
