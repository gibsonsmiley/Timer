//
//  TimerViewController.swift
//  Timer
//
//  Created by Gibson Smiley on 2/9/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var hoursPicker: UIPickerView!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minutesPicker: UIPickerView!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var pickerStackView: UIStackView!
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateTimerBasedViews", name: Timer.notificationSecondsTick, object: timer)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "timerComplete", name: Timer.notificationTimerDone, object: timer)
        

        
        minutesPicker.selectRow(1, inComponent: 0, animated: false)
        
        view.layoutIfNeeded()
        
// Round the buttons //
//        pauseButton.layer.cornerRadius = pauseButton.bounds.height / 2
//        pauseButton.layer.masksToBounds = true
//        pauseButton.layer.borderWidth = 2.0
//        
//        startStopButton.layer.cornerRadius = startStopButton.bounds.height / 2
//        startStopButton.layer.masksToBounds = true
//        startStopButton.layer.borderWidth = 2.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startStopButtonTapped(sender: AnyObject) {
        toggleTimer()
    }
    
    @IBAction func pauseButtonTapped(sender: AnyObject) {
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == hoursPicker {
            return 24
        } else if pickerView == minutesPicker {
            return 60
        } else {
            return 0
        }
    }
    
    
    // MARK: - Delegates
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
    }
    
    func toggleTimer() {
        if timer.isOn {
            timer.stopTimer()
            switchToPickerView()
        } else {
            switchToTimerView()
            
            let hours = hoursPicker.selectedRowInComponent(0)
            let minutes = minutesPicker.selectedRowInComponent(0) + (hours * 60)
            let totalSecondsSetOnTimer = NSTimeInterval(minutes * 60)
            
            timer.setTimer(totalSecondsSetOnTimer, totalSeconds: totalSecondsSetOnTimer)
            updateTimerBasedViews()
            timer.startTimer()
        }
    }
    
    func updateTimerLabel() {
        timerLabel.text = timer.string
    }
    
    func updateProgressView() {
        let secondsElapsed = timer.totalSeconds - timer.seconds
        
        let progress = Float(secondsElapsed) / Float(timer.totalSeconds)
        
        progressView.setProgress(progress, animated: true)
    }
    
    func updateTimerBasedViews() {
        updateTimerLabel()
        updateProgressView()
    }
    
    func timerComplete() {
        switchToPickerView()
    }
    
    func switchToTimerView() {
        timerLabel.hidden = false
        progressView.setProgress(0.0, animated: false)
        progressView.hidden = false
        pickerStackView.hidden = true
        startStopButton.setTitle("Cancel", forState: .Normal)
    }
    
    func switchToPickerView() {
        pickerStackView.hidden = false
        timerLabel.hidden = true
        progressView.hidden = true
        startStopButton.setTitle("Start", forState: .Normal)
    }
}
