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
    
    weak var delegate: MapViewControllerDelegate?
    var map: MKMapView! = MKMapView()
    var location: CLLocationManager! = CLLocationManager()
    let locationButton: UIButton! = UIButton()
    let locationPlacesButton: UIButton! = UIButton()
    var annotation: [Annotation] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "#DABDAB")
        map.translatesAutoresizingMaskIntoConstraints = false
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        locationPlacesButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(map)
        map.addSubview(locationButton)
        map.addSubview(locationPlacesButton)
        locationButton.addTarget(self, action: #selector(location(_:)), for: .primaryActionTriggered)
        locationPlacesButton.addTarget(self, action: #selector(locationPlaces(_:)), for: .primaryActionTriggered)
        
        NSLayoutConstraint.activate([
            map.topAnchor.constraint(equalTo: view.topAnchor),
            map.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            map.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            map.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationButton.bottomAnchor.constraint(equalTo: map.bottomAnchor, constant: -80),
            locationButton.trailingAnchor.constraint(equalTo: map.trailingAnchor, constant: -20),
            locationButton.heightAnchor.constraint(equalToConstant: 60),
            locationButton.widthAnchor.constraint(equalToConstant: 60),
            locationPlacesButton.bottomAnchor.constraint(equalTo: locationButton.bottomAnchor, constant: -80),
            locationPlacesButton.trailingAnchor.constraint(equalTo: map.trailingAnchor, constant: -20),
            locationPlacesButton.heightAnchor.constraint(equalToConstant: 60),
            locationPlacesButton.widthAnchor.constraint(equalToConstant: 60),
        ])
        
        locationButton.layer.cornerRadius = 25
        locationButton.layer.backgroundColor = CGColor(red: 249, green: 244, blue: 241, alpha: 0.5)
        locationButton.setImage(UIImage(named: "ImageLocation"), for: .normal)
        locationPlacesButton.layer.cornerRadius = 25
        locationPlacesButton.layer.backgroundColor = CGColor(red: 249, green: 244, blue: 241, alpha: 0.5)
        locationPlacesButton.setImage(UIImage(named: "ImageLocationPlaces"), for: .normal)
        map.delegate = self
        location.delegate = self
        loadInit()
    }
    
    @objc func location(_ sender: UIButton) {
    
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
            let correntLocation = map.userLocation.coordinate
            print(correntLocation)
        @unknown default:
            return
        }
        if CLLocationManager.locationServicesEnabled() {
            location.requestWhenInUseAuthorization()
        }
    }
    
    @objc func locationPlaces(_ sender: UIButton) {
        let coordinate = CLLocationCoordinate2D(latitude: (delegate?.getLat(vc: self))!, longitude: delegate?.getLon(vc: self) ?? 0.0)
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        map.setRegion(region, animated: true)
        
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
}
//MARK: - Map View Delegate

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        let region = MKCoordinateRegion(center: manager.location!.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
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

protocol MapViewControllerDelegate: AnyObject {
    func getLat(vc: MapViewController) -> Double
    func getLon(vc: MapViewController) -> Double
}
