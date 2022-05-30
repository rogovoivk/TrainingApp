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

    
    override func viewDidLoad() {
        print("Test start")
        super.viewDidLoad()
        
        let screenContentHeigh = 700
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        view.addSubview(scrollView)
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: Int(view.frame.size.width), height: screenContentHeigh))
        
        scrollView.addSubview(myView)
        
        let imageNameLogoTop = "Group 49"
        let imageLogoTop = UIImage(named: imageNameLogoTop)
        let logoTop = UIImageView(image: imageLogoTop!)
        logoTop.translatesAutoresizingMaskIntoConstraints = false
        let imageNameV = "LogoSplash"
        let imageLogoV = UIImage(named: imageNameV)
        let logoV = UIImageView(image: imageLogoV!)
        logoV.translatesAutoresizingMaskIntoConstraints = false
        let imageNameACTIVITY = "ACTIVITY"
        let imageLogoACTIVITY = UIImage(named: imageNameACTIVITY)
        let logoACTIVITY = UIImageView(image: imageLogoACTIVITY!)
        logoACTIVITY.translatesAutoresizingMaskIntoConstraints = false
        let recTextLabel = genLabel()
        let regButton = genButtonReg()
        let logInButton = genButtonLogIn()
        
        
        
        myView.addSubview(logoTop)
        myView.addSubview(logoV)
        myView.addSubview(logoACTIVITY)
        myView.addSubview(recTextLabel)
        myView.addSubview(regButton)
        myView.addSubview(logInButton)
        
        logoTop.topAnchor.constraint(equalTo: myView.topAnchor, constant: 0).isActive = true
        logoTop.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 0).isActive = true
        logoTop.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: 0).isActive = true
        
        logoV.topAnchor.constraint(equalTo: myView.topAnchor, constant: 266).isActive = true
        logoV.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 160).isActive = true
        logoV.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -160).isActive = true
        
        logoACTIVITY.topAnchor.constraint(equalTo: logoV.bottomAnchor, constant: 30).isActive = true
        logoACTIVITY.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 133).isActive = true
        logoACTIVITY.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -133).isActive = true
        
        recTextLabel.topAnchor.constraint(equalTo: logoACTIVITY.bottomAnchor, constant: 57).isActive = true
        recTextLabel.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 16).isActive = true
        recTextLabel.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -16).isActive = true
        
        regButton.topAnchor.constraint(equalTo: recTextLabel.bottomAnchor, constant: 132).isActive = true
        regButton.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 32).isActive = true
        regButton.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -32).isActive = true
        
        logInButton.topAnchor.constraint(equalTo: regButton.bottomAnchor, constant: 24).isActive = true
        logInButton.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 32).isActive = true
        logInButton.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -32).isActive = true
        
        scrollView.contentSize = CGSize(width: Int(view.frame.size.width), height: screenContentHeigh)
     
    }
    
    func genButtonReg() -> UIButton{
        let myButton = UIButton(type: .system)
        myButton.setTitle("Зарегистрироваться", for: .normal)
        myButton.setTitleColor(.white, for: .normal)
        myButton.backgroundColor =
        UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        myButton.addTarget(self, action: #selector(PressRegistrationButton), for: .touchUpInside)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.layer.cornerRadius = 10
        return myButton
    }
    
    func genButtonLogIn() -> UIButton{
        let myButton = UIButton(type: .system)
        myButton.setTitle("Уже есть аккаунт?", for: .normal)
        myButton.setTitleColor(.white, for: .normal)
        myButton.backgroundColor =
        UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        myButton.addTarget(self, action: #selector(PressLogInButton), for: .touchUpInside)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.layer.cornerRadius = 10
        return myButton
    }
    
    func genLabel() -> UILabel{
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
    }
    
    func genButton() -> UIButton{
        let myButton = UIButton(type: .system)
        myButton.setTitle("Продолжить", for: .normal)
        myButton.setTitleColor(.white, for: .normal)
        myButton.backgroundColor =
        UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        //        let myButton =  UIButton(frame: CGRect(x: 0, y: 0, width: 343, height: 50))
//        myButton.frame = CGRect(x: 200, y: 200, width: 311, height: 50)
        myButton.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.layer.cornerRadius = 10
        return myButton
    }
    
    @objc func pressedButton() {
        print("pressed button GO")
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


