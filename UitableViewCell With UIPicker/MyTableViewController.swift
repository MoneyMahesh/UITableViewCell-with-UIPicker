//
//  MyTableViewController.swift
//  SwiftProject
//
//  Created by Mac01 on 13/08/15.
//  Copyright (c) 2015 Mac01. All rights reserved.
//

import UIKit

class MyTableViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var constBtmtableView: NSLayoutConstraint!
    var pickerDetailArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //initialise picker detail
        let pickerDetail1 : NSMutableDictionary = ["cellTitle" : "Cell1" , "pickerTitle" : "Cell1" , "pickerValue" : ["Cell1 1","Cell1 2"]]
        let pickerDetail2 : NSMutableDictionary = ["cellTitle" : "Cell2" , "pickerTitle" : "Cell2" , "pickerValue" : ["Cell2 1","Cell2 2"]]
        let pickerDetail3 : NSMutableDictionary = ["cellTitle" : "Cell3" , "pickerTitle" : "Cell3" , "pickerValue" : ["Cell3 1","Cell3 2"]]
        let pickerDetail4 : NSMutableDictionary = ["cellTitle" : "Cell4" , "pickerTitle" : "Cell4" , "pickerValue" : ["Cell4 1","Cell4 2"]]
        let pickerDetail5 : NSMutableDictionary = ["cellTitle" : "Cell5" , "pickerTitle" : "Cell5" , "pickerValue" : ["Cell5 1","Cell5 2"]]
        let pickerDetail6 : NSMutableDictionary = ["cellTitle" : "Cell6" , "pickerTitle" : "Cell6" , "pickerValue" : ["Cell6 1","Cell6 6"]]
        let pickerDetail7 : NSMutableDictionary = ["cellTitle" : "Cell7" , "pickerTitle" : "Cell7" , "pickerValue" : ["Cell7 1","Cell7 2"]]
        let pickerDetail8 : NSMutableDictionary = ["cellTitle" : "Cell8" , "pickerTitle" : "Cell8" , "pickerValue" : ["Cell8 1","Cell8 2"]]
        let pickerDetail9 : NSMutableDictionary = ["cellTitle" : "Cell9" , "pickerTitle" : "Cell9" , "pickerValue" : ["Cell9 1","Cell9 2"]]
        let pickerDetail10 : NSMutableDictionary = ["cellTitle" : "Cell10" , "pickerTitle" : "Cell10" , "pickerValue" : ["Cell10 1","Cell10 2"]]
        let pickerDetail11 : NSMutableDictionary = ["cellTitle" : "Cell11" , "pickerTitle" : "Cell11" , "pickerValue" : ["Cell11 1","Cell11 2"]]
        let pickerDetail12 : NSMutableDictionary = ["cellTitle" : "Cell12" , "pickerTitle" : "Cell12" , "pickerValue" : ["Cell12 1","Cell12 2"]]
        let pickerDetail13 : NSMutableDictionary = ["cellTitle" : "Cell13" , "pickerTitle" : "Cell13" , "pickerValue" : ["Cell13 1","Cell13 2"]]
        let pickerDetail14 : NSMutableDictionary = ["cellTitle" : "Cell14" , "pickerTitle" : "Cell14" , "pickerValue" : ["Cell14 1","Cell14 2"]]
        let pickerDetail15 : NSMutableDictionary = ["cellTitle" : "Cell15" , "pickerTitle" : "Cell15" , "pickerValue" : ["Cell15 1","Cell15 2"]]
        let pickerDetail16 : NSMutableDictionary = ["cellTitle" : "Cell16" , "pickerTitle" : "Cell16" , "pickerValue" : ["Cell16 1","Cell16 2"]]
        let pickerDetail17 : NSMutableDictionary = ["cellTitle" : "Cell17" , "pickerTitle" : "Cell17" , "pickerValue" : ["Cell17 1","Cell17 2"]]
        let pickerDetail18 : NSMutableDictionary = ["cellTitle" : "Cell18" , "pickerTitle" : "Cell18" , "pickerValue" : ["Cell18 1","Cell18 2"]]

        pickerDetailArray = [
                                pickerDetail1,
                                pickerDetail2,
                                pickerDetail3,
                                pickerDetail4,
                                pickerDetail5,
                                pickerDetail6,
                                pickerDetail7,
                                pickerDetail8,
                                pickerDetail9,
                                pickerDetail10,
                                pickerDetail11,
                                pickerDetail12,
                                pickerDetail13,
                                pickerDetail14,
                                pickerDetail15,
                                pickerDetail16,
                                pickerDetail17,
                                pickerDetail18,
                            ]
        
        self.myTableView.registerNib(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "MyTableViewCell")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pickerDetailArray.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCellWithIdentifier("MyTableViewCell", forIndexPath: indexPath) as! MyTableViewCell
        
        
        // in case xib contain 2 nibs
//        let nibArray = NSBundle.mainBundle().loadNibNamed("MyTableViewCell", owner: self, options: nil)
//        let myCell = nibArray[0] as! MyTableViewCell
        
        myCell.bindCellWith(pickerDetailArray[indexPath.row] as! NSMutableDictionary, viewControllerNamed:self)
        
        return myCell
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
