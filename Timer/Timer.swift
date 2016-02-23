//
//  Timer.swift
//  Timer
//
//  Created by Gibson Smiley on 2/9/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class Timer: NSObject {
    
    static let notificationSecondsTick = "TimerNotificationSecondsTick"
    static let notificationTimerDone = "TimerNotificationComplete"
    
    private(set) var seconds = NSTimeInterval(0)
    private(set) var totalSeconds = NSTimeInterval(0)
    private var timer: NSTimer?
    var isOn: Bool {
        get {
            if timer != nil {
                return true
            } else {
                return false
            }
        }
    }
    
    var string: String {
        get {
            let totalSeconds = Int(self.seconds)
            
            let hours = totalSeconds / 3600
            let minutes = (totalSeconds - (hours * 3600)) / 60
            let seconds = totalSeconds - (hours * 3600) - (minutes * 60)
            
            var hoursString = ""
            if hours > 10 {
                hoursString = "\(hours)"
            } else {
                hoursString = "0:\(hours)"
            }
            
            var minutesString = ""
            if minutes > 10 {
                minutesString = "\(minutes)"
            } else {
                minutesString = "0:\(minutes)"
            }
            
            var secondsString = ""
            if seconds > 10 {
                secondsString = "\(seconds)"
            } else {
                secondsString = "0:\(seconds)"
            }
            
            return hoursString + minutesString + secondsString
        }
    }
    
    func setTimer(seconds: NSTimeInterval, totalSeconds: NSTimeInterval) {
        self.seconds = seconds
        self.totalSeconds = totalSeconds
    }
    
    func startTimer() {
        if !isOn {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "secondTick", userInfo: nil, repeats: true)
        }
    }
    
    func stopTimer() {
        if isOn {
            timer?.invalidate()
            timer = nil
        }
    }
    
    func secondTick() {
        seconds--
        NSNotificationCenter.defaultCenter().postNotificationName(Timer.notificationSecondsTick, object: self)
        if seconds <= 0 {
            stopTimer()
            NSNotificationCenter.defaultCenter().postNotificationName(Timer.notificationTimerDone, object: self)
        }
    }
}


