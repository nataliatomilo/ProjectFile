//
//  MakeUpTableViewController.swift
//  BeautyPlace
//
//  Created by Наталья Томило on 1.07.22.
//

import UIKit
import MapKit
import FirebaseDatabase
import Cosmos

class MakeUpTableViewController: UITableViewController {
    
    var points = [CLLocationCoordinate2D]()
    var properties = [Properties]() {
        didSet {
            properties.sort {
                $0.title < $1.title
            }
        }
    }
    
    let cellIdentifier = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
                   let subtitle = property.filter({$0.value as! String == "MakeUp"})["subtitle"] as? String,
                   let address = property["address"] as? String,
                   let phone = property["phone"] as? String,
                   let time = property["time"] as? String {
                    properties.append(Properties(title: title, subtitle: subtitle, address: address, phone: phone, time: time))
                }
            }
        }
    }
}

// MARK: - Table view data source
extension MakeUpTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CellOfTableView
        cell.accessoryType = .disclosureIndicator
        let room = properties[indexPath.row]
        cell.titleLabel.text = room.title
        cell.iconImageView.image = UIImage(named: "IconUncategorized")
        return cell
    }
}
