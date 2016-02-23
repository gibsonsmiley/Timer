//
//  AlarmViewController.swift
//  Timer
//
//  Created by Gibson Smiley on 2/9/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class AlarmViewController: UIViewController {
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var setButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.minimumDate = NSDate()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alarmSetView() {
        
    }
    
    func alarmNotSetView() {
        
    }
    
    @IBAction func setButtonTapped(sender: AnyObject) {
        
    }
}