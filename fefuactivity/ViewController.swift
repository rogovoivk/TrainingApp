//
//  ViewController.swift
//  fefuactivity
//
//  Created by Andrew L on 04.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private let screenContentHeigh = 800
    private var scrollView = UIScrollView()
    private var myView = UIView()
    
    private let logoTop: UIImageView = {
        let imageNameLogoTop = "Group 49"
        let imageLogoTop = UIImage(named: imageNameLogoTop)
        let logoTop = UIImageView(image: imageLogoTop!)
        logoTop.translatesAutoresizingMaskIntoConstraints = false
        return logoTop
    }()
    
    private let logoV: UIImageView = {
        let imageNameV = "LogoSplash"
        let imageLogoV = UIImage(named: imageNameV)
        let logoV = UIImageView(image: imageLogoV!)
        logoV.translatesAutoresizingMaskIntoConstraints = false
        return logoV
    }()
    
    private let logoACTIVITY: UIImageView = {
        let imageNameACTIVITY = "ACTIVITY"
        let imageLogoACTIVITY = UIImage(named: imageNameACTIVITY)
        let logoACTIVITY = UIImageView(image: imageLogoACTIVITY!)
        logoACTIVITY.translatesAutoresizingMaskIntoConstraints = false
        return logoACTIVITY
    }()
    
    private let recTextLabel: UILabel = {
        let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 343, height: 56))
        myLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        myLabel.textAlignment = .center
        myLabel.text = "Пожалуй лучший фитнес трекер в ДВФУ"
        myLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 22)
        myLabel.numberOfLines = 0
        myLabel.lineBreakMode = .byWordWrapping
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.font = UIFont.boldSystemFont(ofSize: 22)
        myLabel.textAlignment = .center
        return myLabel
    }()

    private let regButton: UIButton = {
        let myButton = UIButton(type: .system)
        myButton.setTitle("Зарегистрироваться", for: .normal)
        myButton.setTitleColor(.white, for: .normal)
        myButton.backgroundColor =
        UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        myButton.addTarget(self, action: #selector(PressRegistrationButton), for: .touchUpInside)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.layer.cornerRadius = 10
        return myButton
    }()
    
    private let logInButton: UIButton = {
        let myButton = UIButton(type: .system)
        myButton.setTitle("Уже есть аккаунт?", for: .normal)
        myButton.setTitleColor(UIColor(red: 0, green: 0.478, blue: 1, alpha: 1), for: .normal)
        myButton.backgroundColor = .clear
        myButton.addTarget(self, action: #selector(PressLogInButton), for: .touchUpInside)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.layer.cornerRadius = 10
        return myButton
    }()

    override func viewDidLoad() {
        print("Test start")
        super.viewDidLoad()
        
        addSubviews()
        layoutViews()
    }
    
    func addSubviews() {
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        myView = UIView(frame: CGRect(x: 0, y: 0, width: Int(view.frame.size.width), height: screenContentHeigh))
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(myView)
        myView.addSubview(logoTop)
        myView.addSubview(logoV)
        myView.addSubview(logoACTIVITY)
        myView.addSubview(recTextLabel)
        myView.addSubview(regButton)
        myView.addSubview(logInButton)
        scrollView.contentSize = CGSize(width: Int(view.frame.size.width), height: screenContentHeigh)
    }
    
    func layoutViews() {
        
        NSLayoutConstraint.activate([
            logoTop.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            logoTop.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            logoTop.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            logoTop.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                
            logoV.topAnchor.constraint(equalTo: myView.topAnchor, constant: 266),
            logoV.widthAnchor.constraint(equalToConstant: 60),
            logoV.heightAnchor.constraint(equalToConstant: 70),
            logoV.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            
            logoACTIVITY.topAnchor.constraint(equalTo: logoV.bottomAnchor, constant: 30),
            logoACTIVITY.widthAnchor.constraint(equalToConstant: 110),
            logoACTIVITY.heightAnchor.constraint(equalToConstant: 11),
            logoACTIVITY.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            
            recTextLabel.topAnchor.constraint(equalTo: logoACTIVITY.bottomAnchor, constant: 57),
            recTextLabel.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 16),
            recTextLabel.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -16),
            
            regButton.topAnchor.constraint(equalTo: recTextLabel.bottomAnchor, constant: 132),
            regButton.widthAnchor.constraint(equalToConstant: 311),
            regButton.heightAnchor.constraint(equalToConstant: 50),
            regButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            
            logInButton.topAnchor.constraint(equalTo: regButton.bottomAnchor, constant: 24),
            logInButton.widthAnchor.constraint(equalToConstant: 311),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            
        ])
    }
    
    @objc func PressRegistrationButton() {
        print("press Register")
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterBoardID") as! RegistrationViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

    
    @objc func PressLogInButton() {
        print("Press Log In")
        let vc = storyboard?.instantiateViewController(withIdentifier: "LogInBoardID") as! LogInViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func callMethod() {
        //do stuff here
     }
}


