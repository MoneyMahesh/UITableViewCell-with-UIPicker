//
//  MyTableViewCell.swift
//  SwiftProject
//
//  Created by Mac01 on 13/08/15.
//  Copyright (c) 2015 Mac01. All rights reserved.
//

import UIKit


class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var cellBtn: UIButton!
    var pickerClassObj = PickerClass()
    var _parentViewController = UIViewController()
    var _pickerDetail = NSMutableDictionary()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
 
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindCellWith(pickerDetail : NSMutableDictionary, viewControllerNamed parentViewController : UIViewController) {
        _parentViewController = parentViewController
        _pickerDetail = pickerDetail
        pickerClassObj = PickerClass.sharedInstance
        
        dispatch_async(dispatch_get_main_queue()) {
            //set cell title
            self.cellBtn.setTitle(pickerDetail.objectForKey("cellTitle") as? String, forState: .Normal)
        }
    }
    
    @IBAction func cellBtnTapped(sender: AnyObject) {
//        let indexPath : NSIndexPath = (_parentViewController as! MyTableViewController).myTableView.indexPathForCell(self)!
        pickerClassObj._indexPathOfCell = (_parentViewController as! MyTableViewController).myTableView.indexPathForCell(self)!
        
//        var tableContentOffset = CGPointMake(0, self.frame.size.height * CGFloat(indexPath.row))
        
        if(pickerClassObj.pickerTitle.title == _pickerDetail.objectForKey("pickerTitle") as? String) {
            //picker for this cell is currently open
        }
        else {
            pickerClassObj.bindPickerWithData(_pickerDetail, inViewController: _parentViewController)
            
            if !pickerClassObj.dismissPreviousPickerView(true) {
                pickerClassObj.pickerTitle.title = _pickerDetail.objectForKey("pickerTitle") as? String
                pickerClassObj.showPicker()
            }
        }
    }
}