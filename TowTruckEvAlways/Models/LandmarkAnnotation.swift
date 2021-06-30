//
//  LandmarkAnnotation.swift
//  TowTruckEvAlways
//
//  Created by Дмитрий Крюков on 25.06.2021.
//

import MapKit
import UIKit


final class LandmarkAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D

    init(landmark: Landmark) {
        self.title = landmark.name
        self.coordinate = landmark.coordinate
    }
}

