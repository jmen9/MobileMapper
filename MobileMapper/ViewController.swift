//
//  ViewController.swift
//  MobileMapper
//
//  Created by Jacob Men 2019 on 4/1/19.
//  Copyright © 2019 jmen9. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    var currentLocation: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations[0]
        print(currentLocation)
    }


    @IBAction func zoomButtonTapped(_ sender: UIBarButtonItem) {
        
        let coordinateSpan = MKCoordinateSpan(latitudeDelta: 0.06, longitudeDelta: 0.05)
        let center = currentLocation.coordinate
        let region = MKCoordinateRegion(center: center, span: coordinateSpan)
    }
}

