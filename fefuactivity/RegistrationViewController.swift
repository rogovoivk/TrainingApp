//
//  RegistrationViewController.swift
//  fefuactivity
//
//  Created by Vladoslav on 07.05.2022.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    
    private let screenContentHeigh = 600
    private var scrollView = UIScrollView()
    private var myView = UIView()
    
    @IBOutlet weak var someLabel: UILabel!
    @IBOutlet weak var someButton: UIButton!
//    @IBOutlet weak var scrollView: UIScrollView!
    
    private var loginTextField = UITextField()
    private var nikenameTextField = UITextField()
    private var passwordTextField = UITextField()
    private var secondPasswordTextField = UITextField()
    private var genderTextView = UITextField()
    
    private let genderSC: UISegmentedControl = {
        let genderItems = ["man", "women"]
        let genderSC = UISegmentedControl(items : genderItems)
        genderSC.selectedSegmentIndex = 0
        genderSC.layer.cornerRadius = 5.0
        genderSC.backgroundColor = UIColor(red: 0.471, green: 0.471, blue: 0.502, alpha: 0.16)
        genderSC.tintColor = UIColor.yellow
        genderSC.translatesAutoresizingMaskIntoConstraints = false
        return genderSC
    }()
    
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
    
    @objc func pressedButton() {
        print("pressed button GO")
        let vc = storyboard?.instantiateViewController(withIdentifier: "MenuTabBarID")
        vc!.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: true, completion: nil)
    }
    
    private let myLabel: UILabel = {
        let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        myLabel.textAlignment = .center
        myLabel.text = "Нажимая на кнопку, вы соглашаетесь с политикой конфиденциальности и обработки персональных данных, а также принимаете пользовательское соглашение"
        myLabel.font = UIFont(name: "SFProText-Regular", size: 15)
        myLabel.numberOfLines = 0
        myLabel.lineBreakMode = .byWordWrapping
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        return myLabel
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
        title = "Регистрация"
        addSubviews()
        layoutViews()
    }
    
    func addSubviews() {
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        view.addSubview(scrollView)
        
        myView = UIView(frame: CGRect(x: 0, y: 0, width: Int(view.frame.size.width), height: screenContentHeigh))
        
        scrollView.addSubview(myView)
        
        loginTextField = genTextField(myPlaceholder: "Логин")
        nikenameTextField = genTextField(myPlaceholder: "Имя или никнейм")
        passwordTextField = genTextField(myPlaceholder: "пароль")
        secondPasswordTextField = genTextField(myPlaceholder: "повторите пароль")
        genderTextView = genTextField(myPlaceholder: " ")
        genderTextView.text = "Пол"
        genderTextView.isUserInteractionEnabled = false
        genderTextView.backgroundColor = UIColor.white
        genderTextView.borderStyle = UITextField.BorderStyle.none
        
        myView.addSubview(loginTextField)
        myView.addSubview(nikenameTextField)
        myView.addSubview(passwordTextField)
        myView.addSubview(secondPasswordTextField)
        myView.addSubview(genderTextView)
        myView.addSubview(genderSC)
        myView.addSubview(goButton)
        myView.addSubview(myLabel)
        myView.addSubview(logoBottom)
        
        scrollView.contentSize = CGSize(width: Int(view.frame.size.width), height: screenContentHeigh)
    }
    
    func layoutViews() {
        
        NSLayoutConstraint.activate([
            loginTextField.topAnchor.constraint(equalTo: myView.topAnchor, constant: 16),
            loginTextField.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 16),
            loginTextField.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -16),

            nikenameTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 16),
            nikenameTextField.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 16),
            nikenameTextField.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -16),

            passwordTextField.topAnchor.constraint(equalTo: nikenameTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -16),

            secondPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            secondPasswordTextField.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 16),
            secondPasswordTextField.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -16),

            genderTextView.topAnchor.constraint(equalTo: secondPasswordTextField.layoutMarginsGuide.bottomAnchor, constant: 35),
            genderSC.topAnchor.constraint(equalTo: genderTextView.topAnchor, constant: 0),
            genderTextView.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 31),
            genderSC.leadingAnchor.constraint(equalTo: genderTextView.trailingAnchor, constant: 150),
            genderSC.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -51),

            goButton.topAnchor.constraint(equalTo: genderTextView.layoutMarginsGuide.bottomAnchor, constant: 35),
//            goButton.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 32),
//            goButton.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -32),
            goButton.widthAnchor.constraint(equalToConstant: 311),
            goButton.heightAnchor.constraint(equalToConstant: 50),
            goButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),

            myLabel.topAnchor.constraint(equalTo: goButton.layoutMarginsGuide.bottomAnchor, constant: 24),
            myLabel.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 16),
            myLabel.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -16),

            logoBottom.topAnchor.constraint(equalTo: myLabel.layoutMarginsGuide.bottomAnchor, constant: 48),
            logoBottom.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 144),
            logoBottom.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -144)
            
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

 

}
