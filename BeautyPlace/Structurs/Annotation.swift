//
//  Annotation.swift
//  BeautyPlace
//
//  Created by Наталья Томило on 20.06.22.
//


import UIKit
import MapKit
import Contacts

class Annotation : NSObject, MKAnnotation {
    
    var title: String?
    var subtitle: String?
    var address: String?
    var phone: String?
    var time: String?
    var coordinate: CLLocationCoordinate2D
    
    init(
        title: String,
        subtitle: String,
        address: String,
        phone: String,
        time: String,
        coordinate: CLLocationCoordinate2D
    ) {
        self.title = title
        self.subtitle = subtitle
        self.address = address
        self.phone = phone
        self.time = time
        self.coordinate = coordinate
    }
    
    init?(feature: MKGeoJSONFeature) {
        guard
            let point = feature.geometry.first as? MKPointAnnotation,
            let properties = feature.properties,
            let json = try? JSONSerialization.jsonObject(with: properties),
            let proper = json as? [String: Any]
        else {
            return nil
        }
        title = proper["title"] as? String
        subtitle = proper["subtitle"] as? String
        address = proper["address"] as? String
        phone = proper["phone"] as? String
        time = proper["time"] as? String
        coordinate = point.coordinate
    }
    
    var mapItem: MKMapItem? {
        guard let location = subtitle else {
            return nil
        }
        let addressDict = [CNPostalAddressStreetKey: location]
        let placeMark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placeMark)
        mapItem.name = title
        return mapItem
    }
}

