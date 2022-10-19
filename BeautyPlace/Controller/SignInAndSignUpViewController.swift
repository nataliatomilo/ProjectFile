
import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import FBSDKLoginKit
import FirebaseDatabase

class SignInAndSignUpViewController: UIViewController {
    
    let viewForVC = ViewForSignInAndSignUp()
    
    private let database = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        addSubViews()
        addTarget()
        setupConstraints()
        ifSignIn()
    }
    
    func addSubViews() {
        view.addSubview(viewForVC.beautyRoomLabel)
        view.addSubview(viewForVC.signInView)
        view.addSubview(viewForVC.signInForViewButton)
        viewForVC.signInView.addSubview(viewForVC.emailForSignInTextField)
        viewForVC.signInView.addSubview(viewForVC.passwordForSignInTextField)
        viewForVC.signInView.addSubview(viewForVC.forgotPasswordButton)
        viewForVC.signInView.addSubview(viewForVC.signInButton)
        viewForVC.signInView.addSubview(viewForVC.orConnectWithlabel)
        viewForVC.signInView.addSubview(viewForVC.googleButton)
        viewForVC.signInView.addSubview(viewForVC.facebookButton)
        view.addSubview(viewForVC.signUpView)
        view.addSubview(viewForVC.signUpForViewButton)
        viewForVC.signUpView.addSubview(viewForVC.nameForSignUpTextField)
        viewForVC.signUpView.addSubview(viewForVC.emailForSignUpTextField)
        viewForVC.signUpView.addSubview(viewForVC.phoneForSignUpTextField)
        viewForVC.signUpView.addSubview(viewForVC.passwordForSignUpTextField)
        viewForVC.signUpView.addSubview(viewForVC.replayPasswordForSignUpTextField)
        viewForVC.signUpView.addSubview(viewForVC.signUpButton)
        view.addGestureRecognizer(viewForVC.tapGes)
    }
    
    func addTarget() {
        viewForVC.signInForViewButton.addTarget(self, action: #selector(chooseView(_:)), for: .primaryActionTriggered)
        viewForVC.forgotPasswordButton.addTarget(self, action: #selector(forgotPassword(_:)), for: .primaryActionTriggered)
        viewForVC.signInButton.addTarget(self, action: #selector(signInWithEmailAndPassword(_:)), for: .primaryActionTriggered)
        viewForVC.googleButton.addTarget(self, action: #selector(signInWithGoogle(_:)), for: .touchDown)
        viewForVC.facebookButton.addTarget(self, action: #selector(signInWithFacebook(_:)), for: .primaryActionTriggered)
        viewForVC.signUpForViewButton.addTarget(self, action: #selector(chooseView(_:)), for: .primaryActionTriggered)
        viewForVC.signUpButton.addTarget(self, action: #selector(signUp(_:)), for: .primaryActionTriggered)
        viewForVC.tapGes.addTarget(self, action: #selector(tapGest(_:)))
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            viewForVC.beautyRoomLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            viewForVC.beautyRoomLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            viewForVC.beautyRoomLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            viewForVC.signInForViewButton.topAnchor.constraint(equalTo: viewForVC.beautyRoomLabel.bottomAnchor, constant: 40),
            viewForVC.signInForViewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            viewForVC.signUpForViewButton.topAnchor.constraint(equalTo: viewForVC.beautyRoomLabel.bottomAnchor, constant: 40),
            viewForVC.signUpForViewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            viewForVC.signInForViewButton.trailingAnchor.constraint(equalTo: viewForVC.signUpForViewButton.leadingAnchor),
            viewForVC.signInForViewButton.widthAnchor.constraint(equalTo: viewForVC.signUpForViewButton.widthAnchor),
            viewForVC.signInView.topAnchor.constraint(equalTo: viewForVC.signInForViewButton.bottomAnchor),
            viewForVC.signInView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewForVC.signInView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            viewForVC.signInView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewForVC.signUpView.topAnchor.constraint(equalTo: viewForVC.signUpForViewButton.bottomAnchor),
            viewForVC.signUpView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewForVC.signUpView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            viewForVC.signUpView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewForVC.emailForSignInTextField.topAnchor.constraint(equalTo: viewForVC.signInView.topAnchor, constant: 30),
            viewForVC.emailForSignInTextField.leadingAnchor.constraint(equalTo: viewForVC.signInView.leadingAnchor, constant: 20),
            viewForVC.emailForSignInTextField.trailingAnchor.constraint(equalTo: viewForVC.signInView.trailingAnchor, constant: -20),
            viewForVC.passwordForSignInTextField.topAnchor.constraint(equalTo: viewForVC.emailForSignInTextField.bottomAnchor, constant: 10),
            viewForVC.passwordForSignInTextField.leadingAnchor.constraint(equalTo: viewForVC.signInView.leadingAnchor, constant: 20),
            viewForVC.passwordForSignInTextField.trailingAnchor.constraint(equalTo: viewForVC.signInView.trailingAnchor, constant: -20),
            viewForVC.forgotPasswordButton.topAnchor.constraint(equalTo: viewForVC.passwordForSignInTextField.bottomAnchor, constant: 10),
            viewForVC.forgotPasswordButton.trailingAnchor.constraint(equalTo: viewForVC.signInView.trailingAnchor, constant: -20),
            viewForVC.signInButton.topAnchor.constraint(equalTo: viewForVC.forgotPasswordButton.bottomAnchor, constant: 60),
            viewForVC.signInButton.leadingAnchor.constraint(equalTo: viewForVC.signInView.leadingAnchor, constant: 20),
            viewForVC.signInButton.trailingAnchor.constraint(equalTo: viewForVC.signInView.trailingAnchor, constant: -20),
            viewForVC.signInButton.heightAnchor.constraint(equalToConstant: 80),
            viewForVC.orConnectWithlabel.topAnchor.constraint(equalTo: viewForVC.signInButton.bottomAnchor, constant: 30),
            viewForVC.orConnectWithlabel.centerXAnchor.constraint(equalTo: viewForVC.signInView.centerXAnchor),
            viewForVC.googleButton.topAnchor.constraint(equalTo: viewForVC.orConnectWithlabel.bottomAnchor, constant: 20),
            viewForVC.googleButton.centerXAnchor.constraint(equalTo: viewForVC.signInView.centerXAnchor, constant: -50),
            viewForVC.facebookButton.topAnchor.constraint(equalTo: viewForVC.orConnectWithlabel.bottomAnchor, constant: 20),
            viewForVC.facebookButton.centerXAnchor.constraint(equalTo: viewForVC.signInView.centerXAnchor, constant: 50),
            viewForVC.googleButton.widthAnchor.constraint(equalTo: viewForVC.facebookButton.widthAnchor),
            viewForVC.facebookButton.widthAnchor.constraint(equalToConstant: 50),
            viewForVC.googleButton.heightAnchor.constraint(equalTo: viewForVC.facebookButton.heightAnchor),
            viewForVC.facebookButton.heightAnchor.constraint(equalToConstant: 50),
            viewForVC.nameForSignUpTextField.topAnchor.constraint(equalTo: viewForVC.signUpView.topAnchor, constant: 30),
            viewForVC.nameForSignUpTextField.leadingAnchor.constraint(equalTo: viewForVC.signUpView.leadingAnchor, constant: 20),
            viewForVC.nameForSignUpTextField.trailingAnchor.constraint(equalTo: viewForVC.signUpView.trailingAnchor, constant: -20),
            viewForVC.emailForSignUpTextField.topAnchor.constraint(equalTo: viewForVC.nameForSignUpTextField.bottomAnchor, constant: 10),
            viewForVC.emailForSignUpTextField.leadingAnchor.constraint(equalTo: viewForVC.signUpView.leadingAnchor, constant: 20),
            viewForVC.emailForSignUpTextField.trailingAnchor.constraint(equalTo: viewForVC.signUpView.trailingAnchor, constant: -20),
            viewForVC.phoneForSignUpTextField.topAnchor.constraint(equalTo: viewForVC.emailForSignUpTextField.bottomAnchor, constant: 10),
            viewForVC.phoneForSignUpTextField.leadingAnchor.constraint(equalTo: viewForVC.signUpView.leadingAnchor, constant: 20),
            viewForVC.phoneForSignUpTextField.trailingAnchor.constraint(equalTo: viewForVC.signUpView.trailingAnchor, constant: -20),
            viewForVC.passwordForSignUpTextField.topAnchor.constraint(equalTo: viewForVC.phoneForSignUpTextField.bottomAnchor, constant: 10),
            viewForVC.passwordForSignUpTextField.leadingAnchor.constraint(equalTo: viewForVC.signUpView.leadingAnchor, constant: 20),
            viewForVC.passwordForSignUpTextField.trailingAnchor.constraint(equalTo: viewForVC.signUpView.trailingAnchor, constant: -20),
            viewForVC.replayPasswordForSignUpTextField.topAnchor.constraint(equalTo: viewForVC.passwordForSignUpTextField.bottomAnchor, constant: 10),
            viewForVC.replayPasswordForSignUpTextField.leadingAnchor.constraint(equalTo: viewForVC.signUpView.leadingAnchor, constant: 20),
            viewForVC.replayPasswordForSignUpTextField.trailingAnchor.constraint(equalTo: viewForVC.signUpView.trailingAnchor, constant: -20),
            viewForVC.signUpButton.topAnchor.constraint(equalTo: viewForVC.replayPasswordForSignUpTextField.bottomAnchor, constant: 50),
            viewForVC.signUpButton.leadingAnchor.constraint(equalTo: viewForVC.signUpView.leadingAnchor, constant: 20),
            viewForVC.signUpButton.trailingAnchor.constraint(equalTo: viewForVC.signUpView.trailingAnchor, constant: -20),
            viewForVC.signUpButton.heightAnchor.constraint(equalToConstant: 80)
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
        case viewForVC.signInForViewButton:
            viewForVC.signInView.isHidden = false
            viewForVC.signUpView.isHidden = true
            viewForVC.signInForViewButton.setAttributedTitle(NSAttributedString(string: "Sign In", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any,
                                                                                                                .underlineStyle: 1]), for: .normal)
            viewForVC.signUpForViewButton.setAttributedTitle(NSAttributedString(string: "Sign Up", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any]), for: .normal)
            
        case viewForVC.signUpForViewButton:
            viewForVC.signUpView.isHidden = false
            viewForVC.signInView.isHidden = true
            viewForVC.signUpForViewButton.setAttributedTitle(NSAttributedString(string: "Sign Up", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any, .underlineStyle: 1]), for: .normal)
            viewForVC.signInForViewButton.setAttributedTitle(NSAttributedString(string: "Sign In", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any]), for: .normal)
        default:
            break
        }
    }
    
    // MARK: SignUp
    
    @objc func signUp(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: viewForVC.emailForSignUpTextField.textField.text!, password: viewForVC.passwordForSignUpTextField.textField.text!) { [self] ( user, error ) in
            if error != nil { return } else {
                let userData = ["firstname": viewForVC.nameForSignUpTextField.textField.text! as String,
                                "email": viewForVC.emailForSignUpTextField.textField.text! as String,
                                "phone": viewForVC.phoneForSignUpTextField.textField.text! as String]
                guard let uid = user?.user.uid else {return}
                database.child("users").child(uid).setValue(userData)
                let startVC = TabBarViewController()
                navigationController?.pushViewController(startVC, animated: true)
                return
            }
        }
    }
    
    // MARK: SignIn with email and password
    
    @objc func signInWithEmailAndPassword(_ sender:UIButton) {
        Auth.auth().signIn(withEmail: viewForVC.emailForSignInTextField.textField.text!, password: viewForVC.passwordForSignInTextField.textField.text!) { [weak self] authResult, error in
            if error != nil { return } else {
                let startVC = TabBarViewController()
                self?.navigationController?.pushViewController(startVC, animated: true)
                return
            }
        }
    }
    
    // MARK: Forgot password
    
    @objc func forgotPassword(_ sender: UIButton) {
        Auth.auth().languageCode = "en"
        let alert = UIAlertController(title: "Reset password", message: "Please, enter your email", preferredStyle: .alert)
        alert.addTextField {(email) in email.placeholder = "Enter email"}
        alert.addAction(UIAlertAction(title: "SENDER", style: .default, handler: {(UIAlertAction) in
            Auth.auth().sendPasswordReset(withEmail: self.viewForVC.emailIfForgotPassword) { error in }
        }))
        alert.addAction(UIAlertAction(title: "CANSEL", style: .default, handler: nil))
        alert.view.tintColor = UIColor(named: "#6E5F55")
        self.present(alert, animated: true, completion: nil)
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
    
    // MARK: SignIn with Facebook
    
    @objc func signInWithFacebook(_ sender: UIButton) {
        let fbLoginManager : LoginManager = LoginManager()
        fbLoginManager.logIn(permissions: ["public_profile","email"], from: self) { result, error in
            if let token = AccessToken.current,
               !token.isExpired {
                print("123")
                //                let startVC = TabBarViewController()
                //                self.navigationController?.pushViewController(startVC, animated: true)
            }
        }
    }
    
    @objc func tapGest(_ sender: UITapGestureRecognizer) {
        guard sender.state == .ended else {return}
        view.endEditing(false)
    }
}
