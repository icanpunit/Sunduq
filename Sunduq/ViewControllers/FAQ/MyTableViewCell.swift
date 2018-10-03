//
//  MyTableViewCell.swift
//  LUExpandableTableViewExample
//
//  Created by Laurentiu Ungur on 24/11/2016.
//  Copyright © 2016 Laurentiu Ungur. All rights reserved.
//

import UIKit

final class MyTableViewCell: UITableViewCell {
    // MARK: - Properties
    
    let label = UILabel()

    // MARK: - Init
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label)
        label.backgroundColor = UIColor.red
         print(label.frame.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Base Class Overrides
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -26).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 26).isActive = true
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2).isActive = true
       // label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 2).isActive = true
       // label.heightAnchor.constraint(greaterThanOrEqualToConstant: 100) .isActive = true
       
        self.contentView.frame.size.height = 100
        contentView.addSubview(label)
//        label.frame = contentView.bounds
//        label.frame.origin.x += 26
    }
}
