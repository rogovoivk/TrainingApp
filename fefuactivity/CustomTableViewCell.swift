import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    public let firstLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.text = "item of some time"
        myLabel.font = UIFont.boldSystemFont(ofSize: 22)
        return myLabel
    }()
    
    public let secondLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.text = "2 часа 46 минут"
        myLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        myLabel.font = UIFont(name: "SFProText-Regular", size: 15)
        return myLabel
    }()
    
    public let thirdLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.text = "Велосипед"
        myLabel.font = UIFont(name: "SFProText-Regular", size: 15)
        return myLabel
    }()
    
    public let fourthLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.text = "14 часов назад"
        myLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        myLabel.font = UIFont(name: "SFProText-Regular", size: 15)
        return myLabel
    }()
    
    public let myButton: UIButton = {
        let myButton = UIButton()
        myButton.backgroundColor = .white
        myButton.layer.cornerRadius = 10
        return myButton
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray6
        contentView.addSubview(myButton)
        contentView.addSubview(firstLabel)
        contentView.addSubview(secondLabel)
        contentView.addSubview(thirdLabel)
        contentView.addSubview(fourthLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myButton.frame = CGRect(x: 16, y: 0, width: contentView.frame.size.width - 32, height: contentView.frame.size.height - 15)
        
        firstLabel.frame = CGRect(x: 32, y: 14, width: 259, height: 28)
        
        secondLabel.frame = CGRect(x: 32, y: 29, width: contentView.frame.size.width - 100, height: contentView.frame.size.height - 76)
        
        thirdLabel.frame = CGRect(x: 32, y: 56, width: contentView.frame.size.width - 100, height: contentView.frame.size.height - 76)
        
        fourthLabel.frame = CGRect(x: 235, y: 56, width: contentView.frame.size.width - 100, height: contentView.frame.size.height - 76)
    }

    @objc func pressedButton() {
        print("pressed button in TV")
    }

}
