//
//  ActivityViewController.swift
//  fefuactivity
//
//  Created by Vladoslav on 28.05.2022.
//

import UIKit

extension UIView{
    static func loadNib<T: UIView>() -> T {
        //return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil)[0] as! T
        let nib = Bundle.main.loadNibNamed(String(describing: T.self), owner: nil)
        return nib?.first as! T
    }
}

class ActivityViewController: UIViewController {
//    let startButton =  UIButton()
    
//    let GroupSection = ["-1-","-2-"]
//    var itemsTV = [["item 1"],[ "item 2", "item 3"]]
    var GroupSection: [String] = []
    var itemsDistance = [[String]]()
    var itemsTime = [[String]]()
    var itemsType = [[String]]()
    var firstPropertyForShowActivity: Int = 1000
    var identifierButton = 0
    
    @IBOutlet weak var startButton: UIButton!
    //    var characters = ["Link", "Zelda", "Ganondorf", "Midna"]
    @IBOutlet weak var empyLabel: UILabel!
    var wasFirstTraining = false
    @IBOutlet weak var myTV: UITableView!
    
    let dataStoreManager = DataStoreManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        startButton.layer.cornerRadius = .infinity
        
        myTV.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        myTV.dataSource = self
        myTV.delegate = self
//        empyLabel.text = ""
        let activities = dataStoreManager.loadActivity()
        if (activities?.count != 0) {
            empyLabel.text = ""
        }
        
    }
    
//    override func loadView() {
//        print("ловим загрузку 1")
//    }
    
    override func loadViewIfNeeded() {
        let activities = dataStoreManager.loadActivity()
        if (activities?.count == 0) {
            wasFirstTraining = false
        }else {
            wasFirstTraining = true
            empyLabel?.text = ""
            identifierButton = 0
            
            GroupSection.removeAll()
            itemsDistance.removeAll()
            GroupSection.append("Сегодня")
            itemsDistance.append([])
            itemsTime.append([])
            itemsType.append([])
            for i in 0...(activities!.count-1) {
                itemsDistance[0].append(String(activities![i].itemDistance))
                itemsTime[0].append(activities![i].itemTime!)
                itemsType[0].append(activities![i].itemType!)
            }
            myTV?.reloadData()
        }
    }
    
    @IBAction func PressedStartButton(_ sender: Any) {
        


        let controller = MapViewController()
        navigationController?.pushViewController(controller, animated: true)

        
//        if wasFirstTraining == true{
//            let controller = MapViewController()
//            navigationController?.pushViewController(controller, animated: true)
//        }
//        if wasFirstTraining == false {
//            wasFirstTraining = true
//            empyLabel.text = ""
//
//            GroupSection.append("Вчера")
//            GroupSection.append("Май 2022 года")
//            itemsTV.append([])
//            itemsTV.append([])
//            itemsTV[0].append("14.32 км (1)")
//            itemsTV[1].append("14.32 км (2)")
//            itemsTV[1].append("14.32 км (3)")
//            myTV.reloadData()
//
//        }
        
    }

}

extension ActivityViewController: UITableViewDataSource, UITableViewDelegate{
    
    
    @objc func pressedButton(sender:UIButton) {
        print("pressed button GO")
        let vc = storyboard?.instantiateViewController(withIdentifier: "ShowActivityBoardID") as! ShowActivityViewController
        let activities = dataStoreManager.loadActivity()
        let ind = Int(sender.accessibilityIdentifier ?? "0")
        vc.propertyDistanceLabel = String(activities![ind!].itemDistance)
//        activities?[0].itemDistance
        vc.propertyTimeLabel = activities![ind!].itemTime!
        vc.propertyTypeLabel = activities![ind!].itemType!
        vc.propertyDateStartLabel = activities![ind!].itemDateStart!
        vc.propertyDateFinishLabel = activities![ind!].itemDateFinish!
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
            return itemsDistance[section].count
        }
        else {
            return 0
        }
    }
    
    func convertTimeString(i: Int, j: Int) -> String{
        var hTime = (itemsTime[i][j] as NSString).integerValue
        var mTime = (itemsTime[i][j] as NSString).integerValue
        var sTime = (itemsTime[i][j] as NSString).integerValue
        print(hTime, mTime, sTime, itemsTime[i][j])
        hTime = hTime / 3600
        mTime = (mTime % 3600) / 60
        sTime = (sTime % 3600) % 60
        var ans = ""
        if (hTime != 0) {
            let lastdigit = hTime % 10
            if (lastdigit == 1){
                ans = ans + "\(hTime) час "
            }
            if (lastdigit > 1 && lastdigit < 5){
                ans = ans + "\(mTime) часа "
            }
            if (lastdigit >= 5){
                ans = ans + "\(hTime) часов "
            }
            
        }
        if (mTime != 0) {
            let lastdigit = mTime % 10
            if (lastdigit == 1){
                ans = ans + "\(mTime) минута "
            }
            if (lastdigit > 1 && lastdigit < 5){
                ans = ans + "\(mTime) минуты "
            }
            if (lastdigit >= 5){
                ans = ans + "\(mTime) минут "
            }
            
        }
        if (sTime != 0) {
            let lastdigit = sTime % 10
            if (lastdigit == 1){
                ans = ans + "\(sTime) секунда "
            }
            if (lastdigit > 1 && lastdigit < 5){
                ans = ans + "\(sTime) секунды "
            }
            if (lastdigit >= 5){
                ans = ans + "\(sTime) секунд "
            }
            
        }
        return ans
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        cell.myButton.accessibilityIdentifier = String(identifierButton)
        identifierButton = identifierButton + 1
        cell.myButton.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
        cell.distanceLabel.text = String("\(itemsDistance[indexPath.section][indexPath.row]) метров")
//        cell.timeLabel.text = itemsTime[indexPath.section][indexPath.row]
        cell.timeLabel.text = convertTimeString(i: indexPath.section, j: indexPath.row)
        cell.typeLabel.text = itemsType[indexPath.section][indexPath.row]

//
//        cell.timeLabel.text = String("" + hTime + "часов" + mTime + "минут" + sTime + "секунд")
        if (itemsType[indexPath.section][indexPath.row] == "run") {
            cell.typeLabel.text = "Бег"
        } else  if (itemsType[indexPath.section][indexPath.row] == "bike") {
            cell.typeLabel.text = "Велосипед"
        } else {
            cell.typeLabel.text = itemsType[indexPath.section][indexPath.row]
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}



