//
//  GeolocalizationViewController.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 2/07/22.
//

import UIKit
import GoogleMaps

protocol GeolocalizationViewControllerDelegate: AnyObject {
    
    func markerDidChange(directionGeo: String, latGeo: Double, lngGeo: Double)
}


class GeolocalizationViewController: UIViewController {
    
    
    let geocoder = GMSGeocoder()
    
    weak var delegate: GeolocalizationViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        let camera = GMSCameraPosition.camera(withLatitude: -8.1121075, longitude: -79.028297, zoom: 17.4)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        mapView.isMyLocationEnabled = true
        
//        if let mylocation = mapView.myLocation {
//            print("User's location: \(mylocation)")
//        } else {
//            print("User's location is unknown")
//        }
        
        mapView.settings.myLocationButton = true
//        if let myLocation
        
//        print("mi ubicacion es ----------: \(String(describing: mapView.myLocation))")
        
        mapView.delegate = self
        self.view.addSubview(mapView)

        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -8.1121075, longitude: -79.028297)
        marker.map = mapView
        marker.isDraggable = true
        
        
    }
    

    

}

extension GeolocalizationViewController: GMSMapViewDelegate{
    
    
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
        print("Aer que sale: \(marker.position)")
        
        geocoder.reverseGeocodeCoordinate(marker.position){ response, error in
            
            if let address = response?.firstResult() {
                
                let lines = address.lines!
                
                print("address: \(address)")
                print("direccion?: \(lines[0])")
                print("tipo del lat: \(type(of: marker.position.latitude))")
                
                self.delegate?.markerDidChange(directionGeo: lines[0], latGeo: marker.position.latitude, lngGeo: marker.position.longitude)
            }
            
        }
        
        
        
        
    }
    
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        print("Lo tocoooo!!")
//        print("mi ubicacion es ----------: \(String(describing: mapView.myLocation))")
        return true
    }
    
    
}
