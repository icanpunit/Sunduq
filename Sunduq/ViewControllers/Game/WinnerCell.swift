//
//  WinnerCell.swift
//  Sunduq
//
//  Created by Mandip Kanjiya on 19/07/18.
//  Copyright © 2018 I Can Infotech. All rights reserved.
//

import UIKit

class WinnerCell: UITableViewCell {

    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDoller: UILabel!
    @IBOutlet var ViewUser: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imgIcon.layer.cornerRadius = self.imgIcon.frame.size.height/2
        self.imgIcon.clipsToBounds = true
        self.ViewUser.layer.cornerRadius = self.ViewUser.frame.size.height/2
        self.ViewUser.clipsToBounds = true
        self.ViewUser.backgroundColor = ColorAppGreen

//        self.lblName.font = UIFont.init(name: Regular, size: 12)
//        self.lblDoller.font = UIFont.init(name: FontBold, size: 14)
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
