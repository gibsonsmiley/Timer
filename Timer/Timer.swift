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
    static let notificationTimerDone = "TimerNotificationTimerDone"
    
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
    
    
}


