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

class BeauticianTableViewController: UITableViewController, CosmosProtocol {
    

    private static var rowsCount = 100
      private var ratingStorage = [Double](repeating: 0, count: rowsCount)
      
    var newCosmos = [Double]()
    var collection = [CellOfTableView]()
    var points = [CLLocationCoordinate2D]()
    var properties = [Properties]() {
        didSet {
            properties.sort { $0.title < $1.title }
        }
    }
    let cellIdentifier = "Cell"
    let imagesForTableView = [UIImage(named: "image1"), UIImage(named: "image2"), UIImage(named: "image3"), UIImage(named: "image4"), UIImage(named: "image5"), UIImage(named: "image6"), UIImage(named: "image7"), UIImage(named: "image8"), UIImage(named: "image9"), UIImage(named: "image10")]
  //  var userdefault = UserDefaults.standard.object(forKey: "key")
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        collection.forEach({
//            cell in newCosmos.append(cell.reitingView.rating)
//            let ser: Void = UserDefaults.standard.set(cell.reitingView.rating, forKey: "rating")
//            print(ser)
//        })
        for i in 0..<BeauticianTableViewController.rowsCount {
             ratingStorage[i] = Double(i) / 99 * 5
           }
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
                   let subtitle = property.filter({$0.value as! String == "Косметология"})["subtitle"] as? String,
                   let address = property["address"] as? String,
                   let phone = property["phone"] as? String,
                   let time = property["time"] as? String {
                    properties.append(Properties(title: title, subtitle: subtitle, address: address, phone: phone, time: time))
                }
            }
        }
    }
    
    func ratingDidChange(rating: Float) {
        UserDefaults.standard.set(rating, forKey: "key")
        UserDefaults.standard.object(forKey: "key")
    }

    func giveCosmos(cell: CellOfTableView) {
    UserDefaults.standard.object(forKey: "key")
       // print("\(cell.reitingView.rating)")
    }
}
// MARK: - Table view data source
extension BeauticianTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return BeauticianTableViewController.rowsCount
        return properties.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CellOfTableView
       // collection.append(cell)
       // cell.delegate = self
        //let rating = UserDefaults.standard.object(forKey: "key")
       // print(rating as Any)
        let rating = ratingStorage[indexPath.row]
        //cell.update(rating)
        cell.reitingView.didFinishTouchingCosmos = { [weak self] rating in
               self?.ratingStorage[indexPath.row] = rating
            UserDefaults.standard.set(rating, forKey: "cosmos")
            print(UserDefaults.standard.set(rating, forKey: "cosmos"))
             }
        UserDefaults.standard.object(forKey: "cosmos")
             
        cell.accessoryType = .disclosureIndicator
        let room = properties[indexPath.row]
        cell.titleLabel.text = room.title
        cell.addressLabel.text = room.address
        cell.iconImageView.image = imagesForTableView[indexPath.row]
        
        
//        cell.reitingView.rating = ratingStorage[indexPath.row]
      //  cell.reitingView.update()
        
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
