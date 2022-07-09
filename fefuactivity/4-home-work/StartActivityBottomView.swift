//
//  StartActivityBottonView.swift
//  fefuactivity
//
//  Created by Vladoslav on 24.06.2022.
//

import UIKit

protocol StartActivityBottomViewDeligate: AnyObject {
    func didStart()
}

class StartActivityBottomView: UIView {
    public var choose = "none"
    @IBOutlet weak var runView: UIView!
    @IBOutlet weak var bikeView: UIView!
    
    @IBAction func ChooseBike(_ sender: Any) {
        choose = "bike"
        runView.layer.borderWidth = 0
        bikeView.layer.borderWidth = 2
//        bikeView.layer.borderColor = .init(red: 75, green: 9, blue: 243, alpha: 1)
        bikeView.layer.cornerRadius = 13.91
        bikeView.layer.borderColor = UIColor.blue.cgColor
    }
    
    @IBAction func ChooseRun(_ sender: Any) {
        choose = "run"
        bikeView.layer.borderWidth = 0
        runView.layer.borderWidth = 2
        runView.layer.cornerRadius = 13.91
        runView.layer.borderColor = UIColor.blue.cgColor
    }
    weak var delegate: StartActivityBottomViewDeligate?

    @IBAction func didTapStartButton(_ sender: Any) {
        delegate?.didStart()
    }

}
