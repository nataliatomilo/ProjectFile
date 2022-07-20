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
    
    let backgroundColorView: UIView! = UIView()
    let beautyRoomLabel: UILabel! = UILabel()
    
    let signInView: UIView! = UIView()
    let signInForViewButton: UIButton! = UIButton()
    let emailForSignInTextField: CustomViewForSignUp! = CustomViewForSignUp()
    let passwordForSignInTextField: CustomViewForSignUp! = CustomViewForSignUp()
    let forgotPasswordButton: UIButton! = UIButton()
    let signInButton: UIButton! = UIButton()
    let orConnectWithlabel: UILabel! = UILabel()
    let googleButton: UIButton! = UIButton()
    let facebookButton: UIButton! = UIButton()
    
    let signUpView: UIView! = UIView()
    let signUpForViewButton: UIButton! = UIButton()
    let nameForSignUpTextField: CustomViewForSignUp! = CustomViewForSignUp()
    let emailForSignUpTextField: CustomViewForSignUp! = CustomViewForSignUp()
    let phoneForSignUpTextField: CustomViewForSignUp! = CustomViewForSignUp()
    let passwordForSignUpTextField: CustomViewForSignUp! = CustomViewForSignUp()
    let replayPasswordForSignUpTextField: CustomViewForSignUp! = CustomViewForSignUp()
    let signUpButton: UIButton! = UIButton()
    let tapGes: UITapGestureRecognizer! = UITapGestureRecognizer()
    
    private let database = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundColorView.translatesAutoresizingMaskIntoConstraints = false
        beautyRoomLabel.translatesAutoresizingMaskIntoConstraints = false
        
        signInForViewButton.translatesAutoresizingMaskIntoConstraints = false
        signInView.translatesAutoresizingMaskIntoConstraints = false
        nameForSignUpTextField.translatesAutoresizingMaskIntoConstraints = false
        emailForSignInTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneForSignUpTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordForSignInTextField.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        orConnectWithlabel.translatesAutoresizingMaskIntoConstraints = false
        googleButton.translatesAutoresizingMaskIntoConstraints = false
        facebookButton.translatesAutoresizingMaskIntoConstraints = false
        
        signUpForViewButton.translatesAutoresizingMaskIntoConstraints = false
        signUpView.translatesAutoresizingMaskIntoConstraints = false
        emailForSignUpTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordForSignUpTextField.translatesAutoresizingMaskIntoConstraints = false
        replayPasswordForSignUpTextField.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(backgroundColorView)
        backgroundColorView.addSubview(beautyRoomLabel)
        
        backgroundColorView.addSubview(signInView)
        backgroundColorView.addSubview(signInForViewButton)
        signInForViewButton.addTarget(self, action: #selector(chooseView(_:)), for: .primaryActionTriggered)
        signInView.addSubview(emailForSignInTextField)
        signInView.addSubview(passwordForSignInTextField)
        signInView.addSubview(forgotPasswordButton)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPassword(_:)), for: .primaryActionTriggered)
        signInView.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(signInWithEmailAndPassword(_:)), for: .primaryActionTriggered)
        signInView.addSubview(orConnectWithlabel)
        signInView.addSubview(googleButton)
        googleButton.addTarget(self, action: #selector(signInWithGoogle(_:)), for: .touchDown)
        signInView.addSubview(facebookButton)
        facebookButton.addTarget(self, action: #selector(signInWithFacebook(_:)), for: .primaryActionTriggered)
        
        backgroundColorView.addSubview(signUpView)
        backgroundColorView.addSubview(signUpForViewButton)
        signUpForViewButton.addTarget(self, action: #selector(chooseView(_:)), for: .primaryActionTriggered)
        signUpView.addSubview(nameForSignUpTextField)
        signUpView.addSubview(emailForSignUpTextField)
        signUpView.addSubview(passwordForSignUpTextField)
        signUpView.addSubview(phoneForSignUpTextField)
        signUpView.addSubview(replayPasswordForSignUpTextField)
        signUpView.addSubview(signUpButton)
        signUpButton.addTarget(self, action: #selector(signUp(_:)), for: .primaryActionTriggered)
        view.addGestureRecognizer(tapGes)
        tapGes.addTarget(self, action: #selector(tapGest(_:)))
        
        NSLayoutConstraint.activate([
            
            backgroundColorView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundColorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundColorView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundColorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            beautyRoomLabel.topAnchor.constraint(equalTo: backgroundColorView.topAnchor, constant: 80),
            beautyRoomLabel.leadingAnchor.constraint(equalTo: backgroundColorView.leadingAnchor, constant: 20),
            beautyRoomLabel.trailingAnchor.constraint(equalTo: backgroundColorView.trailingAnchor, constant: -20),
            signInForViewButton.topAnchor.constraint(equalTo: beautyRoomLabel.bottomAnchor, constant: 40),
            signInForViewButton.leadingAnchor.constraint(equalTo: backgroundColorView.leadingAnchor, constant: 20),
            signUpForViewButton.topAnchor.constraint(equalTo: beautyRoomLabel.bottomAnchor, constant: 40),
            signUpForViewButton.trailingAnchor.constraint(equalTo: backgroundColorView.trailingAnchor, constant: -20),
            signInForViewButton.trailingAnchor.constraint(equalTo: signUpForViewButton.leadingAnchor),
            signInForViewButton.widthAnchor.constraint(equalTo: signUpForViewButton.widthAnchor),
            signInView.topAnchor.constraint(equalTo: signInForViewButton.bottomAnchor),
            signInView.leadingAnchor.constraint(equalTo: backgroundColorView.leadingAnchor),
            signInView.bottomAnchor.constraint(equalTo: backgroundColorView.bottomAnchor),
            signInView.trailingAnchor.constraint(equalTo: backgroundColorView.trailingAnchor),
            signUpView.topAnchor.constraint(equalTo: signUpForViewButton.bottomAnchor),
            signUpView.leadingAnchor.constraint(equalTo: backgroundColorView.leadingAnchor),
            signUpView.bottomAnchor.constraint(equalTo: backgroundColorView.bottomAnchor),
            signUpView.trailingAnchor.constraint(equalTo: backgroundColorView.trailingAnchor),
            
            emailForSignInTextField.topAnchor.constraint(equalTo: signInView.topAnchor, constant: 30),
            emailForSignInTextField.leadingAnchor.constraint(equalTo: signInView.leadingAnchor, constant: 20),
            emailForSignInTextField.trailingAnchor.constraint(equalTo: signInView.trailingAnchor, constant: -20),
            passwordForSignInTextField.topAnchor.constraint(equalTo: emailForSignInTextField.bottomAnchor, constant: 10),
            passwordForSignInTextField.leadingAnchor.constraint(equalTo: signInView.leadingAnchor, constant: 20),
            passwordForSignInTextField.trailingAnchor.constraint(equalTo: signInView.trailingAnchor, constant: -20),
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordForSignInTextField.bottomAnchor, constant: 10),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: signInView.trailingAnchor, constant: -20),
            signInButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 60),
            signInButton.leadingAnchor.constraint(equalTo: signInView.leadingAnchor, constant: 20),
            signInButton.trailingAnchor.constraint(equalTo: signInView.trailingAnchor, constant: -20),
            signInButton.heightAnchor.constraint(equalToConstant: 80),
            orConnectWithlabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 30),
            orConnectWithlabel.centerXAnchor.constraint(equalTo: signInView.centerXAnchor),
            googleButton.topAnchor.constraint(equalTo: orConnectWithlabel.bottomAnchor, constant: 20),
            googleButton.centerXAnchor.constraint(equalTo: signInView.centerXAnchor, constant: -50),
            facebookButton.topAnchor.constraint(equalTo: orConnectWithlabel.bottomAnchor, constant: 20),
            facebookButton.centerXAnchor.constraint(equalTo: signInView.centerXAnchor, constant: 50),
            googleButton.widthAnchor.constraint(equalTo: facebookButton.widthAnchor),
            facebookButton.widthAnchor.constraint(equalToConstant: 50),
            googleButton.heightAnchor.constraint(equalTo: facebookButton.heightAnchor),
            facebookButton.heightAnchor.constraint(equalToConstant: 50),
            
            nameForSignUpTextField.topAnchor.constraint(equalTo: signUpView.topAnchor, constant: 30),
            nameForSignUpTextField.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 20),
            nameForSignUpTextField.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: -20),
            emailForSignUpTextField.topAnchor.constraint(equalTo: nameForSignUpTextField.bottomAnchor, constant: 10),
            emailForSignUpTextField.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 20),
            emailForSignUpTextField.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: -20),
            phoneForSignUpTextField.topAnchor.constraint(equalTo: emailForSignUpTextField.bottomAnchor, constant: 10),
            phoneForSignUpTextField.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 20),
            phoneForSignUpTextField.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: -20),
            passwordForSignUpTextField.topAnchor.constraint(equalTo: phoneForSignUpTextField.bottomAnchor, constant: 10),
            passwordForSignUpTextField.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 20),
            passwordForSignUpTextField.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: -20),
            replayPasswordForSignUpTextField.topAnchor.constraint(equalTo: passwordForSignUpTextField.bottomAnchor, constant: 10),
            replayPasswordForSignUpTextField.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 20),
            replayPasswordForSignUpTextField.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: -20),
            signUpButton.topAnchor.constraint(equalTo: replayPasswordForSignUpTextField.bottomAnchor, constant: 50),
            signUpButton.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 20),
            signUpButton.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: -20),
            signUpButton.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        backgroundColorView.backgroundColor = UIColor(named: "#DABDAB")
        beautyRoomLabel.attributedText = NSAttributedString(string: "Beauty Room", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        signInView.backgroundColor = UIColor(named: "#DABDAB")
        signInView.isHidden = false
        signInForViewButton.setAttributedTitle(NSAttributedString(string: "Sign In", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any]), for: .normal)
        signUpView.backgroundColor = UIColor(named: "#DABDAB")
        signUpView.isHidden = true
        signUpForViewButton.setAttributedTitle(NSAttributedString(string: "Sign Up", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any]), for: .normal)
        
        emailForSignInTextField.textLabel.text = "Email:"
        passwordForSignInTextField.textLabel.text = "Password:"
        forgotPasswordButton.setAttributedTitle(NSAttributedString(string: "Forgot password?", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any]), for: .normal)
        signInButton.setAttributedTitle(NSAttributedString(string: "SIGN IN", attributes: [.font: UIFont.systemFont(ofSize: 30, weight: .medium), .foregroundColor: UIColor(named: "#6E5F55") as Any, .backgroundColor: UIColor(named: "#D5ABDA") as Any]), for: .normal)
        signInButton.backgroundColor = UIColor(named: "#D5ABDA")
        signInButton.layer.cornerRadius = 10
        orConnectWithlabel.attributedText = NSAttributedString(string: "OR CONNECT WITH", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .light) as Any, .foregroundColor: UIColor(named: "#6E5F55") as Any])
        googleButton.setImage(UIImage(named: "ImageForGoogle"), for: .normal)
        facebookButton.setImage(UIImage(named: "ImageForFacebook"), for: .normal)
        
        nameForSignUpTextField.textLabel.text = "Name:"
        emailForSignUpTextField.textLabel.text = "Email:"
        phoneForSignUpTextField.textLabel.text = "Phone:"
        passwordForSignUpTextField.textField.textContentType = .password
        passwordForSignUpTextField.textField.isSecureTextEntry = true
        passwordForSignUpTextField.textLabel.text = "Password:"
        replayPasswordForSignUpTextField.textLabel.text = "Relay password:"
        replayPasswordForSignUpTextField.textField.leftViewMode = .always
        replayPasswordForSignUpTextField.textField.textContentType = .password
        replayPasswordForSignUpTextField.textField.isSecureTextEntry = true
        signUpButton.setAttributedTitle(NSAttributedString(string: "SIGN UP", attributes: [.font: UIFont.systemFont(ofSize: 30, weight: .medium), .foregroundColor: UIColor(named: "#6E5F55") as Any, .backgroundColor: UIColor(named: "#D5ABDA") as Any]), for: .normal)
        signUpButton.backgroundColor = UIColor(named: "#D5ABDA")
        signUpButton.layer.cornerRadius = 10
        ifSignIn()
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
        case signInForViewButton:
            signInView.isHidden = false
            signUpView.isHidden = true
            signInForViewButton.setAttributedTitle(NSAttributedString(string: "Sign In", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any, .underlineStyle: 1]), for: .normal)
            signUpForViewButton.setAttributedTitle(NSAttributedString(string: "Sign Up", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any]), for: .normal)
            
        case signUpForViewButton:
            signUpView.isHidden = false
            signInView.isHidden = true
            signUpForViewButton.setAttributedTitle(NSAttributedString(string: "Sign Up", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any, .underlineStyle: 1]), for: .normal)
            signInForViewButton.setAttributedTitle(NSAttributedString(string: "Sign In", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any]), for: .normal)
        default:
            break
        }
    }
    
    // MARK: SignUp
    
    @objc func signUp(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: emailForSignUpTextField.textField.text!, password: passwordForSignUpTextField.textField.text!) { ( user, error ) in
            if error != nil { return } else {
                let userData = ["firstname": self.nameForSignUpTextField.textField.text! as String,
                                "email": self.emailForSignUpTextField.textField.text! as String,
                                "phone": self.phoneForSignUpTextField.textField.text! as String]
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
        Auth.auth().signIn(withEmail: emailForSignInTextField.textField.text!, password: passwordForSignInTextField.textField.text!) { [weak self] authResult, error in
            if error != nil { return } else {
                let startVC = TabBarViewController()
                self?.navigationController?.pushViewController(startVC, animated: true)
                return
            }
        }
    }
    
    // MARK: Forgot password
    
    @objc func forgotPassword(_ sender: UIButton) {
        Auth.auth().sendPasswordReset(withEmail: emailForSignInTextField.textField.text!) { error in
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
