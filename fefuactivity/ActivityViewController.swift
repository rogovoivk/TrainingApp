//
//  ActivityViewController.swift
//  fefuactivity
//
//  Created by Vladoslav on 28.05.2022.
//

import UIKit

class ActivityViewController: UIViewController {
//    let GroupSection = ["-1-","-2-"]
//    var itemsTV = [["item 1"],[ "item 2", "item 3"]]
    var GroupSection: [String] = []
    var itemsTV = [[String]]()
    var firstPropertyForShowActivity: Int = 1000
    
//    var characters = ["Link", "Zelda", "Ganondorf", "Midna"]
    @IBOutlet weak var empyLabel: UILabel!
    var wasFirstTraining = false
    @IBOutlet weak var myTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        let startButton = genButton()
//        myTV.addSubview(startButton)
//        startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 16).isActive = true
        
        myTV.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        myTV.dataSource = self
        myTV.delegate = self
        
    }
    
    @IBAction func PressedStartButton(_ sender: UIButton) {
        if wasFirstTraining == false {
            wasFirstTraining = true
            empyLabel.text = ""
            
            GroupSection.append("Вчера")
            GroupSection.append("Май 2022 года")
            itemsTV.append([])
            itemsTV.append([])
            itemsTV[0].append("14.32 км (1)")
            itemsTV[1].append("14.32 км (2)")
            itemsTV[1].append("14.32 км (3)")
            myTV.reloadData()
            
        }
        
    }
}

extension ActivityViewController: UITableViewDataSource, UITableViewDelegate{
    
    @objc func pressedButton(sender:UIButton) {
        print("pressed button GO")
        let vc = storyboard?.instantiateViewController(withIdentifier: "ShowActivityBoardID") as! ShowActivityViewController
        vc.propertyFirstLabel = sender.accessibilityIdentifier ?? "error"
//        vc!.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
    let section = self.GroupSection[section]
    return section
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
    // Количество секций
    return GroupSection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if wasFirstTraining == true {
            return itemsTV[section].count
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        cell.myButton.accessibilityIdentifier = itemsTV[indexPath.section][indexPath.row]
        cell.myButton.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
        cell.firstLabel.text = itemsTV[indexPath.section][indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}



