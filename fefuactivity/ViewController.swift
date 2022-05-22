//
//  ViewController.swift
//  fefuactivity
//
//  Created by Andrew L on 04.10.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func RegistrationButton(_ sender: UIButton) {
        print("Test Register")
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterBoardID") as! RegistrationViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func PressLogIn(_ sender: UIButton) {
        print("Press Log In")
        let vc = storyboard?.instantiateViewController(withIdentifier: "LogInBoardID") as! LogInViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        print("Test start")
        super.viewDidLoad()
        
        
        
//        navigationController?.hidesBarsOnTap = true
//        let firstButton = UIButton(type: .roundedRect)
//        firstButton.setTitle("First", for: .normal)
//        firstButton.sizeToFit()
//        firstButton.backgroundColor = .green
//        firstButton.tintColor = .black
//        firstButton.translatesAutoresizingMaskIntoConstraints = false
//
//        view.addSubview(firstButton)
//
//        firstButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
//        firstButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
    }
    
    @objc func callMethod() {
        //do stuff here
     }
}


