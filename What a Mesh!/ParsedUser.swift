//
//  ParsedUser.swift
//  What a Mesh!
//
//  Created by Gabriele Giuli on 2020-02-08.
//  Copyright © 2020 GabrieleGiuli. All rights reserved.
//

import Foundation
import MapKit

class ParsedUser {
    var name: String
    var ID: String
    var location: CLLocationCoordinate2D
    var messages: [String] = []
    
    init(name: String, ID: String, lat: Float, lon: Float) {
        self.name = name
        self.ID = ID
        self.location = CLLocationCoordinate2D(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(lon))
    }
}
