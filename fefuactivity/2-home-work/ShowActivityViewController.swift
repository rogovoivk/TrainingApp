//
//  ShowActivityViewController.swift
//  fefuactivity
//
//  Created by Vladoslav on 30.05.2022.
//

import UIKit

class ShowActivityViewController: UIViewController {
    
    var propertyDistanceLabel = "distance label"
    var propertyTimeLabel = "time label"
    var propertyDateStartLabel: Date?
    var propertyDateFinishLabel:Date?
    var propertyTypeLabel = "type label"
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var startFinishLabel: UILabel!
    @IBOutlet weak var whenLabel: UILabel!
    @IBOutlet weak var whenLabel2: UILabel!
    @IBOutlet weak var bykeIco: UIImageView!
    
    func computeNewDate(from fromDate: Date, to toDate: Date) -> Date {
        let delta = Calendar.current.dateComponents([.second], from: fromDate, to: toDate).second!
        return Calendar.current.date(byAdding: .second, value: delta, to: Date())!
    }
    
    func convertTimeString() -> String{
        var hTime = (propertyTimeLabel as NSString).integerValue
        var mTime = (propertyTimeLabel as NSString).integerValue
        var sTime = (propertyTimeLabel as NSString).integerValue
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
//        return String("\(hTime) часов \(mTime) минут \(sTime) секунд")
//        return String("Test! \(hTime)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bykeIco.layer.cornerRadius = 10
        distanceLabel.text = "\(propertyDistanceLabel) метров"
        propertyTimeLabel = convertTimeString()
        timeLabel.text = "\(propertyTimeLabel)"
        typeLabel.text = propertyTypeLabel
        if (propertyTypeLabel == "run") {
            typeLabel.text = "Бег"
        } else  if (propertyTypeLabel  == "bike") {
            typeLabel.text = "Велосипед"
        } else {
            typeLabel.text = propertyTypeLabel
        }
        let calendar = NSCalendar.current
        let calendarComponentHour1 = calendar.component( .hour, from: propertyDateStartLabel!)
        let calendarComponentMinute1 = calendar.component( .minute, from: propertyDateStartLabel!)
        let calendarComponentsHour2 = calendar.component( .hour, from: propertyDateFinishLabel!)
        let calendarComponentMinute2 = calendar.component( .minute, from: propertyDateFinishLabel!)
        var stringMin1 = String(calendarComponentMinute1)
        if (calendarComponentMinute1 < 10) {stringMin1 = "0\(calendarComponentMinute1)"}
        var stringMin2 = String(calendarComponentMinute2)
        if (calendarComponentMinute2 < 10) {stringMin2 = "0\(calendarComponentMinute2)"}
        startFinishLabel.text = "Старт \(calendarComponentHour1):\(stringMin1) - Финиш \(calendarComponentsHour2):\(stringMin2)"

        let nowDate = Date()
//        let whenDate = computeNewDate(from: nowDate, to: propertyDateFinishLabel!)
        var stringWhenDate: String
        if (Calendar.current.dateComponents([.day], from: propertyDateFinishLabel!, to: nowDate).day != 0){
                stringWhenDate = "\(Calendar.current.dateComponents([.day], from: propertyDateFinishLabel!, to: nowDate).day!) дней назад"
        } else if (Calendar.current.dateComponents([.hour], from: propertyDateFinishLabel!, to: nowDate).hour != 0) {
            stringWhenDate = "\(Calendar.current.dateComponents([.hour], from: propertyDateFinishLabel!, to: nowDate).hour!) часов назад"
        } else if (Calendar.current.dateComponents([.minute], from: propertyDateFinishLabel!, to: nowDate).minute != 0) {
            stringWhenDate = "\(Calendar.current.dateComponents([.minute], from: propertyDateFinishLabel!, to: nowDate).minute!) минут назад"
        } else {
            stringWhenDate = "\(Calendar.current.dateComponents([.second], from: propertyDateFinishLabel!, to: nowDate).second) секунд назад"
        }

        whenLabel.text = stringWhenDate
        whenLabel2.text = stringWhenDate
        
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
