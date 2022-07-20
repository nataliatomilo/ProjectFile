//
//  CustomViewForProfile.swift
//  BeautyPlace
//
//  Created by Наталья Томило on 16.07.22.
//

import UIKit
import Foundation

class CustomViewForProfile: UIView {
    let viewLabel: UIView = UIView(frame: .zero)
    let textLabel: UILabel = UILabel(frame: .zero)
    let textField: UITextField = UITextField(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpTextField()
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpTextField()
    }
    private func setUpTextField() {
        
        addSubview(viewLabel)
        addSubview(textLabel)
        addSubview(textField)
        textField.delegate = self
        
        viewLabel.backgroundColor = UIColor(named: "#C0A392")
        viewLabel.layer.cornerRadius = 10
        viewLabel.layer.shadowColor = UIColor.black.cgColor
        viewLabel.layer.shadowOpacity = 0.07
        viewLabel.layer.shadowOffset = CGSize(width: 0, height: 10)
        viewLabel.layer.shadowRadius = 10
        
        let tapGesterRecognizer = UITapGestureRecognizer(target: self, action: #selector(textFieldTapped(_:)))
        
        addGestureRecognizer(tapGesterRecognizer)
        
        viewLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewLabel.topAnchor.constraint(equalTo: topAnchor),
            viewLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            textField.leadingAnchor.constraint(equalTo: textLabel.trailingAnchor, constant: 20),
            textField.centerYAnchor.constraint(equalTo: centerYAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            heightAnchor.constraint(equalToConstant: 80)
        ])
        textField.setContentHuggingPriority(.defaultLow - 1, for: .horizontal)
    }
    
    @objc func textFieldTapped(_ sender: UITapGestureRecognizer) {
        textField.becomeFirstResponder()
    }
}

extension CustomViewForProfile: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return false
    }
}
