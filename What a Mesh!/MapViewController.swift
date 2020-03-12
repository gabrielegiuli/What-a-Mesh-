//
//  MapViewController.swift
//  What a Mesh!
//
//  Created by Gabriele Giuli on 2020-03-11.
//  Copyright © 2020 GabrieleGiuli. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    let locationManager = CLLocationManager()
    var users: [ParsedUser]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        map.delegate = self
        checkLocationServices()
        showLocations()
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            checkLocationAuthorization()
        } else {
            // Show alert letting the user know they have to turn this on.
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
            case .authorizedWhenInUse:
                map.showsUserLocation = true
                case .denied: // Show alert telling users how to turn on permissions
                break
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
                map.showsUserLocation = true
                case .restricted: // Show an alert letting them know what’s up
                break
            case .authorizedAlways:
            break
        }
    }
    
    func showLocations() {
        for user in self.users {
            let annotation = MKPointAnnotation()
            annotation.title = user.name
            annotation.coordinate = user.location
            print("\(user.name) ANNOTATION ADDED")
            self.map.addAnnotation(annotation)
        }
    }
    
}
