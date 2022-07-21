//
//  CustomViewController.swift
//  BeautyPlace
//
//  Created by Наталья Томило on 17.07.22.
//

import UIKit
import Cosmos
import CoreLocation
import MapKit

class CustomViewController: UIViewController, MapViewControllerDelegate {
    
    let map = MapViewController()
    let labelForTextField: UILabel! = UILabel()
    let textFieldForComment: UITextField! = UITextField()
    let buttonForTextField: UIButton! = UIButton()
    var imageNew: UIImage!
    var titleLabelNew: String!
    var addressLabelNew: String!
    var timeLabelNew: String!
    var phoneLabelNew: String!
    var locationLabellatitudeNew: Double!
    var locationLabellongitudeNew: Double!
    let photoLabel: UILabel! = UILabel()
    let fotoImage: UIImageView! = UIImageView()
    let titleLabel: UILabel! = UILabel()
    let addressLabel: UILabel! = UILabel()
    let timeLabel: UILabel! = UILabel()
    let phoneButton: UIButton! = UIButton()
    let locationInMapButton: UIButton! = UIButton()
    let favoriteButton: UIButton! = UIButton()
    let saveName = UserDefaults.standard
    var reitingView: CosmosView = {
        var view = CosmosView()
        view.rating = 0
        view.settings.starSize = 15
        view.settings.starMargin = 1
        view.settings.fillMode = .half
        view.settings.filledColor = UIColor(named: "#7a49a5")!
        view.settings.emptyBorderColor = UIColor(named: "#7a49a5")!
        view.settings.filledBorderColor = UIColor(named: "#7a49a5")!
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map.delegate = self
        view.backgroundColor = UIColor(named: "#DABDAB")
        fotoImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        reitingView.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneButton.translatesAutoresizingMaskIntoConstraints = false
        locationInMapButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        textFieldForComment.translatesAutoresizingMaskIntoConstraints = false
        labelForTextField.translatesAutoresizingMaskIntoConstraints = false
        buttonForTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fotoImage)
        view.addSubview(titleLabel)
        view.addSubview(addressLabel)
        view.addSubview(reitingView)
        view.addSubview(timeLabel)
        view.addSubview(phoneButton)
        view.addSubview(textFieldForComment)
        view.addSubview(labelForTextField)
        view.addSubview(buttonForTextField)
        phoneButton.addTarget(self, action: #selector(callTapped(_:)), for: .primaryActionTriggered)
        view.addSubview(locationInMapButton)
        locationInMapButton.addTarget(self, action: #selector(locationTapped(_:)), for: .primaryActionTriggered)
        view.addSubview(favoriteButton)
        buttonForTextField.addTarget(self, action: #selector(save(_:)), for: .primaryActionTriggered)
        NSLayoutConstraint.activate([
            fotoImage.topAnchor.constraint(equalTo: view.topAnchor),
            fotoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fotoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            fotoImage.heightAnchor.constraint(equalToConstant: view.frame.height / 2.5),
            titleLabel.topAnchor.constraint(equalTo: fotoImage.bottomAnchor, constant: 25),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addressLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            addressLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addressLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            reitingView.topAnchor.constraint(equalTo: fotoImage.bottomAnchor, constant: 30),
            reitingView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            timeLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 20),
            timeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            phoneButton.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 100),
            phoneButton.trailingAnchor.constraint(equalTo: locationInMapButton.leadingAnchor, constant: -50),
            locationInMapButton.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 100),
            locationInMapButton.trailingAnchor.constraint(equalTo: favoriteButton.leadingAnchor, constant: -50),
            favoriteButton.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 100),
            favoriteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textFieldForComment.topAnchor.constraint(equalTo: labelForTextField.bottomAnchor),
            labelForTextField.topAnchor.constraint(equalTo: phoneButton.bottomAnchor, constant: 45),
            labelForTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textFieldForComment.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textFieldForComment.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textFieldForComment.heightAnchor.constraint(equalToConstant: 100),
            buttonForTextField.topAnchor.constraint(equalTo: textFieldForComment.bottomAnchor, constant: 20),
            buttonForTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            buttonForTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100)
            
        ])
        fotoImage.image = imageNew
        titleLabel.attributedText = NSAttributedString(string: "  ", attributes: [.font: UIFont.systemFont(ofSize: 35, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        titleLabel.text = titleLabelNew
        addressLabel.attributedText = NSAttributedString(string: "  ", attributes: [.font: UIFont.systemFont(ofSize: 18, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any, ])
        addressLabel.numberOfLines = 2
        addressLabel.text = addressLabelNew
        timeLabel.attributedText = NSAttributedString(string: "  ", attributes: [.font: UIFont.systemFont(ofSize: 15, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any, ])
        timeLabel.numberOfLines = 3
        timeLabel.text = timeLabelNew
        photoLabel.text = phoneLabelNew
        labelForTextField.attributedText = NSAttributedString(string: " Leave feedback... ", attributes: [.font: UIFont.systemFont(ofSize: 15, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any, ])
        textFieldForComment.backgroundColor = .white
        textFieldForComment.attributedPlaceholder = NSAttributedString(string: " ", attributes: [.foregroundColor: UIColor(named: "#6E5F55") as Any])
        textFieldForComment.alpha = 0.3
        textFieldForComment.layer.cornerRadius = 10
        phoneButton.setImage(UIImage(named: "ImagePhone"), for: .normal)
        locationInMapButton.setImage(UIImage(named: "ImageLocation"), for: .normal)
        favoriteButton.setImage(UIImage(named: "ImageFavourite"), for: .normal)
        buttonForTextField.setAttributedTitle(NSAttributedString(string: "save", attributes: [.font: UIFont.systemFont(ofSize: 10, weight: .medium), .foregroundColor: UIColor(named: "#6E5F55") as Any, .backgroundColor: UIColor(named: "#D5ABDA") as Any]), for: .normal)
        buttonForTextField.backgroundColor = UIColor(named: "#D5ABDA")
        buttonForTextField.layer.cornerRadius = 10
        if let text = saveName.string(forKey: "Name") {
                    textFieldForComment.text = text
                }
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
    @objc func locationTapped(_ sender: UIButton) {
        self.navigationController?.pushViewController(map, animated: true)
    }
    @objc func save(_ sender: UIButton) {
        saveName.set(textFieldForComment.text, forKey: "Name")
    }
    
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
    
    func getLat(vc: MapViewController) -> Double {
        locationLabellatitudeNew ?? 0.0
    }

    func getLon(vc: MapViewController) -> Double {
        locationLabellongitudeNew ?? 0.0
    }
}

