//
//  CellOfTableView.swift
//  BeautyPlace
//
//  Created by Наталья Томило on 20.06.22.
//

import UIKit
import Cosmos

class CellOfTableView: UITableViewCell {
    
    var delegate: CosmosProtocol?
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
    
    let titleLabel: UILabel! = UILabel()
    let iconImageView: UIImageView! = UIImageView()
    let addressLabel: UILabel! = UILabel()
    let emailLabel: UILabel! = UILabel()
    let phoneLabel: UILabel! = UILabel()
    let locationButton: UIButton! = UIButton()
    let favouriteButton: UIButton! = UIButton()
    let phoneButton: UIButton! = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        styleCell()
        delegate?.giveCosmos(cell: self)
        reitingView.didFinishTouchingCosmos = { [self]
            rating in
            delegate?.ratingDidChange(rating: Float(rating))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func styleCell() {
        backgroundColor = UIColor(named: "#C0A392")
        favouriteButton.setImage(UIImage(named: "ImageFavourite"), for: .normal)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        favouriteButton.translatesAutoresizingMaskIntoConstraints = false
        reitingView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(iconImageView)
        contentView.addSubview(addressLabel)
        contentView.addSubview(favouriteButton)
        contentView.addSubview(reitingView)
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            iconImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            iconImageView.widthAnchor.constraint(equalToConstant: 170),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            addressLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            addressLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            addressLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            addressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            favouriteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            favouriteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            reitingView.topAnchor.constraint(equalTo: addressLabel.bottomAnchor),
            reitingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        titleLabel.attributedText = NSAttributedString(string: "  ", attributes: [.font: UIFont.systemFont(ofSize: 25, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        addressLabel.attributedText = NSAttributedString(string: "  ", attributes: [.font: UIFont.systemFont(ofSize: 18, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any, ])
        addressLabel.numberOfLines = 3
    }
}

protocol CosmosProtocol {
    func giveCosmos(cell: CellOfTableView)
    func ratingDidChange(rating: Float)
}
