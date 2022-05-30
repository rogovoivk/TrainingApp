//
//  ShowActivityViewController.swift
//  fefuactivity
//
//  Created by Vladoslav on 30.05.2022.
//

import UIKit

class ShowActivityViewController: UIViewController {
    
    var propertyFirstLabel = "label"

    @IBOutlet weak var firstLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstLabel.text = propertyFirstLabel

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
