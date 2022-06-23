//
//  MapViewController.swift
//  fefuactivity
//
//  Created by Vladoslav on 24.06.2022.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController {
    
    private let locationManager: CLLocationManager = {
       let manager = CLLocationManager()
        
        manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        
        return manager
    }()
    
    private let mapView = MKMapView()
    private var started = false
    
    fileprivate var userLocationHistory: [CLLocation] = []  {
        didSet {
            let coordinates = userLocationHistory.map { $0.coordinate }
            
            let route = MKPolyline(coordinates: coordinates, count: coordinates.count)
            route.title = "ваш Маршрут"
            
            mapView.addOverlay(route)
        }
    }

    
    fileprivate var userLocation: CLLocation? {
        didSet {
            if let userLocation = userLocation {
                let region = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
                mapView.setRegion(region, animated: true)
                
                guard started else {
                    return
                }
                
                userLocationHistory.append(userLocation)
            }
        }
    }
    
    private let userLocationIdentifier = "IcUserLocation"

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.rightAnchor.constraint(equalTo: view.rightAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        mapView.showsUserLocation = true
        mapView.delegate = self
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location  = locations.first else {
            return
        }
        print("получили локацию пользователя ", location)
        userLocation = location
        
        started.toggle()
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polylien = overlay as? MKPolyline {
            let render  = MKPolylineRenderer(polyline: polylien)
            render.fillColor = .blue
            render.strokeColor = .blue
            render.lineWidth = 5
            
            return render
        }
        
        return MKOverlayRenderer(overlay: overlay)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? MKUserLocation else {
            return nil
        }
        
        let deque = mapView.dequeueReusableAnnotationView(withIdentifier: userLocationIdentifier)
        
        let view = deque ?? MKAnnotationView(annotation: annotation, reuseIdentifier: userLocationIdentifier)
        
        view.image = UIImage(named: "UserLocation")
        
        return view
    }
}
