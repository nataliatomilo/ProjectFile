//
//  ViewForSignInAndSignUp.swift
//  BeautyPlace
//
//  Created by Наталья Томило on 7.08.22.
//

import UIKit

class ViewForSignInAndSignUp: UIView {
    
    let beautyRoomLabel: UILabel! = {
        let beautyRoomLabel = UILabel()
        beautyRoomLabel.translatesAutoresizingMaskIntoConstraints = false
        beautyRoomLabel.attributedText = NSAttributedString(string: "Beauty Room", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        
        return beautyRoomLabel
    }()
    
    let signInView: UIView! = {
        let signInView = UIView()
        signInView.translatesAutoresizingMaskIntoConstraints = false
        signInView.backgroundColor = UIColor(named: "#DABDAB")
        signInView.isHidden = false
        
        return signInView
    }()
    
    let signInForViewButton: UIButton! = {
        let signInForViewButton = UIButton()
        signInForViewButton.translatesAutoresizingMaskIntoConstraints = false
        signInForViewButton.setAttributedTitle(NSAttributedString(string: "Sign In", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any]), for: .normal)
        
        return signInForViewButton
    }()
    
    let emailForSignInTextField: CustomViewForSignUp! = {
        let emailForSignInTextField = CustomViewForSignUp()
        emailForSignInTextField.translatesAutoresizingMaskIntoConstraints = false
        emailForSignInTextField.textLabel.text = "Email:"
        
        return emailForSignInTextField
    }()
    
    let passwordForSignInTextField: CustomViewForSignUp! = {
        let passwordForSignInTextField = CustomViewForSignUp()
        passwordForSignInTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordForSignInTextField.textLabel.text = "Password:"
        
        return passwordForSignInTextField
    }()
    
    let forgotPasswordButton: UIButton! = {
        let forgotPasswordButton = UIButton()
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.setAttributedTitle(NSAttributedString(string: "Forgot password?", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any]), for: .normal)
        
        return forgotPasswordButton
    }()
    
    let signInButton: UIButton! = {
        let signInButton = UIButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setAttributedTitle(NSAttributedString(string: "SIGN IN", attributes: [.font: UIFont.systemFont(ofSize: 30, weight: .medium), .foregroundColor: UIColor(named: "#6E5F55") as Any, .backgroundColor: UIColor(named: "#D5ABDA") as Any]), for: .normal)
        signInButton.backgroundColor = UIColor(named: "#D5ABDA")
        signInButton.layer.cornerRadius = 10
        
        return signInButton
    }()
    
    let orConnectWithlabel: UILabel! = {
        let orConnectWithlabel = UILabel()
        orConnectWithlabel.translatesAutoresizingMaskIntoConstraints = false
        orConnectWithlabel.attributedText = NSAttributedString(string: "OR CONNECT WITH", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .light) as Any, .foregroundColor: UIColor(named: "#6E5F55") as Any])
        
        return orConnectWithlabel
    }()
    
    let googleButton: UIButton! = {
        let googleButton = UIButton()
        googleButton.translatesAutoresizingMaskIntoConstraints = false
        googleButton.setImage(UIImage(named: "ImageForGoogle"), for: .normal)
        
        return googleButton
    }()
    
    let facebookButton: UIButton! = {
        let facebookButton = UIButton()
        facebookButton.translatesAutoresizingMaskIntoConstraints = false
        facebookButton.setImage(UIImage(named: "ImageForFacebook"), for: .normal)
        
        return facebookButton
    }()
    
    let signUpView: UIView! = {
        let signUpView = UIView()
        signUpView.translatesAutoresizingMaskIntoConstraints = false
        signUpView.backgroundColor = UIColor(named: "#DABDAB")
        signUpView.isHidden = true
        
        return signUpView
    }()
    
    let signUpForViewButton: UIButton! = {
        let signUpForViewButton = UIButton()
        signUpForViewButton.translatesAutoresizingMaskIntoConstraints = false
        signUpForViewButton.setAttributedTitle(NSAttributedString(string: "Sign Up", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .ultraLight), .foregroundColor: UIColor(named: "#6E5F55") as Any]), for: .normal)
        
        return signUpForViewButton
    }()
    
    let nameForSignUpTextField: CustomViewForSignUp! = {
        let nameForSignUpTextField = CustomViewForSignUp()
        nameForSignUpTextField.translatesAutoresizingMaskIntoConstraints = false
        nameForSignUpTextField.textLabel.text = "Name:"
        
        return nameForSignUpTextField
    }()
    
    let emailForSignUpTextField: CustomViewForSignUp! = {
        let emailForSignUpTextField = CustomViewForSignUp()
        emailForSignUpTextField.translatesAutoresizingMaskIntoConstraints = false
        emailForSignUpTextField.textLabel.text = "Email:"
        
        return emailForSignUpTextField
    }()
    
    let phoneForSignUpTextField: CustomViewForSignUp! = {
        let phoneForSignUpTextField = CustomViewForSignUp()
        phoneForSignUpTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneForSignUpTextField.textLabel.text = "Phone:"
        
        return phoneForSignUpTextField
    }()
    
    let passwordForSignUpTextField: CustomViewForSignUp! = {
        let passwordForSignUpTextField = CustomViewForSignUp()
        passwordForSignUpTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordForSignUpTextField.textField.textContentType = .password
        passwordForSignUpTextField.textField.isSecureTextEntry = true
        passwordForSignUpTextField.textLabel.text = "Password:"
        
        return passwordForSignUpTextField
    }()
    
    let replayPasswordForSignUpTextField: CustomViewForSignUp! = {
        let replayPasswordForSignUpTextField = CustomViewForSignUp()
        replayPasswordForSignUpTextField.translatesAutoresizingMaskIntoConstraints = false
        replayPasswordForSignUpTextField.textLabel.text = "Relay password:"
        replayPasswordForSignUpTextField.textField.leftViewMode = .always
        replayPasswordForSignUpTextField.textField.textContentType = .password
        replayPasswordForSignUpTextField.textField.isSecureTextEntry = true
        
        return replayPasswordForSignUpTextField
    }()
    
    let signUpButton: UIButton! = {
        let signUpButton = UIButton()
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setAttributedTitle(NSAttributedString(string: "SIGN UP", attributes: [.font: UIFont.systemFont(ofSize: 30, weight: .medium), .foregroundColor: UIColor(named: "#6E5F55") as Any, .backgroundColor: UIColor(named: "#D5ABDA") as Any]), for: .normal)
        signUpButton.backgroundColor = UIColor(named: "#D5ABDA")
        signUpButton.layer.cornerRadius = 10
        
        return signUpButton
    }()
    
    let tapGes: UITapGestureRecognizer! = {
        let tapGes = UITapGestureRecognizer()
        
        return tapGes
    }()
    
}
