//
//  ViewController.swift
//  tuva-iot-v2
//
//  Created by Rikard Olsson on 2016-06-28.
//  Copyright © 2016 Rikard Olsson. All rights reserved.
//

import UIKit

class DeviceTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 90
        // Do any additional setup after loading the view, typically from a nib.
        
        let dev1 = Device(objectId: "123123", deviceId: "HKJ9081273LASd", description: "Down in the hall", type: DeviceType.Camera)
        let dev2 = Device(objectId: "121212", deviceId: "KALDO89238LKSD", description: "Main door", type: DeviceType.DoorSensor)
        
        dev1.addDeviceNotification("Motion", dateTime: NSDate())
        dev1.addDeviceNotification("No motion", dateTime: NSDate())
        dev2.addDeviceNotification("Opened", dateTime: NSDate())
        dev2.addDeviceNotification("Closed", dateTime: NSDate())
        
        CurrentUser.devices.append(dev1)
        CurrentUser.devices.append(dev2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CurrentUser.devices.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DeviceTableViewCell", forIndexPath: indexPath) as! DeviceTableViewCell
        let device = CurrentUser.devices[indexPath.row]
        
        let number = device.getDeviceNotifications().count
        let size: CGFloat = 26
        let digits = CGFloat( number ) // digits in the label
        let width = max(size, 0.7 * size * digits) // perfect circle is smallest allowed
        let badge = UILabel(frame: CGRectMake(0, 0, width, size))
        badge.text = "\(number)"
        badge.layer.cornerRadius = size / 2
        badge.layer.masksToBounds = true
        badge.textAlignment = .Center
        badge.textColor = UIColor.whiteColor()
        badge.backgroundColor = UIColor.orangeColor()
        cell.accessoryView = badge // !! change this line
        
        cell.descriptionText.text = device.descriptionText
        cell.name.text = device.getTypeInText()
        cell.imageCell.image = device.getImage()
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDeviceDetail" {
            let deviceViewController = segue.destinationViewController as! DeviceViewController
            
            if let selectedDeviceCell = sender as? DeviceTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedDeviceCell)!
                let selectedDevice = CurrentUser.devices[indexPath.row]
                deviceViewController.device = selectedDevice
            }
        }
    }
}

