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

class SignInAndSignUpViewController: UIViewController {
    let backgroundColorView: UIView! = UIView()
    let beautyRoomLabel: UILabel! = UILabel()
    
    let signInView: UIView! = UIView()
    let signInForViewButton: UIButton! = UIButton()
    let emailForSignInTextField: UITextField! = UITextField()
    let lineUnderEmailTextField: UIView! = UIView()
    let passwordForSignInTextField: UITextField! = UITextField()
    let lineUnderPasswordTextField: UIView! = UIView()
    let forgotPasswordButton: UIButton! = UIButton()
    let signInButton: UIButton! = UIButton()
    let orConnectWithlabel: UILabel! = UILabel()
    let googleButton: UIButton! = UIButton()
    let facebookButton: UIButton! = UIButton()
    
    let signUpView: UIView! = UIView()
    let signUpForViewButton: UIButton! = UIButton()
    let emailForSignUpTextField: UITextField! = UITextField()
    let lineUnderEmailTF: UIView! = UIView()
    let passwordForSignUpTextField: UITextField! = UITextField()
    let lineUnderPasswordTF: UIView! = UIView()
    let replayPasswordForSignUpTextField: UITextField! = UITextField()
    let lineUnderReplayPasswordTF: UITextField! = UITextField()
    let signUpButton: UIButton! = UIButton()
    let tapGes: UITapGestureRecognizer! = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundColorView.translatesAutoresizingMaskIntoConstraints = false
        beautyRoomLabel.translatesAutoresizingMaskIntoConstraints = false
        
        signInForViewButton.translatesAutoresizingMaskIntoConstraints = false
        signInView.translatesAutoresizingMaskIntoConstraints = false
        emailForSignInTextField.translatesAutoresizingMaskIntoConstraints = false
        lineUnderEmailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordForSignInTextField.translatesAutoresizingMaskIntoConstraints = false
        lineUnderPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        orConnectWithlabel.translatesAutoresizingMaskIntoConstraints = false
        googleButton.translatesAutoresizingMaskIntoConstraints = false
        facebookButton.translatesAutoresizingMaskIntoConstraints = false
        
        signUpForViewButton.translatesAutoresizingMaskIntoConstraints = false
        signUpView.translatesAutoresizingMaskIntoConstraints = false
        emailForSignUpTextField.translatesAutoresizingMaskIntoConstraints = false
        lineUnderEmailTF.translatesAutoresizingMaskIntoConstraints = false
        passwordForSignUpTextField.translatesAutoresizingMaskIntoConstraints = false
        lineUnderPasswordTF.translatesAutoresizingMaskIntoConstraints = false
        replayPasswordForSignUpTextField.translatesAutoresizingMaskIntoConstraints = false
        lineUnderReplayPasswordTF.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(backgroundColorView)
        backgroundColorView.addSubview(beautyRoomLabel)
    
