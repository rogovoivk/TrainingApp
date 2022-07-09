import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    public let distanceLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.text = "item of some distance"
        myLabel.font = UIFont.boldSystemFont(ofSize: 22)
        return myLabel
    }()
    
    public let timeLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.text = "item of some time"
        myLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        myLabel.font = UIFont(name: "SFProText-Regular", size: 15)
        return myLabel
    }()
    
    public let typeLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.text = "item of some type"
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
    
//    public let bikeView: UIImageView = {
////        let imageName = "Icon"
////        let image = UIImage(named: imageName)
////        let myImageView = UIImageView(image: image!)
////        myImageView.layer.cornerRadius = .infinity
////        myImageView.layer.masksToBounds = true
////        myImageView.backgroundColor = .systemBlue
////        return myImageView
//        let imageView = UIImageView()
//
//        imageView.image = UIImage(named: "Icon")?.withRenderingMode(.alwaysOriginal)
//        imageView.layer.cornerRadius = 10 //number of your choice
//        imageView.layer.masksToBounds = true
//        imageView.backgroundColor = .systemBlue
//        return imageView
//    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray6
        contentView.addSubview(myButton)
        contentView.addSubview(distanceLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(typeLabel)
        contentView.addSubview(fourthLabel)
//        contentView.addSubview(bikeView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myButton.frame = CGRect(x: 16, y: 0, width: contentView.frame.size.width - 32, height: contentView.frame.size.height - 15)
        
        distanceLabel.frame = CGRect(x: 32, y: 14, width: 259, height: 28)
        
        timeLabel.frame = CGRect(x: 32, y: 29, width: contentView.frame.size.width - 100, height: contentView.frame.size.height - 76)
        
        typeLabel.frame = CGRect(x: 59, y: 56, width: contentView.frame.size.width - 100, height: contentView.frame.size.height - 76)
        
        fourthLabel.frame = CGRect(x: 235, y: 56, width: contentView.frame.size.width - 100, height: contentView.frame.size.height - 76)
        
//        bikeView.frame = CGRect(x: 32, y: 67, width: 22, height: 22)
        
    }

    @objc func pressedButton() {
        print("pressed button in TV")
    }

}
