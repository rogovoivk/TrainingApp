//
//  RegistrationViewController.swift
//  fefuactivity
//
//  Created by Vladoslav on 07.05.2022.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    
    @IBOutlet weak var someLabel: UILabel!
    @IBOutlet weak var someButton: UIButton!
//    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Регистрация"
        
        let screenContentHeigh = 700
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        view.addSubview(scrollView)
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: Int(view.frame.size.width), height: screenContentHeigh))
        
        scrollView.addSubview(myView)
        
        

        let loginTextField = genTextField(myPlaceholder: "Логин")
        let nikenameTextField = genTextField(myPlaceholder: "Имя или никнейм")
        let passwordTextField = genTextField(myPlaceholder: "пароль")
        let secondPasswordTextField = genTextField(myPlaceholder: "повторите пароль")
        let genderTextView = genTextField(myPlaceholder: " ")
        genderTextView.text = "Пол"
        genderTextView.isUserInteractionEnabled = false
        genderTextView.backgroundColor = UIColor.white
        genderTextView.borderStyle = UITextField.BorderStyle.none
        let genderSC = genSC()
        let goButton = genButton()
        let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
//            label.center = CGPoint(x: 160, y: 285)
        myLabel.textAlignment = .center
        myLabel.text = "Нажимая на кнопку, вы соглашаетесь с политикой конфиденциальности и обработки персональных данных, а также принимаете пользовательское соглашение"
        myLabel.font = UIFont(name: "SFProText-Regular", size: 15)
        myLabel.numberOfLines = 0
        myLabel.lineBreakMode = .byWordWrapping
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)

        let imageName = "Group 12"
        let image = UIImage(named: imageName)
        let logoBottom = UIImageView(image: image!)
        logoBottom.translatesAutoresizingMaskIntoConstraints = false
        
        let testTextField = genTextField(myPlaceholder: "test")
        testTextField.backgroundColor = .red
        
        
        myView.addSubview(loginTextField)
        myView.addSubview(nikenameTextField)
        myView.addSubview(passwordTextField)
        myView.addSubview(secondPasswordTextField)
        myView.addSubview(genderTextView)
        myView.addSubview(genderSC)
        myView.addSubview(goButton)
        myView.addSubview(myLabel)
        myView.addSubview(logoBottom)
        
        loginTextField.topAnchor.constraint(equalTo: myView.topAnchor, constant: 16).isActive = true
        loginTextField.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 16).isActive = true
        loginTextField.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -16).isActive = true

        nikenameTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 16).isActive = true
        nikenameTextField.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 16).isActive = true
        nikenameTextField.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -16).isActive = true

        passwordTextField.topAnchor.constraint(equalTo: nikenameTextField.bottomAnchor, constant: 16).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 16).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -16).isActive = true

        secondPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16).isActive = true
        secondPasswordTextField.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 16).isActive = true
        secondPasswordTextField.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -16).isActive = true

        genderTextView.topAnchor.constraint(equalTo: secondPasswordTextField.layoutMarginsGuide.bottomAnchor, constant: 35).isActive = true
        genderSC.topAnchor.constraint(equalTo: genderTextView.topAnchor, constant: 0).isActive = true
        genderTextView.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 31).isActive = true
        genderSC.leadingAnchor.constraint(equalTo: genderTextView.trailingAnchor, constant: 150).isActive = true
        genderSC.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -51).isActive = true

        goButton.topAnchor.constraint(equalTo: genderTextView.layoutMarginsGuide.bottomAnchor, constant: 35).isActive = true
        goButton.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 32).isActive = true
        goButton.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -32).isActive = true

        myLabel.topAnchor.constraint(equalTo: goButton.layoutMarginsGuide.bottomAnchor, constant: 24).isActive = true
        myLabel.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 16).isActive = true
        myLabel.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -16).isActive = true

        logoBottom.topAnchor.constraint(equalTo: myLabel.layoutMarginsGuide.bottomAnchor, constant: 48).isActive = true
        logoBottom.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 144).isActive = true
        logoBottom.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -144).isActive = true
        
        scrollView.contentSize = CGSize(width: Int(view.frame.size.width), height: screenContentHeigh)
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
    
    func genSC() -> UISegmentedControl{
        let genderItems = ["man", "women"]
        let genderSC = UISegmentedControl(items : genderItems)
        genderSC.selectedSegmentIndex = 0
        genderSC.layer.cornerRadius = 5.0
        genderSC.backgroundColor = UIColor(red: 0.471, green: 0.471, blue: 0.502, alpha: 0.16)
        genderSC.tintColor = UIColor.yellow
        genderSC.translatesAutoresizingMaskIntoConstraints = false
        return genderSC
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
