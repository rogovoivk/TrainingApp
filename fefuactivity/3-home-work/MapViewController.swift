//
//  MapViewController.swift
//  fefuactivity
//
//  Created by Vladoslav on 24.06.2022.
//

import UIKit
import CoreLocation
import MapKit
import CoreFoundation
import CoreData

class ParkBenchTimer {
    var startDate: Date
    var startTime: CFAbsoluteTime
    var endTime: CFAbsoluteTime?
    
    init(){
        startTime = CFAbsoluteTimeGetCurrent()
        startDate = Date()
    }
    
//    func start(){
//        startTime = CFAbsoluteTimeGetCurrent()
//    }
    
    func stop() -> (CFAbsoluteTime, Date, Date) {
        endTime = CFAbsoluteTimeGetCurrent()
        let finishDate = Date()
        return (duration!, startDate, finishDate)
    }
    
    var duration: CFAbsoluteTime? {
        if let endTime = endTime {
            return endTime - startTime
        } else {
            return nil
        }
    }
}

class MapViewController: UIViewController {
    var dataStoreManager = DataStoreManager()
    
    private let locationManager: CLLocationManager = {
       let manager = CLLocationManager()
        
        manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        
        return manager
    }()
    
    private let mapView = MKMapView()
    private var started = false
    private var paused = false
    private var wasPaused = false
    private var finish = false
    private var chooseType = "none"
    private var timer: ParkBenchTimer?
    
    let startView: StartActivityBottomView = {
        let view: StartActivityBottomView = .loadNib()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let processView: AfterStartActivityBottom = {
        let view: AfterStartActivityBottom = .loadNib()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    fileprivate var userLocationHistory: [CLLocation] = []  {
        didSet {
            
            guard started else {
                print ("тут отработал выход! не должен рисоваться!!")
                return
            }
            
            let coordinates = userLocationHistory.map { $0.coordinate }
//            guard !wasPaused else{
//                wasPaused = false
//                return
//            }
            
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
        
        view.addSubview(startView)
        NSLayoutConstraint.activate([
            startView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            startView.rightAnchor.constraint(equalTo: view.rightAnchor),
            startView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        startView.delegate = self
        startView.layer.cornerRadius = 16
        
        view.addSubview(processView)
        NSLayoutConstraint.activate([
            processView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            processView.rightAnchor.constraint(equalTo: view.rightAnchor),
            processView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        processView.finishDelegate = self
        processView.pauseDelegate = self
        processView.layer.cornerRadius = 16
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location  = locations.first else {
            return
        }
        print("получили локацию пользователя ", location)
        userLocation = location
        
        
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

extension MapViewController: StartActivityBottomViewDeligate {
    func didStart() {
        chooseType = startView.choose
        print(chooseType)
        if (chooseType != "none"){
            startView.isHidden = true
            started = true
            processView.isHidden = false
            timer = ParkBenchTimer()
        }
    }
}

extension MapViewController: FinishActivityBottomViewDeligate {
    func didFinish() {
        var ansDistance: Double = 0
        for item in 1...(userLocationHistory.count-1) {
//            localDistance.distance(from: userLocationHistory[item])
            ansDistance = ansDistance +  userLocationHistory[item - 1].distance(from: userLocationHistory[item])
        }
        var timerResult: CFAbsoluteTime?
        var startDate: Date?
        var finishDate: Date?
        (timerResult, startDate, finishDate) = timer?.stop() as! (CFAbsoluteTime?, Date?, Date?)
        print ("\(timerResult!.description) seconds, \(chooseType) type, \(ansDistance) Distance \(startDate!.description) startTime \(finishDate!.description) finishTime")
        print ("тут finish activity!!!")
        dataStoreManager.addActivity(type: chooseType, distance: Int64(ansDistance), time: String(timerResult!), startDate: startDate!, finishDate: finishDate!)
        started = false
        self.navigationController?.popViewController(animated: true)
    }
}

extension MapViewController: PauseActivityBottomViewDeligate {
    func didPause() {
        print("нажата кнопка пауза!")
        if paused {
            started = true
            paused = false
            wasPaused = true
            print("снять паузу!")
        } else {
            started = false
            paused = true
            print("поставить паузу!")
        }
    }
}

