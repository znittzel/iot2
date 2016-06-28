//
//  Device.swift
//  tuva-iot-v2
//
//  Created by Rikard Olsson on 2016-06-28.
//  Copyright © 2016 Rikard Olsson. All rights reserved.
//

import UIKit

class Device {
    var objectId: String
    var deviceId: String
    var type: DeviceType
    var descriptionText: String
    var deviceNotifications = [DeviceNotification]()
    
    init(objectId: String, deviceId: String, description: String, type: DeviceType) {
        self.objectId = objectId
        self.deviceId = deviceId
        self.type = type
        self.descriptionText = description
    }
    
    func addDeviceNotification(message: String, dateTime: NSDate) {
        self.deviceNotifications.append(DeviceNotification(device: self, message: message, dateTime: dateTime))
    }
    
    func getDeviceNotifications() -> [DeviceNotification] {
        return self.deviceNotifications
    }
    
    func getTypeInText() -> String {
        return type.rawValue
    }
    
    func getImage() -> UIImage {
        var image = UIImage()
        switch self.type {
        case DeviceType.Camera:
            image = UIImage(named: "Cam")!
        default:
            image = UIImage(named: "MotionSensor")!
        }
        
        return image
    }
}