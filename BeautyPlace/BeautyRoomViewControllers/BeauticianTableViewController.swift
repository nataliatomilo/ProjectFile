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
    
    var points = [CLLocationCoordinate2D]()
    var properties = [Properties]() {
        didSet {
            properties.sort { $0.title < $1.title }
        }
    }
    
    let cellIdentifier = "Cell"
    let imagesForTableView = [UIImage(named: "image1"), UIImage(named: "image2"), UIImage(named: "image3"), UIImage(named: "image4"), UIImage(named: "image5"), UIImage(named: "image6"), UIImage(named: "image7"), UIImage(named: "image8"), UIImage(named: "image9"), UIImage(named: "image10")]
    var userdefault = UserDefaults.standard.object(forKey: "key")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
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
        print(rating)
        print(UserDefaults.standard.set(rating, forKey: "key"))
        print(UserDefaults.standard.object(forKey: "key") as Any)
    }
    
    func giveCosmos(cell: CellOfTableView) {
        print("\(cell.reitingView.rating)")
        
    }
}
// MARK: - Table view data source
extension BeauticianTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CellOfTableView
        cell.delegate = self
        cell.accessoryType = .disclosureIndicator
        let room = properties[indexPath.row]
        cell.titleLabel.text = room.title
        cell.addressLabel.text = room.address
        cell.iconImageView.image = imagesForTableView[indexPath.row]
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
        self.navigationController?.pushViewController(customVC, animated: true)
    }
}
