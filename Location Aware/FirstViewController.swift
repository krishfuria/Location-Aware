//
//  FirstViewController.swift
//  Location Aware
//
//  Created by Krish Furia on 1/3/16.
//  Copyright © 2016 Krish Furia. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

var userLatitude = CLLocationDegrees()

var userLongitude = CLLocationDegrees()

var userAltitude = CLLocationDistance()

var userCourse = CLLocationDirection()

var userSpeed = CLLocationSpeed()

var userAddress = String()

class FirstViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        var currentAddress = String()
        
        let userLocation:CLLocation = locations[0]
        
        userLatitude = userLocation.coordinate.latitude
        
        userLongitude = userLocation.coordinate.longitude
        
        userAltitude = userLocation.altitude
        
        userCourse = userLocation.course
        
        userSpeed = userLocation.speed
        
        let latDelta:CLLocationDegrees = 0.01
        
        let longDelta:CLLocationDegrees = 0.01
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(userLatitude, userLongitude)
        
        let region = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: true)
        
        let annotion = MKPointAnnotation()
        
        annotion.coordinate = location
        
        annotion.title = "Current Location"
        
        map.addAnnotation(annotion)
        
        CLGeocoder().reverseGeocodeLocation(manager.location!) { (placemarks, error) -> Void in
            if (error != nil) {
                print("Error occured while getting reverse Geo-Location: " +  String(error))
            }
            else if placemarks?.count > 0 {
                let address = placemarks?[0]
                if address != nil {
                    if address!.subThoroughfare != nil {
                        currentAddress += "\(address!.subThoroughfare!), "
                    }
                    if address!.thoroughfare != nil {
                        currentAddress += "\(address!.thoroughfare!), "
                    }
                    if address!.locality != nil {
                        currentAddress += "\(address!.locality!), "
                    }
                    if address!.administrativeArea != nil {
                        currentAddress += "\(address!.administrativeArea!), "
                    }
                    if address!.postalCode != nil {
                        currentAddress += "\(address!.postalCode!)"
                    }
                    userAddress = currentAddress
                }
                else {
                    print("Address: \(address)")
                }
            }
        }
    }

}

