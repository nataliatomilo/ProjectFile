//
//  ProfileViewController.swift
//  BeautyPlace
//
//  Created by Наталья Томило on 15.07.22.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    let profileLabel: UILabel! = UILabel()
    let editButton: UIButton! = UIButton()
    let profileImage: UIImageView! = UIImageView()
    let littleView: UIView! = UIView()
    let nameTextField: CustomViewForProfile! = CustomViewForProfile()
    let emailTextField: CustomViewForProfile! = CustomViewForProfile()
    let loginTextField: CustomViewForProfile! = CustomViewForProfile()
    let phoneTextField: CustomViewForProfile! = CustomViewForProfile()
    let signOutButton: UIButton! = UIButton()
    let database = Database.database().reference().child("users")
    var users: [Users] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "#DABDAB")
        
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        editButton.translatesAutoresizingMaskIntoConstraints = false
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        littleView.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(profileLabel)
        view.addSubview(editButton)
        editButton.addTarget(self, action: #selector(editProfile(_:)), for: .primaryActionTriggered)
        view.addSubview(profileImage)
        view.addSubview(littleView)
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(loginTextField)
        view.addSubview(phoneTextField)
        view.addSubview(signOutButton)
        signOutButton.addTarget(self, action: #selector(signOut(_:)), for: .primaryActionTriggered)
        
        NSLayoutConstraint.activate([
            profileLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            profileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            editButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            editButton.leadingAnchor.constraint(equalTo: profileLabel.trailingAnchor, constant: 80),
            profileImage.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 35),
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.heightAnchor.constraint(equalToConstant: 111),
            profileImage.widthAnchor.constraint(equalToConstant: 111),
            littleView.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10),
            littleView.heightAnchor.constraint(equalToConstant: 2),
            littleView.widthAnchor.constraint(equalToConstant: view.frame.width),
            nameTextField.topAnchor.constraint(equalTo: littleView.bottomAnchor, constant: 50),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            phoneTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 10),
            phoneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            phoneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            signOutButton.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 70),
            signOutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        profileLabel.attributedText = NSAttributedString(string: "My Profile", attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .regular) as Any, .foregroundColor: UIColor(named: "#6E5F55") as Any])
        editButton.setAttributedTitle(NSAttributedString(string: "Edit", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .regular), .foregroundColor: UIColor(named: "#6E5F55") as Any, .underlineStyle: 1]), for: .normal)
        profileImage.image = UIImage(named: "ImageForProfile")
        littleView.backgroundColor = UIColor(named: "#6E5F55")
        nameTextField.textField.attributedPlaceholder = NSAttributedString(string: "enter yuor name", attributes: [ .foregroundColor: UIColor(named: "#6E5F55") as Any ])
        nameTextField.textLabel.text = "My name:"
        emailTextField.textField.attributedPlaceholder = NSAttributedString(string: "enter yuor email", attributes: [ .foregroundColor: UIColor(named: "#6E5F55") as Any ])
        emailTextField.textLabel.text = "Email:"
        loginTextField.textField.attributedPlaceholder = NSAttributedString(string: "enter yuor login", attributes: [ .foregroundColor: UIColor(named: "#6E5F55") as Any ])
        loginTextField.textLabel.text = "Login:"
        phoneTextField.textField.attributedPlaceholder = NSAttributedString(string: "enter yuor phone", attributes: [ .foregroundColor: UIColor(named: "#6E5F55") as Any ])
        phoneTextField.textLabel.text = "Phone:"
        signOutButton.setImage(UIImage(named: "ImageSignOutButton"), for: .normal)
        signOutButton.setAttributedTitle(NSAttributedString(string: "  Sign out", attributes: [.foregroundColor: UIColor(named: "#6E5F55") as Any]), for: .normal)
        fillingProfile()
    }
    
    func fillingProfile() {
        database.getData(completion:  { error, snapshot in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            guard let allUsers = snapshot.value as? Dictionary<String, Any> else {
                return
            }
            let users = allUsers.compactMap { k, v -> Users? in
                guard let values = v as? Dictionary<String,String>,
                      let name = values["firstname"],
                      let login = values["email"],
                      let email = values["email"],
                      let phone = values["phone"]
                else {
                    return nil
                }
                if Auth.auth().currentUser?.uid == k {
                    self.nameTextField.textField.text = name
                    self.emailTextField.textField.text = email
                    self.loginTextField.textField.text = login
                    self.phoneTextField.textField.text = phone
                    
                }
                return Users(name: name, login: login, email: email, phone: phone, photo: nil)
            }
            self.users = users
        })
    }
    
    @objc func editProfile(_ sender: UIButton) {
        setEditing(false, animated: true)
    }
    
    @objc func signOut(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        exit(0)
    }
}
