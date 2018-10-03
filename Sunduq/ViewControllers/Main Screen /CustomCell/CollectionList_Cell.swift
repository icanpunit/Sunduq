//
//  CollectionList_Cell.swift
//  DemoDisign
//
//  Created by Mandip Kanjiya on 06/07/18.
//  Copyright © 2018 Mandip Kanjiya. All rights reserved.
//

import UIKit


final class CollectionList_Cell: UICollectionViewCell {
    
    @IBOutlet weak var lblLineColor: UILabel!
    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet weak var ViewCenter: UIView!
    @IBOutlet weak var MainView: UIView!
    @IBOutlet weak var ImgCarLogo: UIImageView!
    @IBOutlet weak var viewBackGroundColor: UIView!
    @IBOutlet weak var lblContestName: UILabel!
    @IBOutlet weak var lblRewardPoolName: UILabel!
    @IBOutlet weak var lblRewardPool: UILabel!
    @IBOutlet weak var lblRemainingTime: UILabel!
    @IBOutlet weak var lblSetAlarm: UILabel!
    @IBOutlet weak var lblSponsoredBy: UILabel!
    
    //@IBOutlet weak var blackShadowView: UIView!
    //@IBOutlet weak var sampleImageView: UIImageView!
    
//    override var shadowView: UIView? {
//        return blackShadowView
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 15
        let height =  UIScreen.main.bounds.size.width / 3
        
        viewBackGroundColor.translatesAutoresizingMaskIntoConstraints = true
        viewBackGroundColor.frame = CGRect(x: 0, y: 0, width: MainView.frame.width+3, height: height)
        
        ViewCenter.translatesAutoresizingMaskIntoConstraints = true
        ViewCenter.frame = CGRect(x: 0, y: height, width: MainView.frame.width+3, height: height)
        
        viewBottom.translatesAutoresizingMaskIntoConstraints = true
        viewBottom.frame = CGRect(x: 0, y: height*2, width: MainView.frame.width+3, height: 57)
        
        viewBottom.backgroundColor = UIColor.clear
         ViewCenter.backgroundColor = UIColor.clear
    }
    
    override func didTransition(from oldLayout: UICollectionViewLayout, to newLayout: UICollectionViewLayout) {
        lblLineColor.backgroundColor = UIColor.clear
    }
    func configure(with image: UIImage) {
       // sampleImageView.image = image
    }
}
