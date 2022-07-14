//
//  CellOfTableView.swift
//  BeautyPlace
//
//  Created by Наталья Томило on 20.06.22.
//

import UIKit
import Cosmos

class CellOfTableView: UITableViewCell {
  let titleLabel: UILabel! = UILabel()
  let subtitleLabel: UILabel! = UILabel()
  let distanceLabel: UILabel! = UILabel()
  let iconImageView: UIImageView! = UIImageView()
  let cosmosView: CosmosView = {
        var view = CosmosView()
        view.rating = 0
        view.settings.starSize = 15
        view.settings.starMargin = 1
        view.settings.fillMode = .half
        view.settings.filledColor = UIColor(named: "#D5ABDA")!
        view.settings.emptyBorderColor = UIColor(named: "#D5ABDA")!
        view.settings.filledBorderColor = UIColor(named: "#D5ABDA")!
        return view
    }()
    let addressLabel: UILabel! = UILabel()
    let emailLabel: UILabel! = UILabel()
    let phoneLabel: UILabel! = UILabel()
    let locationButton: UIButton! = UIButton()
    let favouriteButton: UIButton! = UIButton()
    let phoneButton: UIButton! = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        styleCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func styleCell() {
        backgroundColor = UIColor(named: "#C0A392")
        locationButton.setImage(UIImage(named: "ImageLocation"), for: .normal)
        favouriteButton.setImage(UIImage(named: "ImageFavourite"), for: .normal)
        phoneButton.setImage(UIImage(named: "ImagePhone"), for: .normal)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        cosmosView.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        favouriteButton.translatesAutoresizingMaskIntoConstraints = false
        phoneButton.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(distanceLabel)
        contentView.addSubview(iconImageView)
        contentView.addSubview(cosmosView)
        contentView.addSubview(addressLabel)
        contentView.addSubview(emailLabel)
        contentView.addSubview(phoneLabel)
        contentView.addSubview(locationButton)
        contentView.addSubview(favouriteButton)
        contentView.addSubview(phoneButton)
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            iconImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            iconImageView.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -10),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -5),
            subtitleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            subtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titleLabel.trailingAnchor.constraint(equalTo: cosmosView.leadingAnchor, constant: -10),
            subtitleLabel.trailingAnchor.constraint(equalTo: cosmosView.leadingAnchor, constant: -10),
            cosmosView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cosmosView.bottomAnchor.constraint(equalTo: addressLabel.topAnchor, constant: -10),
            cosmosView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            addressLabel.topAnchor.constraint(equalTo: cosmosView.bottomAnchor, constant: 10),
            addressLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            addressLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            locationButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            locationButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            favouriteButton.topAnchor.constraint(equalTo: locationButton.bottomAnchor, constant: 2),
            favouriteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            phoneButton.topAnchor.constraint(equalTo: favouriteButton.bottomAnchor, constant: 2),
            phoneButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
            
        ])
        
    }
}

