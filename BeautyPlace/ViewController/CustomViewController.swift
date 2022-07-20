//
//  CustomViewController.swift
//  BeautyPlace
//
//  Created by Наталья Томило on 17.07.22.
//

import UIKit
import Cosmos

class CustomViewController: UIViewController {
    
    var imageNew: UIImage!
    var titleLabelNew: String!
    var addressLabelNew: String!
    var timeLabelNew: String!
    var phoneLabelNew: String!
    let photoLabel: UILabel! = UILabel()
    let fotoImage: UIImageView! = UIImageView()
    let titleLabel: UILabel! = UILabel()
    let addressLabel: UILabel! = UILabel()
    let timeLabel: UILabel! = UILabel()
    let phoneButton: UIButton! = UIButton()
    let locationInMapButton: UIButton! = UIButton()
    let favoriteButton: UIButton! = UIButton()
//    var reitingView: CosmosView = {
//          var view = CosmosView()
//          view.rating = 0
//          view.settings.starSize = 15
//          view.settings.starMargin = 1
//          view.settings.fillMode = .half
//          view.settings.filledColor = UIColor(named: "#7a49a5")!
//          view.settings.emptyBorderColor = UIColor(named: "#7a49a5")!
//          view.settings.filledBorderColor = UIColor(named: "#7a49a5")!
//
//          return view
//      }()
//    var reitingView: CosmosView = {
//          var view = CosmosView()
//          view.rating = 0
//          view.settings.starSize = 15
//          view.settings.starMargin = 1
//          view.settings.fillMode = .half
//          view.settings.filledColor = UIColor(named: "#7a49a5")!
//          view.settings.emptyBorderColor = UIColor(named: "#7a49a5")!
//          view.settings.filledBorderColor = UIColor(named: "#7a49a5")!
//
//          return view
//      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        view.backgroundColor = UIColor(named: "#DABDAB")
        fotoImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        //reitingView.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneButton.translatesAutoresizingMaskIntoConstraints = false
        locationInMapButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fotoImage)
        view.addSubview(titleLabel)
        view.addSubview(addressLabel)
        //view.addSubview(reitingView)
        view.addSubview(timeLabel)
        view.addSubview(phoneButton)
        phoneButton.addTarget(self, action: #selector(callTapped(_:)), for: .primaryActionTriggered)
        view.addSubview(locationInMapButton)
        view.addSubview(favoriteButton)
        NSLayoutConstraint.activate([
            fotoImage.topAnchor.constraint(equalTo: view.topAnchor),
            fotoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fotoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            fotoImage.heightAnchor.constraint(equalToConstant: view.frame.height / 2),
            titleLabel.topAnchor.constraint(equalTo: fotoImage.bottomAnchor, constant: 25),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addressLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            addressLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
          //  reitingView.topAnchor.constraint(equalTo: fotoImage.bottomAnchor, constant: 30),
           // reitingView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            timeLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 20),
            timeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            phoneButton.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 100),
            phoneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            locationInMapButton.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 100),
            locationInMapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            favoriteButton.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 100),
            favoriteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        fotoImage.image = imageNew
        titleLabel.attributedText = NSAttributedString(string: "  ", attributes: [.font: UIFont.systemFont(ofSize: 30, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        titleLabel.text = titleLabelNew
        addressLabel.attributedText = NSAttributedString(string: "  ", attributes: [.font: UIFont.systemFont(ofSize: 18, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any, ])
        addressLabel.text = addressLabelNew
        timeLabel.attributedText = NSAttributedString(string: "  ", attributes: [.font: UIFont.systemFont(ofSize: 18, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any, ])
        timeLabel.numberOfLines = 3
        timeLabel.text = timeLabelNew
        photoLabel.text = phoneLabelNew
        
       // reitingView = reitingView
        phoneButton.setImage(UIImage(named: "ImagePhone"), for: .normal)
        locationInMapButton.setImage(UIImage(named: "ImageLocation"), for: .normal)
        favoriteButton.setImage(UIImage(named: "ImageFavourite"), for: .normal)
        //saveRating()
       // loadStarRating()
    }
    
//    func loadStarRating() {
//        let loadValue = UserDefaults.standard.object(forKey: "key")
//        reitingView.rating = loadValue as! Double
//        }
//    func saveRating() {
//           reitingView.didFinishTouchingCosmos = { rating in
//               UserDefaults.standard.set(rating, forKey: "key")
//           }
//       }

    @objc func callTapped(_ sender: UIButton) {
        let formattedNumber = phoneLabelNew.components(separatedBy: NSCharacterSet.decimalDigits.inverted).joined(separator: "")

        if let url = NSURL(string: ("tel:" + (formattedNumber))) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url as URL)
            }
        }
}
}
//func loadStarRating() {
//            let loadValue = UserDefaults.standard.object(forKey: "key")
//            reitingView.rating = loadValue as! Double
//            }
//        func update(_ rating: Double, id: Int) {
//            reitingView.rating = rating
//            self.id = id
//
//            reitingView.didFinishTouchingCosmos = { [weak self] rating in
//                print(self?.id as Any)
//                UserDefaults.standard.set(rating, forKey: "key")
//            }
//          }
    //    func update(_ rating: Double, id: Int) {
    //        reitingView.rating = rating
    //        self.id = id
    //
    //        reitingView.didFinishTouchingCosmos = { [weak self] rating in
    //          print(self?.id) // Access property here
    //        }
    //      }
