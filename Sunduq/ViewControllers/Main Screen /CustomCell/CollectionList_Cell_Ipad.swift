//
//  CollectionList_Cell_Ipad.swift
//  Sunduq
//
//  Created by Mandip Kanjiya on 20/07/18.
//  Copyright © 2018 Mandip Kanjiya. All rights reserved.
//

import UIKit

class CollectionList_Cell_Ipad: UICollectionViewCell {
    @IBOutlet weak var lblLineColor: UILabel!
    @IBOutlet weak var MainView: UIView!
    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet weak var ViewCenter: UIView!
    @IBOutlet weak var ImgCarLogo: UIImageView!
    @IBOutlet weak var viewBackGroundColor: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 15
        
        let height =  UIScreen.main.bounds.size.width / 3
        let width =  UIScreen.main.bounds.size.width-104
        viewBackGroundColor.translatesAutoresizingMaskIntoConstraints = true
        viewBackGroundColor.frame = CGRect(x: 0, y: 0, width: width, height: height)
        
        ViewCenter.translatesAutoresizingMaskIntoConstraints = true
        ViewCenter.frame = CGRect(x: 0, y: height, width: width, height: height)
        
        viewBottom.translatesAutoresizingMaskIntoConstraints = true
        viewBottom.frame = CGRect(x: 0, y: height*2, width: width, height: 114)
        
        viewBottom.backgroundColor = UIColor.clear
        ViewCenter.backgroundColor = UIColor.clear
        // Initialization code
    }

}
