//
//  MagazineTableViewController.swift
//  BeautyPlace
//
//  Created by Наталья Томило on 20.06.22.
//

import UIKit
import MapKit
import FirebaseDatabase
import Cosmos


class MagnifuingViewController: UITableViewController {
    
    var ratingStorage = [Double]()
 var points = [CLLocationCoordinate2D]()
 var properties = [Properties]()
 let cellIdentifier = "Cell"
   
    var searchController: UISearchController! = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "#DABDAB")
        tableView.register(CellOfTableView.self, forCellReuseIdentifier: cellIdentifier)
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.tintColor = UIColor.white
        searchController.searchBar.barTintColor = UIColor(named: "#DABDAB")
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
                   let subtitle = property["subtitle"] as? String,
                   let address = property["address"] as? String,
                   let phone = property["phone"] as? String,
                   let time = property["time"] as? String,
                let image = property["image"] as? String {
                    properties.append(Properties(title: title, subtitle: subtitle, address: address, phone: phone, time: time, image: image))
                }
            }
        }
    }
    
    func filterResultsWithSearchString(searchString: String) {
         let predicate = NSPredicate(format: "name BEGINSWITH [c]%@", searchString)
         let scopeIndex = searchController.searchBar
//         switch scopeIndex {
//         case 0:
//             new = properties.self.filter(predicate.predicateFormat).sorted(by: "title")
//         case 1:
//             new = realm.objects(BeautyRooms.self).filter(predicate).sorted(byKeyPath: "created", ascending: true)
//         default:
//             new = realm.objects(BeautyRooms.self).filter(predicate) // 5
//         }
     }
}
// MARK: - Table view data source
extension MagnifuingViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CellOfTableView
        cell.accessoryType = .disclosureIndicator
        let room = properties[indexPath.row]
        cell.titleLabel.text = room.title
        cell.addressLabel.text = room.address
       // cell.iconImageView.image = room.image
        return cell
    }
}

extension MagnifuingViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchString = searchController.searchBar.text!
        filterResultsWithSearchString(searchString: searchString)
        let searchResultsController = searchController.searchResultsUpdater as! UITableViewController
        searchResultsController.tableView.reloadData()
    }
}
