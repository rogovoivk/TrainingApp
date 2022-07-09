//
//  AfterStartActivityBottom.swift
//  fefuactivity
//
//  Created by Vladoslav on 26.06.2022.
//

import UIKit

protocol FinishActivityBottomViewDeligate: AnyObject {
    func didFinish()
}

protocol PauseActivityBottomViewDeligate: AnyObject {
    func didPause()
}

class AfterStartActivityBottom: UIView {
    
    weak var finishDelegate: FinishActivityBottomViewDeligate?
    weak var pauseDelegate: PauseActivityBottomViewDeligate?

    @IBAction func didTapPauseButton(_ sender: Any) {
        pauseDelegate?.didPause()
    }
    
    @IBAction func didTapFinishButton(_ sender: Any) {
        finishDelegate?.didFinish()
    }
    

}
