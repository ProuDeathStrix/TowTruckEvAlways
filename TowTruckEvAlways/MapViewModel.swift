//
//  MapViewModel.swift
//  TowTruckEvAlways
//
//  Created by Дмитрий Крюков on 21.06.2021.
//

import SwiftUI
import MapKit
import CoreLocation

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    @Published var mapView = MKMapView()
    @Published var region : MKCoordinateRegion!
    @Published var permissionDenied = false
    @Published var mapType : MKMapType = .standard
    @Published var searchTxt = ""
    func updateMapType() {
        if mapType == .standard{
            mapType = .hybrid
            mapView.mapType = mapType
        }else {
            mapType = .standard
            mapView.mapType = mapType
        }
    }
    
    func focusLocation() {
        guard let _ = region else{return}
        
        mapView.setRegion(region, animated: true)
        mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
    }
    
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .denied:
            
            permissionDenied.toggle()
        case .notDetermined:
            
            manager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse:
            
            manager.requestLocation()
        default:
            ()
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print(error.localizedDescription)
    }

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        guard let location = locations.last else{return}
        
        
        self.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        
        self.mapView.setRegion(self.region, animated: true)
        
        self.mapView.setVisibleMapRect(self.mapView.visibleMapRect, animated: true)
    }
}
