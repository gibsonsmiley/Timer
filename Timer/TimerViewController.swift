//
//  TimerViewController.swift
//  Timer
//
//  Created by Gibson Smiley on 2/9/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var hoursPicker: UIPickerView!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minutesPicker: UIPickerView!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startStopButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
