//
//  SecondViewController.swift
//  Location Aware
//
//  Created by Krish Furia on 1/3/16.
//  Copyright © 2016 Krish Furia. All rights reserved.
//

import UIKit

var secondViewLoaded = false

class SecondViewController: UIViewController {
    
    @IBOutlet var latitudeLabel: UILabel!
    
    @IBOutlet var longitudeLabel: UILabel!
    
    @IBOutlet var AltitudeLabel: UILabel!

    @IBOutlet var courseLabel: UILabel!
    
    @IBOutlet var speedLabel: UILabel!
    
    @IBOutlet var nearestAddressLabel: UILabel!
    
    var timer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateData"), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateData() {
        latitudeLabel.text = "\(userLatitude)"
        longitudeLabel.text = "\(userLongitude)"
        AltitudeLabel.text = "\(userAltitude)"
        courseLabel.text = "\(userCourse)"
        speedLabel.text = "\(userSpeed)"
        nearestAddressLabel.text = userAddress
    }


}

