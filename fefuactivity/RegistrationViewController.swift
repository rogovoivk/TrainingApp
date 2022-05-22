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
//        view.backgroundColor = .yellow
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.backgroundColor = .green
        view.addSubview(scrollView)
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 600))
        
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
        
        
        


//        scrollView.addSubview(testTextField)
        scrollView.addSubview(loginTextField)
        scrollView.addSubview(nikenameTextField)
        scrollView.addSubview(passwordTextField)
        scrollView.addSubview(secondPasswordTextField)
        scrollView.addSubview(genderTextView)
        scrollView.addSubview(genderSC)
        scrollView.addSubview(goButton)
        scrollView.addSubview(myLabel)
        scrollView.addSubview(logoBottom)
        
//        testTextField.topAnchor.constraint(equalTo: myView.topAnchor, constant: 800).isActive = true
//        testTextField.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 10).isActive = true
//
//
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
//        logoBottom.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -66).isActive = true
        
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
    
    func genSC() -> UISegmentedControl{
        let genderItems = ["man", "women"]
        let genderSC = UISegmentedControl(items : genderItems)
//        genderSC.center = CGPoint.init(x: 200, y: 500)
        //        print(genderTextView.)
//        genderSC.frame = CGRect(x: 10, y: 10, width: 80, height: 22)
//        genderSC.center = CGPoint.init(x: 100, y: 100)
        genderSC.selectedSegmentIndex = 0
//        genderSC.addTarget(self, action: #selector(ViewController.indexChanged(_:)), for: .valueChanged)

        genderSC.layer.cornerRadius = 5.0
        genderSC.backgroundColor = UIColor(red: 0.471, green: 0.471, blue: 0.502, alpha: 0.16)
        genderSC.tintColor = UIColor.yellow
        genderSC.translatesAutoresizingMaskIntoConstraints = false

//        genderSC.isUserInteractionEnabled = false
//        genderSC.addTarget(self, action: #selector(changeGender( :)), for: .valueChanged)
        return genderSC
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
    
//    @objc func changeGender(sender: UISegmentedControl) {
//          print("Changing gender to ")
//          switch sender.selectedSegmentIndex {
//          case 1:
//              print("Man")
//          default:
//              print("Woman")
//          }
//      }

    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
