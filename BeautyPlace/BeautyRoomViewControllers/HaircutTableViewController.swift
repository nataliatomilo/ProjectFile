//
//  HaircutTableViewController.swift
//  BeautyPlace
//
//  Created by Наталья Томило on 1.07.22.
//

import UIKit
import MapKit
import FirebaseDatabase
import Cosmos

class HaircutTableViewController: UITableViewController {
    
       var ratingStorage = [Double]()
    
    var points = [CLLocationCoordinate2D]()
    var properties = [Properties]() {
        didSet {
            properties.sort { $0.title < $1.title }
        }
    }
    
    let cellIdentifier = "Cell"
    let imagesForTableView = [UIImage(named: "image21"), UIImage(named: "image22"), UIImage(named: "image23"), UIImage(named: "image24"), UIImage(named: "image25"), UIImage(named: "image26"), UIImage(named: "image27"), UIImage(named: "image28"), UIImage(named: "image29"), UIImage(named: "image30")]
    var userdefault = UserDefaults.standard.object(forKey: "key")
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        for i in 0..<BeauticianTableViewController.rowsCount {
//              ratingStorage[i] = Double(i) / 99 * 5
//            }
        view.backgroundColor = UIColor(named: "#DABDAB")
        tableView.register(CellOfTableView.self, forCellReuseIdentifier: cellIdentifier)
        loadInit()
    }
    
    func loadInit() {
        if let  fileName = Bundle.main.url(forResource: "Annotation", withExtension: "geojson"),
           let placesData = try? Data(contentsOf: fileName),
           let air = try! JSONSerialization.jsonObject(with: placesData, options: []) as? Dictionary<String, Any>,
           let features = air["features"] as? [Dictionary<String, Any>] {
            for feature in features {
                if let geometry = feature["geometry"] as? Dictionary<String, Any>,
                   let coorginates = geometry["coordinates"] as? [Double] {
                    points.append(CLLocationCoordinate2D(latitude: coorginates[1], longitude: coorginates[0]))
                }
                if let property = feature["properties"] as? Dictionary<String, Any>,
                   let title = property["title"] as? String,
                   let subtitle = property.filter({$0.value as! String == "Стрижка волос"})["subtitle"] as? String,
                   let address = property["address"] as? String,
                   let phone = property["phone"] as? String,
                   let time = property["time"] as? String {
                    properties.append(Properties(title: title, subtitle: subtitle, address: address, phone: phone, time: time))
                }
            }
        }
    }
    
//    func ratingDidChange(rating: Float) {
//        print(UserDefaults.standard.set(rating, forKey: "key"))
//    }
//
//    func giveCosmos(cell: CellOfTableView) {
//        print(UserDefaults.standard.object(forKey: "key") as Any)
//       // print("\(cell.reitingView.rating)")
//    }
}
// MARK: - Table view data source
extension HaircutTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CellOfTableView
       // cell.delegate = self
        let rating = UserDefaults.standard.object(forKey: "key")
        print(rating as Any)
        cell.accessoryType = .disclosureIndicator
        let room = properties[indexPath.row]
        cell.titleLabel.text = room.title
        cell.addressLabel.text = room.address
        cell.iconImageView.image = imagesForTableView[indexPath.row]
        
        
//        cell.reitingView.rating = ratingStorage[indexPath.row]
        cell.reitingView.update()
        
       // cell.reitingView.rating = UserDefaults.standard.object(forKey: "key") as! Double
        //cell.update
              
              // Store the star's rating when user lifts her finger
//        cell.reitingView.didFinishTouchingCosmos = { [self] rating in
//            UserDefaults.standard.set(rating, forKey: "key")
//            print(rating)
//
//        }
        return cell
            
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let customVC = CustomViewController()
        let room = properties[indexPath.row]
        customVC.titleLabelNew = room.title
        customVC.addressLabelNew = room.address
        customVC.phoneLabelNew = room.phone
        customVC.timeLabelNew = room.time
        customVC.imageNew = imagesForTableView[indexPath.row]
        let newPoints = points[indexPath.row]
        customVC.locationLabellatitudeNew = newPoints.latitude
        customVC.locationLabellongitudeNew = newPoints.longitude
        self.navigationController?.pushViewController(customVC, animated: true)
    }
}
