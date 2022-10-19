
import UIKit
import FirebaseAuth
import FirebaseDatabase

class StartListViewController: UIViewController {
    
    let viewForVC = ViewForStartList()
    let data = [Image(image: "image_1"),
                Image(image: "image_2"),
                Image(image: "image_3"),
                Image(image: "image_4")]
    let database = Database.database().reference().child("users")
    var users: [Users] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        viewForVC.collectionView.delegate = self
        viewForVC.collectionView.dataSource = self
        addSubViews()
        addTarget()
        setUpConstraints()
        greetingsWithName()
    }
    
    func addSubViews() {
        view.addSubview(viewForVC.greetingsLabel)
        view.addSubview(viewForVC.findTheServiceLabel)
        view.addSubview(viewForVC.collectionView)
        view.addSubview(viewForVC.lookingForLabel)
        view.addSubview(viewForVC.beauticianButton)
        view.addSubview(viewForVC.beauticianLabel)
        view.addSubview(viewForVC.depilationButton)
        view.addSubview(viewForVC.depilationLabel)
        view.addSubview(viewForVC.haircutButton)
        view.addSubview(viewForVC.haircutLabel)
        view.addSubview(viewForVC.haircoloringButton)
        view.addSubview(viewForVC.haircoloringLabel)
        view.addSubview(viewForVC.spaButton)
        view.addSubview(viewForVC.spaLabel)
        view.addSubview(viewForVC.makeUpButton)
        view.addSubview(viewForVC.makeUpLabel)
        view.addSubview(viewForVC.manicureButton)
        view.addSubview(viewForVC.manicureLabel)
        view.addSubview(viewForVC.massageButton)
        view.addSubview(viewForVC.massageLabel)
    }
    
    func addTarget() {
        viewForVC.depilationButton.addTarget(self, action: #selector(goToDepelitionVC(_:)), for: .primaryActionTriggered)
        viewForVC.beauticianButton.addTarget(self, action: #selector(goToBeautianVC(_:)), for: .primaryActionTriggered)
        viewForVC.haircoloringButton.addTarget(self, action: #selector(goToHaircoloringVC(_:)), for: .primaryActionTriggered)
        viewForVC.haircutButton.addTarget(self, action: #selector(goToHaircutVC(_:)), for: .primaryActionTriggered)
        viewForVC.spaButton.addTarget(self, action: #selector(goToSpaVC(_:)), for: .primaryActionTriggered)
        viewForVC.makeUpButton.addTarget(self, action: #selector(goToMakeUpVC(_:)), for: .primaryActionTriggered)
        viewForVC.manicureButton.addTarget(self, action: #selector(goToManicureVC(_:)), for: .primaryActionTriggered)
        viewForVC.massageButton.addTarget(self, action: #selector(goToMassageVC(_:)), for: .primaryActionTriggered)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            viewForVC.greetingsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
            viewForVC.greetingsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            viewForVC.findTheServiceLabel.topAnchor.constraint(equalTo: viewForVC.greetingsLabel.bottomAnchor, constant: 12),
            viewForVC.findTheServiceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            viewForVC.findTheServiceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            viewForVC.collectionView.topAnchor.constraint(equalTo: viewForVC.findTheServiceLabel.bottomAnchor, constant: 20),
            viewForVC.collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewForVC.collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewForVC.collectionView.heightAnchor.constraint(equalToConstant: 200),
            viewForVC.lookingForLabel.topAnchor.constraint(equalTo: viewForVC.collectionView.bottomAnchor, constant: 20),
            viewForVC.lookingForLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            viewForVC.beauticianButton.topAnchor.constraint(equalTo: viewForVC.lookingForLabel.bottomAnchor, constant: 25),
            viewForVC.beauticianButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            viewForVC.beauticianLabel.topAnchor.constraint(equalTo: viewForVC.beauticianButton.bottomAnchor),
            viewForVC.beauticianLabel.centerXAnchor.constraint(equalTo: viewForVC.beauticianButton.centerXAnchor),
            viewForVC.depilationButton.topAnchor.constraint(equalTo: viewForVC.lookingForLabel.bottomAnchor, constant: 25),
            viewForVC.depilationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -48),
            viewForVC.depilationLabel.topAnchor.constraint(equalTo: viewForVC.depilationButton.bottomAnchor),
            viewForVC.depilationLabel.centerXAnchor.constraint(equalTo: viewForVC.depilationButton.centerXAnchor),
            viewForVC.haircutButton.topAnchor.constraint(equalTo: viewForVC.lookingForLabel.bottomAnchor, constant: 25),
            viewForVC.haircutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 48),
            viewForVC.haircutLabel.topAnchor.constraint(equalTo: viewForVC.haircutButton.bottomAnchor),
            viewForVC.haircutLabel.centerXAnchor.constraint(equalTo: viewForVC.haircutButton.centerXAnchor),
            viewForVC.haircoloringButton.topAnchor.constraint(equalTo: viewForVC.lookingForLabel.bottomAnchor, constant: 25),
            viewForVC.haircoloringButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            viewForVC.haircoloringLabel.topAnchor.constraint(equalTo: viewForVC.haircoloringButton.bottomAnchor),
            viewForVC.haircoloringLabel.centerXAnchor.constraint(equalTo: viewForVC.haircoloringButton.centerXAnchor),
            viewForVC.beauticianButton.heightAnchor.constraint(equalToConstant: 86),
            viewForVC.beauticianButton.widthAnchor.constraint(equalToConstant: 86),
            viewForVC.depilationButton.heightAnchor.constraint(equalTo: viewForVC.beauticianButton.heightAnchor),
            viewForVC.depilationButton.widthAnchor.constraint(equalTo: viewForVC.beauticianButton.widthAnchor),
            viewForVC.haircutButton.heightAnchor.constraint(equalTo: viewForVC.beauticianButton.heightAnchor),
            viewForVC.haircutButton.widthAnchor.constraint(equalTo: viewForVC.beauticianButton.widthAnchor),
            viewForVC.haircoloringButton.heightAnchor.constraint(equalTo: viewForVC.beauticianButton.heightAnchor),
            viewForVC.haircoloringButton.widthAnchor.constraint(equalTo: viewForVC.beauticianButton.widthAnchor),
            viewForVC.spaButton.topAnchor.constraint(equalTo: viewForVC.beauticianLabel.bottomAnchor, constant: 25),
            viewForVC.spaButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            viewForVC.makeUpButton.topAnchor.constraint(equalTo: viewForVC.depilationLabel.bottomAnchor, constant: 25),
            viewForVC.makeUpButton.centerXAnchor.constraint(equalTo: viewForVC.depilationLabel.centerXAnchor),
            viewForVC.manicureButton.topAnchor.constraint(equalTo: viewForVC.haircutLabel.bottomAnchor, constant: 25),
            viewForVC.manicureButton.centerXAnchor.constraint(equalTo: viewForVC.haircutLabel.centerXAnchor),
            viewForVC.massageButton.topAnchor.constraint(equalTo: viewForVC.haircoloringLabel.bottomAnchor, constant: 25),
            viewForVC.massageButton.centerXAnchor.constraint(equalTo: viewForVC.haircoloringLabel.centerXAnchor),
            viewForVC.spaButton.heightAnchor.constraint(equalTo: viewForVC.beauticianButton.heightAnchor),
            viewForVC.spaButton.widthAnchor.constraint(equalTo: viewForVC.beauticianButton.widthAnchor),
            viewForVC.spaLabel.topAnchor.constraint(equalTo: viewForVC.spaButton.bottomAnchor),
            viewForVC.spaLabel.centerXAnchor.constraint(equalTo: viewForVC.spaButton.centerXAnchor),
            viewForVC.makeUpButton.heightAnchor.constraint(equalTo: viewForVC.beauticianButton.heightAnchor),
            viewForVC.makeUpButton.widthAnchor.constraint(equalTo: viewForVC.beauticianButton.widthAnchor),
            viewForVC.makeUpLabel.topAnchor.constraint(equalTo: viewForVC.makeUpButton.bottomAnchor),
            viewForVC.makeUpLabel.centerXAnchor.constraint(equalTo: viewForVC.makeUpButton.centerXAnchor),
            viewForVC.manicureButton.heightAnchor.constraint(equalTo: viewForVC.beauticianButton.heightAnchor),
            viewForVC.manicureButton.widthAnchor.constraint(equalTo: viewForVC.beauticianButton.widthAnchor),
            viewForVC.manicureLabel.topAnchor.constraint(equalTo: viewForVC.manicureButton.bottomAnchor),
            viewForVC.manicureLabel.centerXAnchor.constraint(equalTo: viewForVC.manicureButton.centerXAnchor),
            viewForVC.massageButton.heightAnchor.constraint(equalTo: viewForVC.beauticianButton.heightAnchor),
            viewForVC.massageButton.widthAnchor.constraint(equalTo: viewForVC.beauticianButton.widthAnchor),
            viewForVC.massageLabel.topAnchor.constraint(equalTo: viewForVC.massageButton.bottomAnchor),
            viewForVC.massageLabel.centerXAnchor.constraint(equalTo: viewForVC.massageButton.centerXAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        tabBarController?.tabBar.tintColor = UIColor(named: "#7a49a5")
        tabBarController?.tabBar.backgroundColor = UIColor(named: "#D5ABDA")
        tabBarController?.tabBar.barTintColor = UIColor(named: "#D5ABDA")
        tabBarController?.tabBar.alpha = 0.6
    }
    
    // MARK: Go to another VC
    
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
    
    // MARK: Greetings Label
    
    func greetingsWithName() {
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
                      let name = values["firstname"]
                else {
                    return nil
                }
                if Auth.auth().currentUser?.uid == k {
                    self.viewForVC.greetingsLabel.text = "Hello, \(name)"
                }
                return Users(name: name, login: nil, email: nil, phone: nil, photo: nil)
            }
            self.users = users
        })
    }
}

extension StartListViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 400, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.reuseID, for: indexPath) as! ImageCollectionViewCell
        cell.data = data[indexPath.row]
        return cell
    }
}
