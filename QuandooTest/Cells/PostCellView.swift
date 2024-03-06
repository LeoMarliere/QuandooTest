//
//  PostCellView.swift
//  QuandooTest
//
//  Created by Leo Marliere on 05/03/2024.
//
// This file is not used anymore as we switched the PostsLIstViewController to SwiftUI

import UIKit

class PostCellView: UITableViewCell {
    
    //MARK: UIComponent
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.layer.borderWidth = 1.0
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.attributedText = NSAttributedString(string: "Text",attributes:[.underlineStyle:NSUnderlineStyle.single.rawValue])
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bodyLabel: UILabel = {
        let label = UILabel()
        label.text = "Body"
        label.textColor = UIColor.darkGray
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
    func configure(post: Post) {
        self.titleLabel.text = post.title
        self.bodyLabel.text = post.body

    }
    
    //MARK: Private Method
    private func setupView() {
        addSubview(cellView)
        cellView.addSubview(titleLabel)
        cellView.addSubview(bodyLabel)
        self.selectionStyle = .none
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
        
        titleLabel.numberOfLines = 2
        titleLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: -20).isActive = true
        
        bodyLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
        bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        bodyLabel.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: -20).isActive = true
    }
    
    // MARK: - Height Calculation
      
      static func height(for post: Post, width: CGFloat) -> CGFloat {
          let titleLabelHeight = heightForLabel(text: post.title, width: width, font: UIFont.boldSystemFont(ofSize: 14))
          let bodyLabelHeight = heightForLabel(text: post.body, width: width, font: UIFont.systemFont(ofSize: 12))

          let padding: CGFloat = 12
          
          return titleLabelHeight + bodyLabelHeight + padding
      }
      
      private static func heightForLabel(text: String, width: CGFloat, font: UIFont) -> CGFloat {
          let label = UILabel()
          label.numberOfLines = 0
          label.font = font
          label.text = text
          let size = label.sizeThatFits(CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
          return size.height
      }
    
}
