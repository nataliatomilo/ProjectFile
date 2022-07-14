//
//  MapViewController.swift
//  BeautyPlace
//
//  Created by Наталья Томило on 14.06.22.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    var map: MKMapView! = MKMapView()
    var location: CLLocationManager! = CLLocationManager()
    let locationButton: UIButton! = UIButton()
    var annotation: [Annotation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        map.translatesAutoresizingMaskIntoConstraints = false
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(map)
        map.addSubview(locationButton)
        locationButton.addTarget(self, action: #selector(location(_:)), for: .primaryActionTriggered)
    
        NSLayoutConstraint.activate([
            map.topAnchor.constraint(equalTo: view.topAnchor),
            map.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            map.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            map.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationButton.bottomAnchor.constraint(equalTo: map.bottomAnchor, constant: -80),
            locationButton.trailingAnchor.constraint(equalTo: map.trailingAnchor, constant: -20),
            locationButton.heightAnchor.constraint(equalToConstant: 60),
            locationButton.widthAnchor.constraint(equalToConstant: 60),
        ])
        
        locationButton.layer.cornerRadius = 25
        locationButton.layer.backgroundColor = CGColor(red: 249, green: 244, blue: 241, alpha: 0.5)
        locationButton.setImage(UIImage(named: "ImageLocation"), for: .normal)
//        let fileManager = FileManager.default
//            var config = Realm.Configuration()
//            Realm.Configuration.defaultConfiguration = config
//            print (Realm.Configuration.defaultConfiguration.fileURL!)
        map.delegate = self
        loadInit()
    }
    
    @objc func location(_ sender: UIButton) {
        location.delegate = self
        location.desiredAccuracy = kCLLocationAccuracyBest
        map.showsUserLocation = true
        switch location.authorizationStatus {
        case .notDetermined:
            location.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .denied:
            print("Danied")
        case .authorizedAlways:
            location.startUpdatingLocation()
            print(location.location as Any)
        case .authorizedWhenInUse:
            location.startUpdatingLocation()
            guard let correntLocation = location.location else {return}
            print(correntLocation)
        @unknown default:
            return
        }
        if CLLocationManager.locationServicesEnabled() {
            location.requestWhenInUseAuthorization()
        }
    }
    func loadInit() {
        guard
            let  fileName = Bundle.main.url(forResource: "Annotation", withExtension: "geojson"),
            let placesData = try? Data(contentsOf: fileName)
                
        else {
            return
        }
        do {
            
            let features = try MKGeoJSONDecoder()
                .decode(placesData)
                .compactMap ({ $0 as? MKGeoJSONFeature })
            let validWorks = features.compactMap(Annotation.init)
            self.annotation.append(contentsOf: validWorks)
            DispatchQueue.main.async {
                self.map.addAnnotations(self.annotation)
            }
        } catch {
            print("\(error)")
        }
    }
//    func updateRoom() {
//        let realm = try! Realm()
//        
//        try! realm.write {
//            rooms.name = nameRoomTextField.text!
//            rooms.typesOfServices = selectedTypes
//            rooms.address = addressTextField.text!
//            rooms.email = emailTextField.text!
//            rooms.phone = numberTextField.text!
//        }
//    }
    
}
//MARK: - Map View Delegate

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let loc = map.userLocation.coordinate
        let region = MKCoordinateRegion(center: loc, latitudinalMeters: 500, longitudinalMeters: 500)
        map.setRegion(region, animated: true)
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        status != .notDetermined ? map.showsUserLocation = true : print("Authorization to use location data denied")
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? Annotation else {
            return nil
        }
        let identifier = "Annotation"
        let view: MKMarkerAnnotationView
        if let dequeueView = mapView.dequeueReusableAnnotationView(withIdentifier: "Annotation") as? MKMarkerAnnotationView {
            dequeueView.annotation = annotation
            view = dequeueView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let places = view.annotation as? Annotation else {
            return
        }
        let launchOption = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        places.mapItem?.openInMaps(launchOptions: launchOption)
    }
}
