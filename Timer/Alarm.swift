//
//  Alarm.swift
//  Timer
//
//  Created by Gibson Smiley on 2/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class Alarm: NSObject {
    
    static let alarmSet = "alarmSet"
    static let notificationComplete = "notificaionComplete"
    
    private(set) var alarmDate: NSDate?
    var isArmed: Bool {
        get {
            if alarmDate != nil {
                return true
            } else {
                return false
            }
        }
    }
    
    private var localNotification: UILocalNotification?
    
    func arm(fireDate: NSDate) {
//        Schedule UILocalNotification
        alarmDate = fireDate
        
        let alarmNotification = UILocalNotification()
        alarmNotification.fireDate = alarmDate
        alarmNotification.alertTitle = "Alert Done!"
        alarmNotification.category = "alarmSet"
        
        UIApplication.sharedApplication().scheduleLocalNotification(alarmNotification)
    }
    
    func cancel() {
//        func cancelLocalNotifications() {} ??
        if isArmed == true {
            
        }
    }
    
    func alarmComplete() {
//        Register UILocalNotification
        
            NSNotificationCenter.defaultCenter().postNotificationName(Alarm.notificationComplete, object: nil)
//        Display alarm complete notification
    }
    
}
