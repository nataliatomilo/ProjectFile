//
//  StartListViewController.swift
//  BeautyPlace
//
//  Created by Наталья Томило on 2.06.22.
//

import UIKit

class StartListViewController: UIViewController {
    let greetingsLabel: UILabel! = UILabel()
    let findTheServiceLabel: UILabel! = UILabel()
    let magnifuingButton: UIButton! = UIButton()
    let advertisingOnScrollView: UIScrollView! = UIScrollView()
    var scView:UIScrollView!
    let buttonPadding:CGFloat = 10
    var xOffset:CGFloat = 10
    let swipeGestureRecognizer = UISwipeGestureRecognizer()
    let lookingForLabel: UILabel! = UILabel()
    let beauticianButton: UIButton! = UIButton()
    let beauticianLabel: UILabel! = UILabel()
    let depilationButton: UIButton! = UIButton()
    let depilationLabel: UILabel! = UILabel()
    let haircoloringButton: UIButton! = UIButton()
    let haircoloringLabel: UILabel! = UILabel()
    let haircutButton: UIButton! = UIButton()
    let haircutLabel: UILabel! = UILabel()
    let spaButton: UIButton! = UIButton()
    let spaLabel: UILabel! = UILabel()
    let makeUpButton: UIButton! = UIButton()
    let makeUpLabel: UILabel! = UILabel()
    let manicureButton: UIButton! = UIButton()
    let manicureLabel: UILabel! = UILabel()
    let massageButton: UIButton! = UIButton()
    let massageLabel: UILabel! = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greetingsLabel.translatesAutoresizingMaskIntoConstraints = false
        findTheServiceLabel.translatesAutoresizingMaskIntoConstraints = false
        magnifuingButton.translatesAutoresizingMaskIntoConstraints = false
        advertisingOnScrollView.translatesAutoresizingMaskIntoConstraints = false
        swipeGestureRecognizer.view?.translatesAutoresizingMaskIntoConstraints = false
        lookingForLabel.translatesAutoresizingMaskIntoConstraints = false
        depilationButton.translatesAutoresizingMaskIntoConstraints = false
        depilationLabel.translatesAutoresizingMaskIntoConstraints = false
        beauticianButton.translatesAutoresizingMaskIntoConstraints = false
        beauticianLabel.translatesAutoresizingMaskIntoConstraints = false
        haircoloringButton.translatesAutoresizingMaskIntoConstraints = false
        haircoloringLabel.translatesAutoresizingMaskIntoConstraints = false
        haircutButton.translatesAutoresizingMaskIntoConstraints = false
        haircutLabel.translatesAutoresizingMaskIntoConstraints = false
        spaButton.translatesAutoresizingMaskIntoConstraints = false
        spaLabel.translatesAutoresizingMaskIntoConstraints = false
        makeUpButton.translatesAutoresizingMaskIntoConstraints = false
        makeUpLabel.translatesAutoresizingMaskIntoConstraints = false
        manicureButton.translatesAutoresizingMaskIntoConstraints = false
        manicureLabel.translatesAutoresizingMaskIntoConstraints = false
        massageButton.translatesAutoresizingMaskIntoConstraints = false
        massageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(greetingsLabel)
        view.addSubview(findTheServiceLabel)
        view.addSubview(magnifuingButton)
        view.addSubview(advertisingOnScrollView)
        advertisingOnScrollView.addGestureRecognizer(didSwipe(for: .left))
        advertisingOnScrollView.addGestureRecognizer(didSwipe(for: .right))
        view.addSubview(lookingForLabel)
        view.addSubview(depilationButton)
        depilationButton.addTarget(self, action: #selector(goToDepelitionVC(_:)), for: .primaryActionTriggered)
        view.addSubview(depilationLabel)
        view.addSubview(beauticianButton)
        beauticianButton.addTarget(self, action: #selector(goToBeautianVC(_:)), for: .primaryActionTriggered)
        view.addSubview(beauticianLabel)
        view.addSubview(haircoloringButton)
        haircoloringButton.addTarget(self, action: #selector(goToHaircoloringVC(_:)), for: .primaryActionTriggered)
        view.addSubview(haircoloringLabel)
        view.addSubview(haircutLabel)
        view.addSubview(haircutButton)
        haircutButton.addTarget(self, action: #selector(goToHaircutVC(_:)), for: .primaryActionTriggered)
        view.addSubview(spaButton)
        spaButton.addTarget(self, action: #selector(goToSpaVC(_:)), for: .primaryActionTriggered)
        view.addSubview(spaLabel)
        view.addSubview(makeUpButton)
        makeUpButton.addTarget(self, action: #selector(goToMakeUpVC(_:)), for: .primaryActionTriggered)
        view.addSubview(makeUpLabel)
        view.addSubview(manicureButton)
        manicureButton.addTarget(self, action: #selector(goToManicureVC(_:)), for: .primaryActionTriggered)
        view.addSubview(manicureLabel)
        view.addSubview(massageButton)
        massageButton.addTarget(self, action: #selector(goToMassageVC(_:)), for: .primaryActionTriggered)
        view.addSubview(massageLabel)
      
        NSLayoutConstraint.activate([
            greetingsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
            greetingsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            findTheServiceLabel.topAnchor.constraint(equalTo: greetingsLabel.bottomAnchor, constant: 12),
            findTheServiceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            findTheServiceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            magnifuingButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
            magnifuingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            greetingsLabel.trailingAnchor.constraint(equalTo: magnifuingButton.leadingAnchor),
            lookingForLabel.topAnchor.constraint(equalTo: findTheServiceLabel.bottomAnchor, constant: 212),
            lookingForLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            lookingForLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 170),
            beauticianButton.topAnchor.constraint(equalTo: lookingForLabel.bottomAnchor, constant: 25),
            beauticianButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            beauticianLabel.topAnchor.constraint(equalTo: beauticianButton.bottomAnchor),
            beauticianLabel.centerXAnchor.constraint(equalTo: beauticianButton.centerXAnchor),
            depilationButton.topAnchor.constraint(equalTo: lookingForLabel.bottomAnchor, constant: 25),
            depilationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -48),
            depilationLabel.topAnchor.constraint(equalTo: depilationButton.bottomAnchor),
            depilationLabel.centerXAnchor.constraint(equalTo: depilationButton.centerXAnchor),
            haircutButton.topAnchor.constraint(equalTo: lookingForLabel.bottomAnchor, constant: 25),
            haircutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 48),
            haircutLabel.topAnchor.constraint(equalTo: haircutButton.bottomAnchor),
            haircutLabel.centerXAnchor.constraint(equalTo: haircutButton.centerXAnchor),
            haircoloringButton.topAnchor.constraint(equalTo: lookingForLabel.bottomAnchor, constant: 25),
            haircoloringButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            haircoloringLabel.topAnchor.constraint(equalTo: haircoloringButton.bottomAnchor),
            haircoloringLabel.centerXAnchor.constraint(equalTo: haircoloringButton.centerXAnchor),
            beauticianButton.heightAnchor.constraint(equalToConstant: 86),
            beauticianButton.widthAnchor.constraint(equalToConstant: 86),
            depilationButton.heightAnchor.constraint(equalTo: beauticianButton.heightAnchor),
            depilationButton.widthAnchor.constraint(equalTo: beauticianButton.widthAnchor),
            haircutButton.heightAnchor.constraint(equalTo: beauticianButton.heightAnchor),
            haircutButton.widthAnchor.constraint(equalTo: beauticianButton.widthAnchor),
            haircoloringButton.heightAnchor.constraint(equalTo: beauticianButton.heightAnchor),
            haircoloringButton.widthAnchor.constraint(equalTo: beauticianButton.widthAnchor),
            spaButton.topAnchor.constraint(equalTo: beauticianLabel.bottomAnchor, constant: 25),
            spaButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            makeUpButton.topAnchor.constraint(equalTo: depilationLabel.bottomAnchor, constant: 25),
            makeUpButton.centerXAnchor.constraint(equalTo: depilationLabel.centerXAnchor),
            manicureButton.topAnchor.constraint(equalTo: haircutLabel.bottomAnchor, constant: 25),
            manicureButton.centerXAnchor.constraint(equalTo: haircutLabel.centerXAnchor),
            massageButton.topAnchor.constraint(equalTo: haircoloringLabel.bottomAnchor, constant: 25),
            massageButton.centerXAnchor.constraint(equalTo: haircoloringLabel.centerXAnchor),
            spaButton.heightAnchor.constraint(equalTo: beauticianButton.heightAnchor),
            spaButton.widthAnchor.constraint(equalTo: beauticianButton.widthAnchor),
            spaLabel.topAnchor.constraint(equalTo: spaButton.bottomAnchor),
            spaLabel.centerXAnchor.constraint(equalTo: spaButton.centerXAnchor),
            makeUpButton.heightAnchor.constraint(equalTo: beauticianButton.heightAnchor),
            makeUpButton.widthAnchor.constraint(equalTo: beauticianButton.widthAnchor),
            makeUpLabel.topAnchor.constraint(equalTo: makeUpButton.bottomAnchor),
            makeUpLabel.centerXAnchor.constraint(equalTo: makeUpButton.centerXAnchor),
            manicureButton.heightAnchor.constraint(equalTo: beauticianButton.heightAnchor),
            manicureButton.widthAnchor.constraint(equalTo: beauticianButton.widthAnchor),
            manicureLabel.topAnchor.constraint(equalTo: manicureButton.bottomAnchor),
            manicureLabel.centerXAnchor.constraint(equalTo: manicureButton.centerXAnchor),
            massageButton.heightAnchor.constraint(equalTo: beauticianButton.heightAnchor),
            massageButton.widthAnchor.constraint(equalTo: beauticianButton.widthAnchor),
            massageLabel.topAnchor.constraint(equalTo: massageButton.bottomAnchor),
            massageLabel.centerXAnchor.constraint(equalTo: massageButton.centerXAnchor)
        ])
        view.backgroundColor = UIColor(named: "#DABDAB")
        greetingsLabel.attributedText = NSAttributedString(string: "Hello, Name", attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .medium), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        findTheServiceLabel.attributedText = NSAttributedString(string: "Find the sevice you want", attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        magnifuingButton.setImage(UIImage(named: "ImageMagnifuingButton"), for: .normal)
        advertisingOnScrollView.frame = CGRect(x: 0, y: 130, width: view.bounds.width, height: 156)
        advertisingOnScrollView.backgroundColor = UIColor(named: "#DABDAB")
        for i in 0...10 {
            let button = UIButton()
            button.tag = i
            button.backgroundColor = UIColor(named: "#D5ABDA")
            button.layer.cornerRadius = 9
            button.setTitle("Place for advertising \(i) ", for: .normal)
            button.frame = CGRect(x: Int(xOffset), y: Int(CGFloat(buttonPadding)), width: Int(view.bounds.width - 50), height: 135)
            xOffset = xOffset + CGFloat(buttonPadding) + button.frame.size.width
            advertisingOnScrollView.addSubview(button)
        }
        lookingForLabel.attributedText = NSAttributedString(string: "What are you looking for?", attributes: [.font: UIFont.systemFont(ofSize: 19, weight: .semibold), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        depilationButton.layer.cornerRadius = 43
        beauticianButton.layer.cornerRadius = 43
        haircutButton.layer.cornerRadius = 43
        haircoloringButton.layer.cornerRadius = 43
        spaButton.layer.cornerRadius = 43
        makeUpButton.layer.cornerRadius = 43
        manicureButton.layer.cornerRadius = 43
        massageButton.layer.cornerRadius = 43
        depilationButton.setImage(UIImage(named: "ImageDepilation"), for: .normal)
        beauticianButton.setImage(UIImage(named: "ImageBeautician"), for: .normal)
        haircutButton.setImage(UIImage(named: "ImageHaircut"), for: .normal)
        haircoloringButton.setImage(UIImage(named: "ImageHaircoloring"), for: .normal)
        spaButton.setImage(UIImage(named: "ImageSpa"), for: .normal)
        makeUpButton.setImage(UIImage(named: "ImageMakeUp"), for: .normal)
        manicureButton.setImage(UIImage(named: "ImageManicure"), for: .normal)
        massageButton.setImage(UIImage(named: "ImageMassage"), for: .normal)
        depilationButton.backgroundColor = UIColor(named: "#D5ABDA")
        beauticianButton.backgroundColor = UIColor(named: "#D5ABDA")
        haircutButton.backgroundColor = UIColor(named: "#D5ABDA")
        haircoloringButton.backgroundColor = UIColor(named: "#D5ABDA")
        spaButton.backgroundColor = UIColor(named: "#D5ABDA")
        makeUpButton.backgroundColor = UIColor(named: "#D5ABDA")
        manicureButton.backgroundColor = UIColor(named: "#D5ABDA")
        massageButton.backgroundColor = UIColor(named: "#D5ABDA")
        haircoloringLabel.attributedText = NSAttributedString(string: "Haircoloring", attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        haircutLabel.attributedText = NSAttributedString(string: "Haircut", attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        beauticianLabel.attributedText = NSAttributedString(string: "Beautician", attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        depilationLabel.attributedText = NSAttributedString(string: "Depilition", attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        spaLabel.attributedText = NSAttributedString(string: "Spa", attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        makeUpLabel.attributedText = NSAttributedString(string: "MakeUp", attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        manicureLabel.attributedText = NSAttributedString(string: "Manicure", attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        massageLabel.attributedText = NSAttributedString(string: "Massage", attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any])
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    @objc func didSwipe(for direction: UISwipeGestureRecognizer.Direction) -> UISwipeGestureRecognizer {
        let swipe = UISwipeGestureRecognizer (target: self, action: #selector(didSwipeNew(_:)))
        swipe.direction = direction
        return swipe
    }
    @objc func didSwipeNew(_ sender: UISwipeGestureRecognizer) {
        var contentoffSet = advertisingOnScrollView.contentOffset
        switch sender .direction {
        case .left:
            contentoffSet.x += view.bounds.width
            contentoffSet.x = max(0, 130, contentoffSet.x)
        case .right:
            contentoffSet.x -= view.bounds.width
            
        default:
            break
        }
        UIView.animate(withDuration: 0.25) {
            self.advertisingOnScrollView.contentOffset = contentoffSet
        }
    }
    @objc func goToBeautianVC(_ sender: UIButton) {
        let beauticianVC = BeauticianTableViewController()
        navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(beauticianVC, animated: true)
    }
    @objc func goToDepelitionVC(_ sender: UIButton) {
        let depilitionVC = DepilitionTableViewController()
        navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(depilitionVC, animated: true)
    }
    @objc func goToHaircutVC(_ sender: UIButton) {
        let haircutVC = HaircutTableViewController()
        navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(haircutVC, animated: true)
    }
    @objc func goToHaircoloringVC(_ sender: UIButton) {
        let haircoloringVC = HaircoloringTableViewController()
        navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(haircoloringVC, animated: true)
    }
    @objc func goToSpaVC(_ sender: UIButton) {
        let spaVC = SpaTableViewController()
        navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(spaVC, animated: true)
    }
    @objc func goToMakeUpVC(_ sender: UIButton) {
        let makeUpVC = MakeUpTableViewController()
        navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(makeUpVC, animated: true)
    }
    @objc func goToManicureVC(_ sender: UIButton) {
        let manicureVC = ManicureTableViewController()
        navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(manicureVC, animated: true)
    }
    @objc func goToMassageVC(_ sender: UIButton) {
        let massageVC = MassageTableViewController()
        navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(massageVC, animated: true)
    }
}
