//
//  UserCellView.swift
//  QuandooTest
//
//  Created by Leo Marliere on 05/03/2024.
//

import UIKit

class UserCellView: UITableViewCell {
    
    //MARK: UIComponent
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.attributedText = NSAttributedString(string: "Text",attributes:[.underlineStyle:NSUnderlineStyle.single.rawValue])
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "UserName"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = UIColor.blue
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Address"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Private Method
    func setupView() {
        addSubview(cellView)
        cellView.addSubview(nameLabel)
        cellView.addSubview(userNameLabel)
        cellView.addSubview(emailLabel)
        cellView.addSubview(addressLabel)
        self.selectionStyle = .none
        
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
        
        nameLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
        nameLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10).isActive = true
        
        userNameLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
        userNameLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 20).isActive = true
        
        emailLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
        emailLabel.topAnchor.constraint(equalTo: userNameLabel.topAnchor, constant: 20).isActive = true
        
        addressLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
        addressLabel.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: -20).isActive = true
        addressLabel.topAnchor.constraint(equalTo: emailLabel.topAnchor, constant: 20).isActive = true
    }
    
}
