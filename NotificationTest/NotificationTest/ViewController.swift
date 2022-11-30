//
//  ViewController.swift
//  NotificationTest
//
//  Created by 이재웅 on 2022/11/30.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 1. Ask for permission
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]) {(granted, error) in
        }
        
        // 2. Create the notification content
        let content = UNMutableNotificationContent()
        content.title = "I'm a notificaiton"
        content.body = "Look at me!"
        
        // 3. Create the notification trigger
        let date = Date().addingTimeInterval(5)
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        // 4. Create the request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
    
        // 5. Register the request
        center.add(request) { (error) in
            // check the error parameter and handle any errors
        }
    }
    
    
}

