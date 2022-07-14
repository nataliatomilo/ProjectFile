//
//  MagazineTableViewController.swift
//  BeautyPlace
//
//  Created by Наталья Томило on 20.06.22.
//

import UIKit
import MapKit
//import Cosmos

class MagnifuingViewController: UITableViewController {
   // var searchResults = try! Realm().objects(BeautyRooms.self)
    var searchController: UISearchController! = UISearchController(searchResultsController: nil)
  //  var specimens = try! Realm().objects(BeautyRooms.self)
   //     .sorted(byKeyPath: "name", ascending: true)
    let cellIdentifier = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "#DABDAB")
        tableView.dataSource = self
        tableView.register(CellOfTableView.self, forCellReuseIdentifier: cellIdentifier)
       // searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.tintColor = UIColor.white
        searchController.searchBar.barTintColor = UIColor(named: "#DABDAB")
    }
//    func filterResultsWithSearchString(searchString: String) {
//        let predicate = NSPredicate(format: "name BEGINSWITH [c]%@", searchString) // 1
//        let scopeIndex = searchController.searchBar.selectedScopeButtonIndex // 2
//        let realm = try! Realm()
//
//        switch scopeIndex {
//        case 0:
//            searchResults = realm.objects(BeautyRooms.self).filter(predicate).sorted(byKeyPath: "name", ascending: true)
//        case 1:
//            searchResults = realm.objects(BeautyRooms.self).filter(predicate).sorted(byKeyPath: "created", ascending: true)
//        default:
//            searchResults = realm.objects(BeautyRooms.self).filter(predicate) // 5
//        }
//    }
    
}
//extension MagnifuingViewController {
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return
//        //searchResults.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CellOfTableView
////        let specimen = searchController.isActive ?
////        searchResults[indexPath.row] : specimens[indexPath.row]
//        cell.titleLabel.text = specimen.name
//       // cell.subtitleLabel.text = specimen.typesOfServices.name
//        cell.iconImageView.image = UIImage(named: "IconUncategorized")
//        cell.addressLabel.text = specimen.address
//
//        return cell
//    }
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath)
//        if cell!.isSelected {
//            let addRoomVC = MapViewController()
//            self.present(addRoomVC, animated: true)
//              var selectedSpecimen: BeautyRooms!
//              let indexPath = tableView.indexPathForSelectedRow
//              if searchController.isActive {
//                let searchResultsController =
//                  searchController.searchResultsController as! UITableViewController
//                let indexPathSearch = searchResultsController.tableView.indexPathForSelectedRow
//                selectedSpecimen = searchResults[indexPathSearch!.row]
//              } else {
//                selectedSpecimen = specimens[indexPath!.row]
//              }
//           // addRoomVC.rooms = selectedSpecimen
//        }
//    }
//}

//extension MagnifuingViewController: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        let searchString = searchController.searchBar.text!
//        filterResultsWithSearchString(searchString: searchString)
//        let searchResultsController = searchController.searchResultsUpdater as! UITableViewController
//        searchResultsController.tableView.reloadData()
//    }
//}
