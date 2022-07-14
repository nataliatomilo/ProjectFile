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

class BeauticianTableViewController: UITableViewController {
    
    var database: DatabaseReference!
    var types = [BeautyRooms]()
  //  var new: [DataSnapshot] = []
  //  var searchController: UISearchController! = UISearchController(searchResultsController: nil)
    let cellIdentifier = "Cell"
   

    override func viewDidLoad() {
        super.viewDidLoad()
        database = Database.database().reference(withPath: ".info/connected")
            database.observe(.value, with: { snapshot in
                if let connected = snapshot.value as? Bool, connected {
                    print("Connected")
                } else {
                    print("Not connected")
                    // show alert here
                }
            })
    
        
       // view.backgroundColor = UIColor(named: "#DABDAB")
                            tableView.dataSource = self
        tableView.register(CellOfTableView.self, forCellReuseIdentifier: cellIdentifier)
//        searchController.searchResultsUpdater = self
//        searchController.dimsBackgroundDuringPresentation = false
     //   definesPresentationContext = true
      //  tableView.tableHeaderView = searchController.searchBar
//        searchController.searchBar.tintColor = UIColor.white
//        searchController.searchBar.barTintColor = UIColor(named: "#DABDAB")
        
//        database.child("properties")
//            .queryOrdered(byChild: "subtitle")
//            .queryEqual(toValue: "Косметология")
//            .observe(.childAdded, with: { (snapshot) in
//                print(snapshot)
//            }, withCancel: nil)
     //   loadNews()
        nnn()
    }
    func nnn() {
        database.child("features").child("properties").child("subtitle").observeSingleEvent(of: .value, with: { snapshot in
            print(snapshot)
            
        })
    }
//        database = Database.database().reference().root.child("features").child(id?).child("geometry/properties").observe(.childAdded , with: { snapshot in
//
//                if snapshot.exists() {
//
//                    let recent = snapshot.value as!  NSDictionary
//
//                     print(recent)
//                }
//                })
//
//    }
//    override func didReceiveMemoryWarning() {
//            super.didReceiveMemoryWarning()
//        }
    func loadNews() {
        database.child("properties")
            .queryOrdered(byChild: "subtitle")
            .queryEqual(toValue: "Косметология")
            .observe(.childAdded, with: { (snapshot) in
                 let valueDictionary = snapshot.value as? [AnyHashable:String]
                            
                let name = valueDictionary!["title"]
                let typesOfServices = valueDictionary!["subtitle"]
                let address = valueDictionary!["address"]
                let phone = valueDictionary!["phone"]
                let time = valueDictionary!["time"]
                self.types.append(BeautyRooms(name: name!, typesOfServices: typesOfServices as! String, address: address as! String, phone: phone as! String, time: time as! String))
                                })
           // database = Database.database().reference()
//            database.child("properties").observe(.childAdded, with: { (snapshot) in
//
//                //print(snapshot)
//
//                if let valueDictionary = snapshot.value as? [AnyHashable:String]
//                {
//                    let name = valueDictionary["title"]
//                    let typesOfServices = valueDictionary["subtitle"]
//                    let address = valueDictionary["address"]
//                    let phone = valueDictionary["phone"]
//                    let time = valueDictionary["time"]
//                    self.types.insert(BeautyRooms(name: name as! String, typesOfServices: typesOfServices as! String, address: address as! String, phone: phone as! String, time: time as! String), at: 0)
//                    DispatchQueue.main.async {
//                        self.tableView.reloadData()
//                    }
//                }
//
//            })
//
        }

    
//    func filterResultsWithSearchString(searchString: String) {
//        let predicate = NSPredicate(format: "name BEGINSWITH [c]%@", searchString) // 1
//        let scopeIndex = searchController.searchBar.selectedScopeButtonIndex // 2
//
//
//
////            usersRef.queryOrdered(byChild: "email").queryStarting(atValue: email).queryEnding(atValue: email).observeSingleEvent(of: .value, with: { (snapshot) in
////                if let values = snapshot.value as? [String: Any]{
////                    print(values)
////                }
////            })
////        let realm = try! Realm()
////
////        switch scopeIndex {
////        case 0:
////            new = realm.objects(BeautyRooms.self).filter(predicate).sorted(byKeyPath: "name", ascending: true)
////        case 1:
////            new = realm.objects(BeautyRooms.self).filter(predicate).sorted(byKeyPath: "created", ascending: true)
////        default:
////            new = realm.objects(BeautyRooms.self).filter(predicate) // 5
////        }
//    }
}
// MARK: - Table view data source
extension BeauticianTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return types.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CellOfTableView
        var n = BeautyRooms()
        n = types[indexPath.row]
        cell.titleLabel.text = n.name
        cell.subtitleLabel.text = n.typesOfServices
        cell.iconImageView.image = UIImage(named: "IconUncategorized")
//
//          let course = courseSnap.value
//        cell.titleLabel.text = course.map(<#T##transform: (Any) throws -> U##(Any) throws -> U#>)
//        cell.iconImageView.image = UIImage(named: "IconUncategorized")
//        cell.addressLabel.text = specimen.address
//
        
        
        return cell
    }
}
//extension BeauticianTableViewController: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        let searchString = searchController.searchBar.text!
//        filterResultsWithSearchString(searchString: searchString)
//        let searchResultsController = searchController.searchResultsUpdater as! UITableViewController
//        searchResultsController.tableView.reloadData()
//    }
//}
