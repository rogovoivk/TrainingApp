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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Войти"
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))

        view.addSubview(scrollView)
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 600))
        
        scrollView.addSubview(myView)

        let loginTextField = genTextField(myPlaceholder: "Логин")
        let passwordTextField = genTextField(myPlaceholder: "Пароль")
        let goButton = genButton()
        let colorBurnImageName = "27912 1"
        let colorBurnImage = UIImage(named: colorBurnImageName)
        let colorBurnLogo = UIImageView(image: colorBurnImage!)
        colorBurnLogo.translatesAutoresizingMaskIntoConstraints = false
        let imageName = "Group 12"
        let image = UIImage(named: imageName)
        let logoBottom = UIImageView(image: image!)
        logoBottom.translatesAutoresizingMaskIntoConstraints = false
        
        myView.addSubview(loginTextField)
        myView.addSubview(passwordTextField)
        myView.addSubview(goButton)
        myView.addSubview(colorBurnLogo)
        myView.addSubview(logoBottom)
        
        loginTextField.topAnchor.constraint(equalTo: myView.topAnchor, constant: 16).isActive = true
        loginTextField.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 16).isActive = true
        loginTextField.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -16).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 16).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 16).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -16).isActive = true
        
        goButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40).isActive = true
        goButton.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 32).isActive = true
        goButton.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -32).isActive = true
        
        colorBurnLogo.topAnchor.constraint(equalTo: goButton.bottomAnchor, constant: 25).isActive = true
        colorBurnLogo.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 1).isActive = true
        colorBurnLogo.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -1).isActive = true
        
        
        logoBottom.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 144).isActive = true
        logoBottom.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -144).isActive = true
        logoBottom.topAnchor.constraint(equalTo: colorBurnLogo.bottomAnchor, constant: 23).isActive = true
        print(myView.center.x)
        print(logoBottom.center.x)
        
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 600)

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
    
    func genButton() -> UIButton{
        let myButton = UIButton(type: .system)
        myButton.setTitle("Продолжить", for: .normal)
        myButton.setTitleColor(.white, for: .normal)
        myButton.backgroundColor =
        UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        myButton.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.layer.cornerRadius = 10
        return myButton
    }
    
    @objc func pressedButton() {
        print("pressed button GO")
        let vc = storyboard?.instantiateViewController(withIdentifier: "MenuTabBarID")
        vc!.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: true, completion: nil)
    }
    

}
