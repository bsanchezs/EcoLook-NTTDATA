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

    weak var delegate: GeolocalizationViewControllerDelegate?
    @IBOutlet weak var customMapView: GMSMapView!
    
    
    let geocoder = GMSGeocoder()
    let marker = GMSMarker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        customMapView.delegate = self
////        let camera = GMSCameraPosition(latitude: -8.1121075, longitude: -79.028297, zoom: 17.4)
//        let camera = GMSCameraPosition(latitude: -8.1121075, longitude: -79.028297, zoom: 17.4)
//
////        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
//        customMapView.camera = camera
//
//
//        customMapView.isMyLocationEnabled = true
//        customMapView.settings.myLocationButton = true
//
//
//
////        self.view.addSubview(mapView)
//
//        // Creates a marker in the center of the map.
//
//        marker.position = CLLocationCoordinate2D(latitude: -8.1121075, longitude: -79.028297)
//        marker.map = customMapView
//        marker.isDraggable = true
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
//        let camera = GMSCameraPosition(latitude: -8.1121075, longitude: -79.028297, zoom: 17.4)
        let camera = GMSCameraPosition(latitude: -8.1121075, longitude: -79.028297, zoom: 17.4)
        
//        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        customMapView.camera = camera
        
        
        customMapView.isMyLocationEnabled = true
        customMapView.settings.myLocationButton = true
        customMapView.delegate = self
        
        
//        self.view.addSubview(mapView)

        // Creates a marker in the center of the map.
        
        marker.position = CLLocationCoordinate2D(latitude: -8.1121075, longitude: -79.028297)
        marker.map = customMapView
        marker.isDraggable = true
    }
    

    

}

extension GeolocalizationViewController {
    
    func showDirectionHasChange(){
        
        let okay = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let alerta = UIAlertController(title: "Direccion actualizada", message: "La direccion se ha actualizado", preferredStyle: .alert)
        alerta.addAction(okay)
        present(alerta, animated: true, completion: nil)
        
    }
    
}

extension GeolocalizationViewController: GMSMapViewDelegate{
    
    
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
//        print("Aer que sale: \(marker.position)")
        
        geocoder.reverseGeocodeCoordinate(marker.position){ response, error in
            
            if let address = response?.firstResult() {
                
                let lines = address.lines!
                
//                print("Marker moviendoseeeeeeee")
//                print("address: \(address)")
//                print("direccion?: \(lines[0])")
//                print("tipo del lat: \(type(of: marker.position.latitude))")
                
                self.delegate?.markerDidChange(directionGeo: lines[0], latGeo: marker.position.latitude, lngGeo: marker.position.longitude)
                
                self.showDirectionHasChange()
            }
            
        }
        
        
        
        
    }
    
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        print("Lo tocoooo!!")
//        -8.103485946815995, -79.01666208299132 -- Coordenadas de mi casa
        
        guard let myLat = mapView.myLocation?.coordinate.latitude, let myLng = mapView.myLocation?.coordinate.longitude else{
            return false
        }
        
        let myCamera = GMSCameraPosition.camera(withLatitude: myLat, longitude: myLng, zoom: 17.4)
        mapView.animate(to: myCamera)
        
        marker.position = CLLocationCoordinate2D(latitude: myLat, longitude: myLng)
        marker.map = mapView
        
        geocoder.reverseGeocodeCoordinate(marker.position){ [self] response, error in
            
            if let address = response?.firstResult() {
                
                let lines = address.lines!
                
//                print("Marker moviendoseeeeeeee")
//                print("direccion?: \(lines[0])")
                
                self.delegate?.markerDidChange(directionGeo: lines[0], latGeo: myLat, lngGeo: myLng)
                
                showDirectionHasChange()
            }
            
        }
    
//        print("mi ubicacion es ----------: \(String(describing: mapView.myLocation))")
//        print("mis coords son: \(myLat), \(myLng)")

        return true
    }
    
    
}
