//
//  PickerClass.swift
//  SwiftProject
//
//  Created by Mac01 on 24/08/15.
//  Copyright (c) 2015 Mac01. All rights reserved.
//

import UIKit
let PickerTag:Int = 123
let PickerViewHeight:CGFloat = 250

class PickerClass: UIView {
    
    var _parentViewController = UIViewController()

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var pickerTitle: UIBarButtonItem!
    
    @IBOutlet weak var pickerContainer: UIView!
    
    
    var _pickerDetailDict = NSMutableDictionary()
    var _indexPathOfCell = NSIndexPath()

    class var sharedInstance: PickerClass
    {
        struct Static
        {
            static var onceToken: dispatch_once_t = 0
            static var instance: PickerClass? = nil
            
        }
        
        dispatch_once(&Static.onceToken) {
            Static.instance = UINib(
                nibName: "PickerClass",
                bundle: NSBundle.mainBundle()
                ).instantiateWithOwner(nil, options: nil)[0] as? PickerClass
        }
        return Static.instance!
    }
    
    func bindPickerWithData(pickerDetailDict : NSMutableDictionary, inViewController  parentViewController : UIViewController) {

        _parentViewController = parentViewController
        _pickerDetailDict = pickerDetailDict
        pickerContainer.tag = PickerTag
    }
    
    func initializePicker() {
        pickerTitle.title = self._pickerDetailDict.objectForKey("pickerTitle") as? String
        pickerView.reloadAllComponents()
    }

    
    
    /**
    Moves the picker down and move it up for another cell dependent on switchToAnotherPicker value
    
    :param: switchToAnotherPicker - It tells whether to open the picker again for another cell or not
    
    :returns: is picker already added in Main view (Table View) or not
    */
    func dismissPreviousPickerView(switchToAnotherPicker : Bool) -> (Bool){
        let myTableViewController = _parentViewController as! MyTableViewController
        
        var pickerExist = false
        
        if myTableViewController.view.viewWithTag(PickerTag) != nil {
            pickerExist = true
            
            myTableViewController.constBtmtableView.constant = 0
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                myTableViewController.myTableView.layoutIfNeeded()
                self.pickerContainer.layoutIfNeeded()
                }, completion: { (Bool) -> Void in
                    self.pickerTitle.title = ""
                    
                    if switchToAnotherPicker {
                        self.initializePicker()
                        self.showPicker()
                    }
            })
        }
        return pickerExist
    }

    
    
    /**
    Add picker to main view in case it is not already added and move picker upward
    */
    func showPicker() {
        let myTableViewController = _parentViewController as! MyTableViewController

        if myTableViewController.view.viewWithTag(PickerTag) == nil {
            myTableViewController.view.addSubview(pickerContainer)
            
            let topContraint_picker = NSLayoutConstraint(item: pickerContainer, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: myTableViewController.myTableView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
            myTableViewController.view.addConstraint(topContraint_picker)
            
            let leadingContraint_picker = NSLayoutConstraint(item: pickerContainer, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: myTableViewController.myTableView, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)
            myTableViewController.view.addConstraint(leadingContraint_picker)

            let trailingContraint_picker = NSLayoutConstraint(item: pickerContainer, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: myTableViewController.myTableView, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0)
            myTableViewController.view.addConstraint(trailingContraint_picker)

            myTableViewController.view.layoutIfNeeded()

        }
        
        myTableViewController.constBtmtableView.constant = PickerViewHeight
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            myTableViewController.myTableView.layoutIfNeeded()
            self.pickerContainer.layoutIfNeeded()
            }, completion:{ (Bool) -> Void in
                myTableViewController.myTableView.scrollToRowAtIndexPath(self._indexPathOfCell, atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
        })
    }
    
    
    /**
    Dismiss the picker
    */
    @IBAction func cancelBtnTapped(sender: AnyObject) {
        dismissPreviousPickerView(false)
    }
    
    
    /**
    Dismiss the picker. And set the value selected in picker on the TableView cell
    */
    @IBAction func doneBtnTapped(sender: AnyObject) {
        let myTableViewController = _parentViewController as! MyTableViewController

        _pickerDetailDict.setValue((_pickerDetailDict.objectForKey("pickerValue") as! NSArray)[pickerView.selectedRowInComponent(0)] as! String, forKey: "cellTitle")
        
        dispatch_async(dispatch_get_main_queue()) {
            //set cell title
            (myTableViewController.myTableView.cellForRowAtIndexPath(self._indexPathOfCell) as! MyTableViewCell).cellBtn.setTitle(self._pickerDetailDict.objectForKey("cellTitle") as? String, forState: .Normal)
        }

        dismissPreviousPickerView(false)
    }
    
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int {
        let pickerValueArray = _pickerDetailDict.objectForKey("pickerValue") as! NSArray
        return pickerValueArray.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        let pickerValueArray = _pickerDetailDict.objectForKey("pickerValue") as! NSArray
        return pickerValueArray[row] as! String
    }
}