        backgroundColorView.addSubview(signInView)
        backgroundColorView.addSubview(signInForViewButton)
        signInForViewButton.addTarget(self, action: #selector(chooseView(_:)), for: .primaryActionTriggered)
        signInView.addSubview(emailForSignInTextField)
        signInView.addSubview(lineUnderEmailTextField)
        signInView.addSubview(passwordForSignInTextField)
        signInView.addSubview(lineUnderPasswordTextField)
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
        signUpView.addSubview(emailForSignUpTextField)
        signUpView.addSubview(lineUnderEmailTF)
        signUpView.addSubview(passwordForSignUpTextField)
        signUpView.addSubview(lineUnderPasswordTF)
        signUpView.addSubview(replayPasswordForSignUpTextField)
        signUpView.addSubview(lineUnderReplayPasswordTF)
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
            lineUnderEmailTextField.topAnchor.constraint(equalTo: emailForSignInTextField.bottomAnchor),
            lineUnderEmailTextField.leadingAnchor.constraint(equalTo: signInView.leadingAnchor, constant: 20),
            lineUnderEmailTextField.trailingAnchor.constraint(equalTo: signInView.trailingAnchor, constant: -20),
            lineUnderEmailTextField.heightAnchor.constraint(equalToConstant: 1),
            passwordForSignInTextField.topAnchor.constraint(equalTo: lineUnderEmailTextField.bottomAnchor, constant: 10),
            passwordForSignInTextField.leadingAnchor.constraint(equalTo: signInView.leadingAnchor, constant: 20),
            passwordForSignInTextField.trailingAnchor.constraint(equalTo: signInView.trailingAnchor, constant: -20),
            lineUnderPasswordTextField.topAnchor.constraint(equalTo: passwordForSignInTextField.bottomAnchor),
            lineUnderPasswordTextField.leadingAnchor.constraint(equalTo: signInView.leadingAnchor, constant: 20),
            lineUnderPasswordTextField.trailingAnchor.constraint(equalTo: signInView.trailingAnchor, constant: -20),
            lineUnderPasswordTextField.heightAnchor.constraint(equalToConstant: 1),
            forgotPasswordButton.topAnchor.constraint(equalTo: lineUnderPasswordTextField.bottomAnchor, constant: 10),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: signInView.trailingAnchor, constant: -20),
            signInButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 60),
            signInButton.leadingAnchor.constraint(equalTo: signInView.leadingAnchor, constant: 20),
            signInButton.trailingAnchor.constraint(equalTo: signInView.trailingAnchor, constant: -20),
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
            
            emailForSignUpTextField.topAnchor.constraint(equalTo: signUpView.topAnchor, constant: 30),
            emailForSignUpTextField.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 20),
            emailForSignUpTextField.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: -20),
            lineUnderEmailTF.topAnchor.constraint(equalTo: emailForSignUpTextField.bottomAnchor),
            lineUnderEmailTF.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 20),
            lineUnderEmailTF.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: -20),
            lineUnderEmailTF.heightAnchor.constraint(equalToConstant: 1),
            passwordForSignUpTextField.topAnchor.constraint(equalTo: lineUnderEmailTF.bottomAnchor, constant: 10),
            passwordForSignUpTextField.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 20),
            passwordForSignUpTextField.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: -20),
            lineUnderPasswordTF.topAnchor.constraint(equalTo: passwordForSignUpTextField.bottomAnchor),
            lineUnderPasswordTF.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 20),
            lineUnderPasswordTF.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: -20),
            lineUnderPasswordTF.heightAnchor.constraint(equalToConstant: 1),
            replayPasswordForSignUpTextField.topAnchor.constraint(equalTo: lineUnderPasswordTF.bottomAnchor, constant: 10),
            replayPasswordForSignUpTextField.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 20),
            replayPasswordForSignUpTextField.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: -20),
            lineUnderReplayPasswordTF.topAnchor.constraint(equalTo: replayPasswordForSignUpTextField.bottomAnchor),
            lineUnderReplayPasswordTF.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 20),
            lineUnderReplayPasswordTF.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: -20),
            lineUnderReplayPasswordTF.heightAnchor.constraint(equalToConstant: 1),
            signUpButton.topAnchor.constraint(equalTo: lineUnderReplayPasswordTF.bottomAnchor, constant: 50),
            signUpButton.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 20),
            signUpButton.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: -20)
        ])
        
        backgroundColorView.backgroundColor = UIColor(named: "#DABDAB")
        beautyRoomLabel.attributedText = NSAttributedString(string: "Beauty Room", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        signInView.backgroundColor = UIColor(named: "#DABDAB")
        signInView.isHidden = true
        signInForViewButton.setAttributedTitle(NSAttributedString(string: "Sign In", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any]), for: .normal)
        signUpView.backgroundColor = UIColor(named: "#DABDAB")
        signUpView.isHidden = true
        signUpForViewButton.setAttributedTitle(NSAttributedString(string: "Sign Up", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any]), for: .normal)
        
        emailForSignInTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [.font: UIFont.systemFont(ofSize: 30, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        emailForSignInTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: emailForSignInTextField.frame.height))
        emailForSignInTextField.leftViewMode = .always
        lineUnderEmailTextField.backgroundColor = UIColor(named: "#C0A392")
        passwordForSignInTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [.font: UIFont.systemFont(ofSize: 30, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        passwordForSignInTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordForSignInTextField.frame.height))
        passwordForSignInTextField.leftViewMode = .always
        passwordForSignInTextField.textContentType = .password
        passwordForSignInTextField.isSecureTextEntry = true
        lineUnderPasswordTextField.backgroundColor = UIColor(named: "#C0A392")
        forgotPasswordButton.setAttributedTitle(NSAttributedString(string: "Forgot password?", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any]), for: .normal)
        signInButton.setAttributedTitle(NSAttributedString(string: "SIGN IN", attributes: [.font: UIFont.systemFont(ofSize: 30, weight: .medium), .foregroundColor: UIColor(named: "#6E5F55") as Any, .backgroundColor: UIColor(named: "#D5ABDA") as Any]), for: .normal)
        signInButton.backgroundColor = UIColor(named: "#D5ABDA")
        signInButton.layer.cornerRadius = 20
        orConnectWithlabel.attributedText = NSAttributedString(string: "OR CONNECT WITH", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .light) as Any, .foregroundColor: UIColor(named: "#6E5F55") as Any])
        googleButton.setImage(UIImage(named: "ImageForGoogle"), for: .normal)
        facebookButton.setImage(UIImage(named: "ImageForFacebook"), for: .normal)
        
        emailForSignUpTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [.font: UIFont.systemFont(ofSize: 30, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        emailForSignUpTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: emailForSignUpTextField.frame.height))
        emailForSignUpTextField.leftViewMode = .always
        lineUnderEmailTF.backgroundColor = UIColor(named: "#C0A392")
        passwordForSignUpTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [.font: UIFont.systemFont(ofSize: 30, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        passwordForSignUpTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordForSignUpTextField.frame.height))
        passwordForSignUpTextField.leftViewMode = .always
        passwordForSignUpTextField.textContentType = .password
        passwordForSignUpTextField.isSecureTextEntry = true
        lineUnderPasswordTF.backgroundColor = UIColor(named: "#C0A392")
        replayPasswordForSignUpTextField.attributedPlaceholder = NSAttributedString(string: "Replay", attributes: [.font: UIFont.systemFont(ofSize: 30, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        replayPasswordForSignUpTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: replayPasswordForSignUpTextField.frame.height))
        replayPasswordForSignUpTextField.leftViewMode = .always
        replayPasswordForSignUpTextField.textContentType = .password
        replayPasswordForSignUpTextField.isSecureTextEntry = true
        lineUnderReplayPasswordTF.backgroundColor = UIColor(named: "#C0A392")
        signUpButton.setAttributedTitle(NSAttributedString(string: "SIGN UP", attributes: [.font: UIFont.systemFont(ofSize: 30, weight: .medium), .foregroundColor: UIColor(named: "#6E5F55") as Any, .backgroundColor: UIColor(named: "#D5ABDA") as Any]), for: .normal)
        signUpButton.backgroundColor = UIColor(named: "#D5ABDA")
        signUpButton.layer.cornerRadius = 20
    }
    
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
    @objc func signUp(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: emailForSignUpTextField.text!, password: passwordForSignUpTextField.text!) { ( user, error ) in
            if error != nil {
                return
            } else {
                let startVC: StartListViewController = StartListViewController()
                startVC.modalPresentationStyle = .overCurrentContext
                self.present(startVC, animated: true, completion: nil)
                return
            }
        }
    }
    @objc func signInWithEmailAndPassword(_ sender:UIButton) {
        Auth.auth().signIn(withEmail: emailForSignInTextField.text!, password: passwordForSignInTextField.text!) { [weak self] authResult, error in
            if error != nil {
                return
            } else {
                let startVC = TabBarViewController()
                self?.navigationController?.pushViewController(startVC, animated: true)
                return
            }
        }
    }
    
    @objc func forgotPassword(_ sender: UIButton) {
        Auth.auth().sendPasswordReset(withEmail: emailForSignInTextField.text!) { error in
            do { let resetFailedAlert = UIAlertController(title: "Reset password", message: "Please, enter your email", preferredStyle: .alert)
                resetFailedAlert.addTextField {(email) in email.placeholder = "Enter email"}
                resetFailedAlert.addAction(UIAlertAction(title: "Sender", style: .default, handler: nil))
                resetFailedAlert.addAction(UIAlertAction(title: "Cansel", style: .default, handler: nil))
                self.present(resetFailedAlert, animated: true, completion: nil)}
        }
    }
    @objc func signInWithGoogle(_ sender: UIButton) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
            if error != nil {
                return
            }
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                return
            }
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if error != nil {
                    print(error?.localizedDescription ?? "")
                }
            }
        }
    }
    @objc func signInWithFacebook(_ sender: UIButton) {
        let fbLoginManager : LoginManager = LoginManager()
        fbLoginManager.logIn(permissions: ["public_profile","email"], from: self) { result, error in
            if let token = AccessToken.current,
               !token.isExpired {
                // User is logged in, do work such as go to next view controller.
            }
        }
    }
    
    @objc func tapGest(_ sender: UITapGestureRecognizer) {
        guard sender.state == .ended else {return}
        view.endEditing(false)
    
    }
}
