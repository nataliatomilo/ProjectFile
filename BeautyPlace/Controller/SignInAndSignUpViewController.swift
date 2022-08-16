//
//  ViewController.swift
//  BeautyPlace
//
//  Created by Наталья Томило on 31.05.22.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import FBSDKLoginKit
import FirebaseDatabase

class SignInAndSignUpViewController: UIViewController {
    
    let viewForController = ViewForSignInAndSignUp()
    
    private let database = Database.database().reference()
    
    let signIn = SignIn()
    let signUp = SignUp()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "#DABDAB")
        
        addSubViews()
        addTarget()
        setupConstraints()
        //ifSignIn()
    }
    
    func addSubViews() {
        view.addSubview(viewForController.beautyRoomLabel)
        view.addSubview(viewForController.signInView)
        view.addSubview(viewForController.signInForViewButton)
        viewForController.signInView.addSubview(viewForController.emailForSignInTextField)
        viewForController.signInView.addSubview(viewForController.passwordForSignInTextField)
        viewForController.signInView.addSubview(viewForController.forgotPasswordButton)
        viewForController.signInView.addSubview(viewForController.signInButton)
        viewForController.signInView.addSubview(viewForController.orConnectWithlabel)
        viewForController.signInView.addSubview(viewForController.googleButton)
        viewForController.signInView.addSubview(viewForController.facebookButton)
        view.addSubview(viewForController.signUpView)
        view.addSubview(viewForController.signUpForViewButton)
        viewForController.signUpView.addSubview(viewForController.nameForSignUpTextField)
        viewForController.signUpView.addSubview(viewForController.emailForSignUpTextField)
        viewForController.signUpView.addSubview(viewForController.phoneForSignUpTextField)
        viewForController.signUpView.addSubview(viewForController.passwordForSignUpTextField)
        viewForController.signUpView.addSubview(viewForController.replayPasswordForSignUpTextField)
        viewForController.signUpView.addSubview(viewForController.signUpButton)
        view.addGestureRecognizer(viewForController.tapGes)
    }
    
    func addTarget() {
        viewForController.signInForViewButton.addTarget(self, action: #selector(chooseView(_:)), for: .primaryActionTriggered)
        viewForController.forgotPasswordButton.addTarget(self, action: #selector(forgotPassword(_:)), for: .primaryActionTriggered)
        viewForController.signInButton.addTarget(self, action: #selector(signInWithEmailAndPassword(_:)), for: .primaryActionTriggered)
        viewForController.googleButton.addTarget(self, action: #selector(signInWithGoogle(_:)), for: .touchDown)
        viewForController.facebookButton.addTarget(self, action: #selector(signInWithFacebook(_:)), for: .primaryActionTriggered)
        viewForController.signUpForViewButton.addTarget(self, action: #selector(chooseView(_:)), for: .primaryActionTriggered)
        viewForController.signUpButton.addTarget(self, action: #selector(signUp(_:)), for: .primaryActionTriggered)
        viewForController.tapGes.addTarget(self, action: #selector(tapGest(_:)))
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            viewForController.beautyRoomLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            viewForController.beautyRoomLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            viewForController.beautyRoomLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            viewForController.signInForViewButton.topAnchor.constraint(equalTo: viewForController.beautyRoomLabel.bottomAnchor, constant: 40),
            viewForController.signInForViewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            viewForController.signUpForViewButton.topAnchor.constraint(equalTo: viewForController.beautyRoomLabel.bottomAnchor, constant: 40),
            viewForController.signUpForViewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            viewForController.signInForViewButton.trailingAnchor.constraint(equalTo: viewForController.signUpForViewButton.leadingAnchor),
            viewForController.signInForViewButton.widthAnchor.constraint(equalTo: viewForController.signUpForViewButton.widthAnchor),
            viewForController.signInView.topAnchor.constraint(equalTo: viewForController.signInForViewButton.bottomAnchor),
            viewForController.signInView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewForController.signInView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            viewForController.signInView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewForController.signUpView.topAnchor.constraint(equalTo: viewForController.signUpForViewButton.bottomAnchor),
            viewForController.signUpView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewForController.signUpView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            viewForController.signUpView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewForController.emailForSignInTextField.topAnchor.constraint(equalTo: viewForController.signInView.topAnchor, constant: 30),
            viewForController.emailForSignInTextField.leadingAnchor.constraint(equalTo: viewForController.signInView.leadingAnchor, constant: 20),
            viewForController.emailForSignInTextField.trailingAnchor.constraint(equalTo: viewForController.signInView.trailingAnchor, constant: -20),
            viewForController.passwordForSignInTextField.topAnchor.constraint(equalTo: viewForController.emailForSignInTextField.bottomAnchor, constant: 10),
            viewForController.passwordForSignInTextField.leadingAnchor.constraint(equalTo: viewForController.signInView.leadingAnchor, constant: 20),
            viewForController.passwordForSignInTextField.trailingAnchor.constraint(equalTo: viewForController.signInView.trailingAnchor, constant: -20),
            viewForController.forgotPasswordButton.topAnchor.constraint(equalTo: viewForController.passwordForSignInTextField.bottomAnchor, constant: 10),
            viewForController.forgotPasswordButton.trailingAnchor.constraint(equalTo: viewForController.signInView.trailingAnchor, constant: -20),
            viewForController.signInButton.topAnchor.constraint(equalTo: viewForController.forgotPasswordButton.bottomAnchor, constant: 60),
            viewForController.signInButton.leadingAnchor.constraint(equalTo: viewForController.signInView.leadingAnchor, constant: 20),
            viewForController.signInButton.trailingAnchor.constraint(equalTo: viewForController.signInView.trailingAnchor, constant: -20),
            viewForController.signInButton.heightAnchor.constraint(equalToConstant: 80),
            viewForController.orConnectWithlabel.topAnchor.constraint(equalTo: viewForController.signInButton.bottomAnchor, constant: 30),
            viewForController.orConnectWithlabel.centerXAnchor.constraint(equalTo: viewForController.signInView.centerXAnchor),
            viewForController.googleButton.topAnchor.constraint(equalTo: viewForController.orConnectWithlabel.bottomAnchor, constant: 20),
            viewForController.googleButton.centerXAnchor.constraint(equalTo: viewForController.signInView.centerXAnchor, constant: -50),
            viewForController.facebookButton.topAnchor.constraint(equalTo: viewForController.orConnectWithlabel.bottomAnchor, constant: 20),
            viewForController.facebookButton.centerXAnchor.constraint(equalTo: viewForController.signInView.centerXAnchor, constant: 50),
            viewForController.googleButton.widthAnchor.constraint(equalTo: viewForController.facebookButton.widthAnchor),
            viewForController.facebookButton.widthAnchor.constraint(equalToConstant: 50),
            viewForController.googleButton.heightAnchor.constraint(equalTo: viewForController.facebookButton.heightAnchor),
            viewForController.facebookButton.heightAnchor.constraint(equalToConstant: 50),
            viewForController.nameForSignUpTextField.topAnchor.constraint(equalTo: viewForController.signUpView.topAnchor, constant: 30),
            viewForController.nameForSignUpTextField.leadingAnchor.constraint(equalTo: viewForController.signUpView.leadingAnchor, constant: 20),
            viewForController.nameForSignUpTextField.trailingAnchor.constraint(equalTo: viewForController.signUpView.trailingAnchor, constant: -20),
            viewForController.emailForSignUpTextField.topAnchor.constraint(equalTo: viewForController.nameForSignUpTextField.bottomAnchor, constant: 10),
            viewForController.emailForSignUpTextField.leadingAnchor.constraint(equalTo: viewForController.signUpView.leadingAnchor, constant: 20),
            viewForController.emailForSignUpTextField.trailingAnchor.constraint(equalTo: viewForController.signUpView.trailingAnchor, constant: -20),
            viewForController.phoneForSignUpTextField.topAnchor.constraint(equalTo: viewForController.emailForSignUpTextField.bottomAnchor, constant: 10),
            viewForController.phoneForSignUpTextField.leadingAnchor.constraint(equalTo: viewForController.signUpView.leadingAnchor, constant: 20),
            viewForController.phoneForSignUpTextField.trailingAnchor.constraint(equalTo: viewForController.signUpView.trailingAnchor, constant: -20),
            viewForController.passwordForSignUpTextField.topAnchor.constraint(equalTo: viewForController.phoneForSignUpTextField.bottomAnchor, constant: 10),
            viewForController.passwordForSignUpTextField.leadingAnchor.constraint(equalTo: viewForController.signUpView.leadingAnchor, constant: 20),
            viewForController.passwordForSignUpTextField.trailingAnchor.constraint(equalTo: viewForController.signUpView.trailingAnchor, constant: -20),
            viewForController.replayPasswordForSignUpTextField.topAnchor.constraint(equalTo: viewForController.passwordForSignUpTextField.bottomAnchor, constant: 10),
            viewForController.replayPasswordForSignUpTextField.leadingAnchor.constraint(equalTo: viewForController.signUpView.leadingAnchor, constant: 20),
            viewForController.replayPasswordForSignUpTextField.trailingAnchor.constraint(equalTo: viewForController.signUpView.trailingAnchor, constant: -20),
            viewForController.signUpButton.topAnchor.constraint(equalTo: viewForController.replayPasswordForSignUpTextField.bottomAnchor, constant: 50),
            viewForController.signUpButton.leadingAnchor.constraint(equalTo: viewForController.signUpView.leadingAnchor, constant: 20),
            viewForController.signUpButton.trailingAnchor.constraint(equalTo: viewForController.signUpView.trailingAnchor, constant: -20),
            viewForController.signUpButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    // MARK: Change VC if currentUser !=nil
    
    func ifSignIn() {
        if Auth.auth().currentUser != nil {
            let startVC = TabBarViewController()
            self.navigationController?.pushViewController(startVC, animated: true)
            return
        }
    }
    
    //MARK: Change signIn/signUp view
    
    @objc func chooseView(_ sender: UIButton) {
        switch sender {
        case viewForController.signInForViewButton:
            viewForController.signInView.isHidden = false
            viewForController.signUpView.isHidden = true
            viewForController.signInForViewButton.setAttributedTitle(NSAttributedString(string: "Sign In", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any, .underlineStyle: 1]), for: .normal)
            viewForController.signUpForViewButton.setAttributedTitle(NSAttributedString(string: "Sign Up", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any]), for: .normal)
            
        case viewForController.signUpForViewButton:
            viewForController.signUpView.isHidden = false
            viewForController.signInView.isHidden = true
            viewForController.signUpForViewButton.setAttributedTitle(NSAttributedString(string: "Sign Up", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any, .underlineStyle: 1]), for: .normal)
            viewForController.signInForViewButton.setAttributedTitle(NSAttributedString(string: "Sign In", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any]), for: .normal)
        default:
            break
        }
    }
    
    // MARK: SignUp
    
    @objc func signUp(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: viewForController.emailForSignUpTextField.textField.text!, password: viewForController.passwordForSignUpTextField.textField.text!) { ( user, error ) in
            if error != nil { return } else {
                let userData = ["firstname": self.viewForController.nameForSignUpTextField.textField.text! as String,
                                "email": self.viewForController.emailForSignUpTextField.textField.text! as String,
                                "phone": self.viewForController.phoneForSignUpTextField.textField.text! as String]
                guard let uid = user?.user.uid else {return}
                self.database.child("users").child(uid).setValue(userData)
                let startVC = TabBarViewController()
                self.navigationController?.pushViewController(startVC, animated: true)
                return
            }
        }
    }
    
    // MARK: SignIn with email and password
    
    @objc func signInWithEmailAndPassword(_ sender:UIButton) {
        Auth.auth().signIn(withEmail: viewForController.emailForSignInTextField.textField.text!, password: viewForController.passwordForSignInTextField.textField.text!) { [weak self] authResult, error in
            if error != nil { return } else {
                let startVC = TabBarViewController()
                self?.navigationController?.pushViewController(startVC, animated: true)
                return
            }
        }
    }
    
    // MARK: Forgot password
    
    @objc func forgotPassword(_ sender: UIButton) {
        Auth.auth().sendPasswordReset(withEmail: viewForController.emailForSignInTextField.textField.text!) { error in
            do { let resetFailedAlert = UIAlertController(title: "Reset password", message: "Please, enter your email", preferredStyle: .alert)
                resetFailedAlert.addTextField {(email) in email.placeholder = "Enter email"}
                resetFailedAlert.addAction(UIAlertAction(title: "SENDER", style: .default, handler: nil))
                resetFailedAlert.addAction(UIAlertAction(title: "CANSEL", style: .default, handler: nil))
                self.present(resetFailedAlert, animated: true, completion: nil)}
        }
    }
    
    // MARK: SignIn with Google
    
    @objc func signInWithGoogle(_ sender: UIButton) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
            if error != nil { return }
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else { return }
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            Auth.auth().signIn(with: credential) { authResult, error in
                if error != nil {
                    print(error?.localizedDescription ?? "")
                } else {
                    let startVC = TabBarViewController()
                    self.navigationController?.pushViewController(startVC, animated: true)
                    return
                }
            }
        }
    }
    
    // MARK: SignIn with Facabook
    
    @objc func signInWithFacebook(_ sender: UIButton) {
        let fbLoginManager : LoginManager = LoginManager()
        fbLoginManager.logIn(permissions: ["public_profile","email"], from: self) { result, error in
            if let token = AccessToken.current,
               !token.isExpired {
                let startVC = TabBarViewController()
                self.navigationController?.pushViewController(startVC, animated: true)
            }
        }
    }
    
    @objc func tapGest(_ sender: UITapGestureRecognizer) {
        guard sender.state == .ended else {return}
        view.endEditing(false)
    }
}
