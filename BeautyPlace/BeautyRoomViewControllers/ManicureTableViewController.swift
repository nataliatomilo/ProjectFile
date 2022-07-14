//
//  ManicureTableViewController.swift
//  BeautyPlace
//
//  Created by Наталья Томило on 1.07.22.
//

import UIKit
import MapKit
import Cosmos

class ManicureTableViewController: UITableViewController {
//    let realm = try! Realm()
//    lazy var new: Results<BeautyRooms> = { self.realm.objects(BeautyRooms.self).sorted(byKeyPath: "name", ascending: true)}().filter("typesOfServices.name == 'Manicure'")
    var searchController: UISearchController! = UISearchController(searchResultsController: nil)
    let cellIdentifier = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "#DABDAB")
        tableView.dataSource = self
        tableView.register(CellOfTableView.self, forCellReuseIdentifier: cellIdentifier)
      //  searchController.searchResultsUpdater = self
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
//            new = realm.objects(BeautyRooms.self).filter(predicate).sorted(byKeyPath: "name", ascending: true)
//        case 1:
//            new = realm.objects(BeautyRooms.self).filter(predicate).sorted(byKeyPath: "created", ascending: true)
//        default:
//            new = realm.objects(BeautyRooms.self).filter(predicate) // 5
//        }
//    }

    // MARK: - Table view data source
}
//extension ManicureTableViewController {
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        new.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CellOfTableView
//        let specimen = searchController.isActive ?
//        new[indexPath.row] : new[indexPath.row]
//        cell.titleLabel.text = specimen.name
//        cell.iconImageView.image = UIImage(named: "IconUncategorized")
//        cell.addressLabel.text = specimen.address
//
//        return cell
//    }
//}
//extension ManicureTableViewController: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        let searchString = searchController.searchBar.text!
//        filterResultsWithSearchString(searchString: searchString)
//        let searchResultsController = searchController.searchResultsUpdater as! UITableViewController
//        searchResultsController.tableView.reloadData()
//    }
//}
