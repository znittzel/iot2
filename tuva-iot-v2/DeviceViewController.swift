//
//  DeviceViewController.swift
//  tuva-iot-v2
//
//  Created by Rikard Olsson on 2016-06-28.
//  Copyright © 2016 Rikard Olsson. All rights reserved.
//

import UIKit

class DeviceViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    var device: Device?
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var decsriptionText: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 80
        
        self.title = device!.type.rawValue
        self.name.text = device!.type.rawValue
        self.decsriptionText.text = device!.descriptionText
        self.icon.image = device!.getImage()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return device!.getDeviceNotifications().count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DeviceNotificationTableViewCell", forIndexPath: indexPath) as! DeviceNotificationTableViewCell
        let deviceNotification = device!.getDeviceNotifications()[indexPath.row]
                
        cell.message.text = deviceNotification.message
        cell.dateTime.text = deviceNotification.dateTime.description
        
        return cell
    }
}
