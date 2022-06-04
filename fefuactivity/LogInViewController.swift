//
//  LogInViewController.swift
//  fefuactivity
//
//  Created by Vladoslav on 20.05.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak var someLabel: UILabel!
    @IBOutlet weak var someButton: UIButton!
    
    private var loginTextField = UITextField()
    private var passwordTextField = UITextField()
    
    private let screenContentHeigh = 600
    private var scrollView = UIScrollView()
    private var myView = UIView()
    
    private let goButton: UIButton = {
        let myButton = UIButton(type: .system)
        myButton.setTitle("Продолжить", for: .normal)
        myButton.setTitleColor(.white, for: .normal)
        myButton.backgroundColor =
        UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        myButton.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.layer.cornerRadius = 10
        return myButton
    }()
    
    private let colorBurnLogo: UIImageView = {
        let colorBurnImageName = "27912 1"
        let colorBurnImage = UIImage(named: colorBurnImageName)
        let colorBurnLogo = UIImageView(image: colorBurnImage!)
        colorBurnLogo.translatesAutoresizingMaskIntoConstraints = false
        return colorBurnLogo
    }()
    
    private let logoBottom: UIImageView = {
        let imageName = "Group 12"
        let image = UIImage(named: imageName)
        let logoBottom = UIImageView(image: image!)
        logoBottom.translatesAutoresizingMaskIntoConstraints = false
        return logoBottom
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Войти"
        
        addSubviews()
        layoutViews()
    }
    
    func addSubviews() {
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        myView = UIView(frame: CGRect(x: 0, y: 0, width: Int(view.frame.size.width), height: screenContentHeigh))
        
        view.addSubview(scrollView)
        
        loginTextField = genTextField(myPlaceholder: "Логин")
        passwordTextField = genTextField(myPlaceholder: "Пароль")
        
        scrollView.addSubview(myView)
        myView.addSubview(loginTextField)
        myView.addSubview(passwordTextField)
        myView.addSubview(goButton)
        myView.addSubview(colorBurnLogo)
        myView.addSubview(logoBottom)
        scrollView.contentSize = CGSize(width: Int(view.frame.size.width), height: screenContentHeigh)
    }
    
    func layoutViews() {
        
        NSLayoutConstraint.activate([
            loginTextField.topAnchor.constraint(equalTo: myView.topAnchor, constant: 16),
            loginTextField.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 16),
            loginTextField.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -16),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -16),
            
            goButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
//            goButton.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 32),
//            goButton.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -32),
            goButton.widthAnchor.constraint(equalToConstant: 311),
            goButton.heightAnchor.constraint(equalToConstant: 50),
            goButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            
            colorBurnLogo.topAnchor.constraint(equalTo: goButton.bottomAnchor, constant: 25),
            colorBurnLogo.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 1),
            colorBurnLogo.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -1),
            
            
//            logoBottom.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 144),
//            logoBottom.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -144),
            logoBottom.topAnchor.constraint(equalTo: colorBurnLogo.bottomAnchor, constant: 23),
            logoBottom.widthAnchor.constraint(equalToConstant: 87),
            logoBottom.heightAnchor.constraint(equalToConstant: 56),
            logoBottom.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
    }
    
    func genTextField(myPlaceholder: String) -> UITextField{
        let myTextField =  UITextField(frame: CGRect(x: 0, y: 0, width: 343, height: 50))
        myTextField.font = UIFont.systemFont(ofSize: 17)
        myTextField.borderStyle = UITextField.BorderStyle.roundedRect
        myTextField.autocorrectionType = UITextAutocorrectionType.no
        myTextField.keyboardType = UIKeyboardType.default
        myTextField.returnKeyType = UIReturnKeyType.done
        myTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        myTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        myTextField.translatesAutoresizingMaskIntoConstraints = false
        myTextField.placeholder = myPlaceholder
        myTextField.backgroundColor = UIColor(red: 0.471, green: 0.471, blue: 0.502, alpha: 0.16)
        return myTextField
    }
    
//    func genButton() -> UIButton{
//        let myButton = UIButton(type: .system)
//        myButton.setTitle("Продолжить", for: .normal)
//        myButton.setTitleColor(.white, for: .normal)
//        myButton.backgroundColor =
//        UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
//        myButton.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
//        myButton.translatesAutoresizingMaskIntoConstraints = false
//        myButton.layer.cornerRadius = 10
//        return myButton
//    }
    
    @objc func pressedButton() {
        print("pressed button GO")
        let vc = storyboard?.instantiateViewController(withIdentifier: "MenuTabBarID")
        vc!.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: true, completion: nil)
    }
    

}
