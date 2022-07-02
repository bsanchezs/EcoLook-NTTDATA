//
//  GeolocalizationViewController.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 2/07/22.
//

import UIKit
import GoogleMaps

class GeolocalizationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let camera = GMSCameraPosition.camera(withLatitude: -8.1121075, longitude: -79.028297, zoom: 17.4)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)

        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -8.1121075, longitude: -79.028297)
        marker.map = mapView
        marker.isDraggable = true
    }
    

    

}
