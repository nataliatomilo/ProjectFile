
import Foundation
import UIKit

class ViewForStartList: UIView {
    
    let greetingsLabel: UILabel! = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.attributedText = NSAttributedString(string: " ", attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .medium), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        return view
    }()
    
    let findTheServiceLabel: UILabel! = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.attributedText = NSAttributedString(string: "Find the sevice you want", attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        return view
    }()
    
    var collectionView: UICollectionView = {
        let layuot = UICollectionViewFlowLayout()
        layuot.scrollDirection = .horizontal
        layuot.minimumLineSpacing = 52
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layuot)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.reuseID)
        cv.backgroundColor = UIColor.clear.withAlphaComponent(0)
        cv.contentInset = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
        cv.showsHorizontalScrollIndicator = false
        cv.isPagingEnabled = true
        return cv
    }()
    
    let lookingForLabel: UILabel! = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.attributedText = NSAttributedString(string: "What are you looking for?", attributes: [.font: UIFont.systemFont(ofSize: 19, weight: .semibold), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        return view
    }()
    
    let beauticianButton: UIButton! = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 43
        view.setImage(UIImage(named: "ImageBeautician"), for: .normal)
        view.backgroundColor = UIColor(named: "#D5ABDA")
        view.alpha = 0.6
        return view
    }()
    
    let beauticianLabel: UILabel! = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.attributedText = NSAttributedString(string: "Beautician", attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        return view
    }()
    
    let depilationButton: UIButton! = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 43
        view.setImage(UIImage(named: "ImageDepilation"), for: .normal)
        view.backgroundColor = UIColor(named: "#D5ABDA")
        view.alpha = 0.6
        return view
    }()
    
    let depilationLabel: UILabel! = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.attributedText = NSAttributedString(string: "Depilition", attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        return view
    }()
    
    let haircoloringButton: UIButton! = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 43
        view.setImage(UIImage(named: "ImageHaircoloring"), for: .normal)
        view.backgroundColor = UIColor(named: "#D5ABDA")
        view.alpha = 0.6
        return view
    }()
    
    let haircoloringLabel: UILabel! = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.attributedText = NSAttributedString(string: "Haircoloring", attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        return view
    }()
    
    let haircutButton: UIButton! = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 43
        view.setImage(UIImage(named: "ImageHaircut"), for: .normal)
        view.backgroundColor = UIColor(named: "#D5ABDA")
        view.alpha = 0.6
        return view
    }()
    
    let haircutLabel: UILabel! = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.attributedText = NSAttributedString(string: "Haircut", attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        return view
    }()
    
    let spaButton: UIButton! = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 43
        view.setImage(UIImage(named: "ImageSpa"), for: .normal)
        view.backgroundColor = UIColor(named: "#D5ABDA")
        view.alpha = 0.6
        return view
    }()
    
    let spaLabel: UILabel! = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.attributedText = NSAttributedString(string: "Spa", attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        return view
    }()
    
    let makeUpButton: UIButton! = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 43
        view.setImage(UIImage(named: "ImageMakeUp"), for: .normal)
        view.backgroundColor = UIColor(named: "#D5ABDA")
        view.alpha = 0.6
        return view
    }()
    
    let makeUpLabel: UILabel! = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.attributedText = NSAttributedString(string: "MakeUp", attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        return view
    }()
    
    let manicureButton: UIButton! = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 43
        view.setImage(UIImage(named: "ImageManicure"), for: .normal)
        view.backgroundColor = UIColor(named: "#D5ABDA")
        view.alpha = 0.6
        return view
    }()
    
    let manicureLabel: UILabel! = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.attributedText = NSAttributedString(string: "Manicure", attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        return view
    }()
    
    let massageButton: UIButton! = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 43
        view.setImage(UIImage(named: "ImageMassage"), for: .normal)
        view.backgroundColor = UIColor(named: "#D5ABDA")
        view.alpha = 0.6
        return view
    }()
    
    let massageLabel: UILabel! = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.attributedText = NSAttributedString(string: "Massage", attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .light), .foregroundColor: UIColor(named: "#6E5F55") as Any])
        return view
    }()
}
