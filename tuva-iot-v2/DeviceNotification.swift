//
//  DeviceNotification.swift
//  tuva-iot-v2
//
//  Created by Rikard Olsson on 2016-06-28.
//  Copyright © 2016 Rikard Olsson. All rights reserved.
//

import Foundation

class DeviceNotification {
    var device: Device
    var message: String
    var dateTime: NSDate
    var isRead = false
    
    init(device: Device, message: String, dateTime: NSDate) {
        self.device = device
        self.message = message
        self.dateTime = dateTime
    }
}