
import UIKit
import FirebaseAuth

class ViewForSignInAndSignUp: UIView {
    
    let beautyRoomLabel: UILabel! = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.attributedText = NSAttributedString(string: "Beauty Room", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        return view
    }()
    
    let signInView: UIView! = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.isHidden = false
        return view
    }()
    
    let signInForViewButton: UIButton! = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setAttributedTitle(NSAttributedString(string: "Sign In", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any]), for: .normal)
        return view
    }()
    
    let emailForSignInTextField: CustomViewForSignUp! = {
        let view = CustomViewForSignUp()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "#6E5F55") as Any])
        view.textField.autocapitalizationType = .none
        view.textField.autocorrectionType = .no
        return view
    }()
    
    let passwordForSignInTextField: CustomViewForSignUp! = {
        let view = CustomViewForSignUp()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "#6E5F55") as Any])
        view.textField.textContentType = .password
        view.textField.isSecureTextEntry = true
        return view
    }()
    
    let forgotPasswordButton: UIButton! = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setAttributedTitle(NSAttributedString(string: "Forgot password?", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any]), for: .normal)
        return view
    }()
    
    let emailIfForgotPassword: String! = {
        var view = String()
        view = Auth.auth().currentUser?.email ?? ""
        return view
    }()
    
    let signInButton: UIButton! = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setAttributedTitle(NSAttributedString(string: "SIGN IN", attributes: [.font: UIFont.systemFont(ofSize: 30, weight: .medium), .foregroundColor: UIColor(named: "#6E5F55") as Any, .backgroundColor: UIColor(named: "#D5ABDA") as Any]), for: .normal)
        view.backgroundColor = UIColor(named: "#D5ABDA")
        view.layer.cornerRadius = 10
        return view
    }()
    
    let orConnectWithlabel: UILabel! = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.attributedText = NSAttributedString(string: "OR CONNECT WITH", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .light) as Any, .foregroundColor: UIColor(named: "#6E5F55") as Any])
        return view
    }()
    
    let googleButton: UIButton! = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: "ImageForGoogle"), for: .normal)
        return view
    }()
    
    let facebookButton: UIButton! = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: "ImageForFacebook"), for: .normal)
        return view
    }()
    
    let signUpView: UIView! = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.isHidden = true
        return view
    }()
    
    let signUpForViewButton: UIButton! = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setAttributedTitle(NSAttributedString(string: "Sign Up", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any]), for: .normal)
        return view
    }()
    
    let nameForSignUpTextField: CustomViewForSignUp! = {
        let view = CustomViewForSignUp()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "#6E5F55") as Any])
        view.textField.autocorrectionType = .no
        return view
    }()
    
    let emailForSignUpTextField: CustomViewForSignUp! = {
        let view = CustomViewForSignUp()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "#6E5F55") as Any])
        view.textField.autocapitalizationType = .none
        view.textField.autocorrectionType = .no
        return view
    }()
    
    let phoneForSignUpTextField: CustomViewForSignUp! = {
        let view = CustomViewForSignUp()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textField.attributedPlaceholder = NSAttributedString(string: "Phone", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "#6E5F55") as Any])
        view.textField.autocapitalizationType = .none
        view.textField.autocorrectionType = .no
        return view
    }()
    
    let passwordForSignUpTextField: CustomViewForSignUp! = {
        let view = CustomViewForSignUp()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "#6E5F55") as Any])
        view.textField.textContentType = .password
        view.textField.isSecureTextEntry = true
        return view
    }()
    
    let replayPasswordForSignUpTextField: CustomViewForSignUp! = {
        let view = CustomViewForSignUp()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textField.attributedPlaceholder = NSAttributedString(string: "Reply password", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "#6E5F55") as Any])
        view.textField.leftViewMode = .always
        view.textField.textContentType = .password
        view.textField.isSecureTextEntry = true
        return view
    }()
    
    let signUpButton: UIButton! = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setAttributedTitle(NSAttributedString(string: "SIGN UP", attributes: [.font: UIFont.systemFont(ofSize: 30, weight: .medium), .foregroundColor: UIColor(named: "#6E5F55") as Any, .backgroundColor: UIColor(named: "#D5ABDA") as Any]), for: .normal)
        view.backgroundColor = UIColor(named: "#D5ABDA")
        view.layer.cornerRadius = 10
        return view
    }()
    
    let tapGes: UITapGestureRecognizer! = {
        let tapGes = UITapGestureRecognizer()
        return tapGes
    }()
}
