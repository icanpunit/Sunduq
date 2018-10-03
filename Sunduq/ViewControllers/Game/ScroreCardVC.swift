//
//  ScroreCardVC.swift
//  Sunduq
//
//  Created by Mandip Kanjiya on 19/07/18.
//  Copyright © 2018 I Can Infotech. All rights reserved.
//

import UIKit

class ScroreCardVC: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var lbluserName: UILabel!
    @IBOutlet weak var lblRank: UILabel!
    @IBOutlet weak var CoinView: UIView!
    @IBOutlet weak var MainVC: UIView!
    @IBOutlet weak var TopView: UIView!
    @IBOutlet weak var imgprofile: UIImageView!
    @IBOutlet weak var ConstantsImgUserTrinling: NSLayoutConstraint!
    
    @IBOutlet weak var ConstantsImgUserLeading: NSLayoutConstraint!
    @IBOutlet weak var ConstantsImgUserTopSpace: NSLayoutConstraint!
    @IBOutlet weak var ConstantsImgUserBottom: NSLayoutConstraint!
    @IBOutlet weak var ConstantslblWrongAnswerTopSpace: NSLayoutConstraint!
    @IBOutlet weak var ConstantsBtnUseCoinLeading: NSLayoutConstraint!
    @IBOutlet weak var ConstantsBtnUseCoinTriling: NSLayoutConstraint!
    @IBOutlet weak var ConstantsLblCoinHeight: NSLayoutConstraint!
    @IBOutlet weak var ConstantsLblCoinWeidth: NSLayoutConstraint!
    @IBOutlet weak var ConstantsViewImgWeidth: NSLayoutConstraint!
    @IBOutlet weak var ConstantsVIewImagHeight: NSLayoutConstraint!
    @IBOutlet weak var ConstantsUseCoinBottom: NSLayoutConstraint!
    @IBOutlet weak var btnRafael: UIButton!
    @IBOutlet weak var btnXavi: UIButton!
    @IBOutlet weak var btnIsco: UIButton!
    
    @IBOutlet weak var lblCointCount: UILabel!
    @IBOutlet weak var lblWrongAnswer: UILabel!
    @IBOutlet weak var btnUseCoin: UIButton!
    @IBOutlet weak var MiidleView: UIView!
  //  @IBOutlet weak var BottomView: UIView!
    @IBOutlet weak var lblCoin: UILabel!
    @IBOutlet weak var lblIsco: UILabel!
    @IBOutlet weak var lblRefear: UILabel!
    
    @IBOutlet weak var lblXavi: UILabel!
    @IBOutlet weak var Viewprofile: UIView!
    var grayViewRound = UIView()
    var grayViewRound2 = UIView()
    var grayViewRound3 = UIView()
    var grayViewRound4 = UIView()
    
    var lblOptionA:UILabel = UILabel()
    var lblOptionB:UILabel = UILabel()
    var lblOptionC:UILabel = UILabel()
    
    // MARK: Gloabl Variable
    
    var arrAnserResponse:NSMutableArray = NSMutableArray()
    
    //MARK:- UIView Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(arrAnserResponse)
        if UIDevice().userInterfaceIdiom == .pad
        {
            SetIpadLayOut()
        }else
        {
            //self.ConstantslblWrongAnswerTopSpace.constant = -10
            print(btnXavi.frame.width)
            self.setupButton()
            self.fillColor()
        }
    }
    
    func SetIpadLayOut()
    {
        ConstantsViewImgWeidth.constant = 114
        ConstantsVIewImagHeight.constant = 114
        self.Viewprofile.layer.cornerRadius = self.Viewprofile.frame.size.height/2.0
        self.imgprofile.layer.cornerRadius = self.imgprofile.frame.size.height/2.0
        
        MiidleView.translatesAutoresizingMaskIntoConstraints = true
        MiidleView.frame = CGRect(x: self.view.frame.width/3-57, y: MiidleView.frame.origin.y, width: MiidleView.frame.width/3 + 114, height: MiidleView.frame.height)
        self.MiidleView.layoutIfNeeded()
        
        self.ConstantsLblCoinHeight.constant = 70
        self.ConstantsLblCoinWeidth.constant = 70
        self.ConstantsUseCoinBottom.constant = 114
        self.ConstantsBtnUseCoinLeading.constant = self.view.frame.width/3-57
        self.ConstantsBtnUseCoinTriling.constant = self.view.frame.width/3-57
        self.ConstantslblWrongAnswerTopSpace.constant = 35
        
        //User Image
        
        self.ConstantsImgUserBottom.constant = 10
        self.ConstantsImgUserLeading.constant = 10
        self.ConstantsImgUserTopSpace.constant = 10
        self.ConstantsImgUserTrinling.constant = 10
        self.view.layoutIfNeeded()
        TopView.layoutIfNeeded()
        self.setupButton()
        self.fillColor()
    }
    
    func setupButton() {
        
        
        // Setup UPtext on Option Button in center
        
        lblOptionA.textColor = ColorAppBlack
        lblOptionB.textColor = ColorAppBlack
        lblOptionC.textColor = ColorAppBlack
        
        lblOptionA.font = UIFont.init(name: Regular, size: 14)
        lblOptionB.font = UIFont.init(name: FontBold, size: 14)
        lblOptionC.font = UIFont.init(name: Regular, size: 14)
        
        let firstName = UserDefaults.standard.value(forKey: kCustomerFirstName) as! String
        let lastName = UserDefaults.standard.value(forKey: kCustomerLastName) as! String
        
        lbluserName.text = "\(firstName) \(lastName)"
        
        lblOptionA.text = "Xavi Alonso"
        lblOptionB.text = "Leonardo Messi"
        lblOptionC.text = "Christiano Ronaldo"
        
        btnXavi.setTitle("", for: .normal)
        btnRafael.setTitle("", for: .normal)
        btnIsco.setTitle("", for: .normal)
        
        lblOptionA.textAlignment = .center
        lblOptionB.textAlignment = .center
        lblOptionC.textAlignment = .center
        lblOptionA.frame = btnXavi.frame
        lblOptionB.frame = btnIsco.frame
        lblOptionC.frame = btnRafael.frame
        
        self.MiidleView.addSubview(lblOptionA)
        self.MiidleView.addSubview(lblOptionB)
        self.MiidleView.addSubview(lblOptionC)
        
        self.btnXavi.layer.cornerRadius = self.btnXavi.frame.size.height/2.0
        self.btnIsco.layer.cornerRadius = self.btnIsco.frame.size.height/2.0
        self.btnRafael.layer.cornerRadius = self.btnRafael.frame.size.height/2.0
        self.btnUseCoin.layer.cornerRadius = self.btnUseCoin.frame.size.height/2.0
        self.Viewprofile.layer.cornerRadius = self.Viewprofile.frame.size.height/2.0
        self.CoinView.layer.cornerRadius = self.CoinView.frame.size.height/2.0
        
        self.CoinView.layer.borderColor = ColorAppBlack.cgColor
        self.imgprofile.layer.cornerRadius = self.imgprofile.frame.size.height/2.0
        
        
           self.CoinView.layer.borderWidth = 4.0
       
        //
        self.btnUseCoin.clipsToBounds = true
        self.btnRafael.clipsToBounds = true
        self.btnIsco.clipsToBounds = true
        self.btnXavi.clipsToBounds = true
        self.Viewprofile.clipsToBounds = true
        self.imgprofile.clipsToBounds = true
        self.CoinView.clipsToBounds =  true
        //color fill
        self.MainVC.backgroundColor = ColorAppRed
        self.view.backgroundColor = ColorAppRed
        self.CoinView.backgroundColor = ColorAppOrange
        self.Viewprofile.backgroundColor = ColorAppGreen
        self.btnUseCoin.backgroundColor = ColorAppGreen
        self.Viewprofile.backgroundColor = ColorAppGreen
        self.lbluserName.textColor = ColorAppOrange
        self.lblWrongAnswer.textColor = ColorAppOrange
        self.btnIsco.backgroundColor = ColorAppOrange
        lblCointCount.textColor = ColorAppBlack
        lblCoin.textColor = ColorAppBlack
        btnUseCoin.setTitleColor(ColorAppBlack, for: .normal)
        //Font set
        lbluserName.font = UIFont.init(name:FontSFProDisplayRegular, size: 20)
        lblRank.font = UIFont.init(name:Regular, size: 14)
        lblWrongAnswer.font = UIFont.init(name:FontSFProDisplayBold, size: 23)
        lblCoin.font = UIFont.init(name:FontBold, size: 14)
        //lblCointCount.font = UIFont.init(name:FontSFCompactDisplayMedium, size: 36)
        self.lblIsco.font = UIFont.init(name: Regular, size: 13)
        self.lblXavi.font = UIFont.init(name: Regular, size: 13)
        self.lblRefear.font = UIFont.init(name: Regular, size: 13)
        //Font set In Button
        btnXavi.titleLabel?.font = UIFont.init(name: Regular, size: 13)
        btnIsco.titleLabel?.font = UIFont.init(name: Regular, size: 13)
        btnRafael.titleLabel?.font = UIFont.init(name: Regular, size: 13)
        btnUseCoin.titleLabel?.font = UIFont.init(name: Regular, size: 17)
    }
    func fillColor(){
        //
        
        var totalReachToQuestion = ((arrAnserResponse.object(at: 0) as! NSDictionary).value(forKey: "nTotalAnsPerson") as? Int)!
        var totalSelectedAnsCount = ((arrAnserResponse.object(at: 0) as! NSDictionary).value(forKey: "nTotalPerson") as? Int)!
        var answerText = (arrAnserResponse.object(at: 0) as! NSDictionary).value(forKey: "cAnswerText") as! String
        var ansPercent = Int((totalSelectedAnsCount*100)/totalReachToQuestion)
        var widthOfProgressbar = Int(self.view.frame.width-80)
        var fillPercent = Int((ansPercent * widthOfProgressbar)/100)
        print("Option A \(fillPercent)")
        
        self.lblXavi.text = "\(totalSelectedAnsCount)"
        self.lblOptionA.text = answerText
        grayViewRound2.backgroundColor = ColorAppGreen
        grayViewRound2.frame = CGRect.init(x: self.btnXavi.frame.origin.x, y:self.btnXavi.frame.origin.y, width: 0, height: self.btnXavi.frame.height)
        grayViewRound2.layer.cornerRadius = self.btnXavi.frame.height/2.0
        grayViewRound2.clipsToBounds = true
        
//        let percent = (150*100/240)
        //let totalValue  = 240 - percent
        self.MiidleView.addSubview(self.grayViewRound2)
        self.MiidleView.addSubview(self.lblXavi)
        UIView.animate(withDuration: 2.0, animations: {
            self.grayViewRound2.backgroundColor =  ColorAppGreen
            self.grayViewRound2.frame = CGRect(x: self.btnXavi.frame.origin.x, y: self.btnXavi.frame.origin.y, width:  CGFloat(fillPercent), height: self.btnXavi.frame.height)
        })
        
        // btn isco
        
        totalReachToQuestion = ((arrAnserResponse.object(at: 1) as! NSDictionary).value(forKey: "nTotalAnsPerson") as? Int)!
        totalSelectedAnsCount = ((arrAnserResponse.object(at: 1) as! NSDictionary).value(forKey: "nTotalPerson") as? Int)!
        answerText = (arrAnserResponse.object(at: 1) as! NSDictionary).value(forKey: "cAnswerText") as! String
        ansPercent = Int((totalSelectedAnsCount*100)/totalReachToQuestion)
        widthOfProgressbar = Int(self.view.frame.width-80)
        fillPercent = Int((ansPercent * widthOfProgressbar)/100)
        print("Option B \(fillPercent)")
        
        self.lblIsco.text = "\(totalSelectedAnsCount)"
        self.lblOptionB.text = answerText
        grayViewRound.backgroundColor = ColorAppGray
        grayViewRound.frame = CGRect.init(x: self.btnIsco.frame.origin.x, y:self.btnIsco.frame.origin.y, width: 0, height: btnIsco.frame.height)
        grayViewRound.layer.cornerRadius = btnIsco.frame.height/2
        grayViewRound.clipsToBounds = true
       
        self.MiidleView.addSubview(self.grayViewRound)
        self.MiidleView.addSubview(self.lblIsco)

        UIView.animate(withDuration: 2.0, animations: {
            self.grayViewRound.backgroundColor = ColorAppGray
            self.grayViewRound.frame = CGRect(x: self.btnIsco.frame.origin.x, y: self.btnIsco.frame.origin.y, width:  CGFloat(fillPercent), height:  self.btnIsco.frame.height)
        })
        //btn rafael
        
        totalReachToQuestion = ((arrAnserResponse.object(at: 2) as! NSDictionary).value(forKey: "nTotalAnsPerson") as? Int)!
        totalSelectedAnsCount = ((arrAnserResponse.object(at: 2) as! NSDictionary).value(forKey: "nTotalPerson") as? Int)!
        answerText = (arrAnserResponse.object(at: 2) as! NSDictionary).value(forKey: "cAnswerText") as! String
        ansPercent = Int((totalSelectedAnsCount*100)/totalReachToQuestion)
        widthOfProgressbar = Int(self.view.frame.width-80)
        fillPercent = Int((ansPercent * widthOfProgressbar)/100)
        
        self.lblRefear.text = "\(totalSelectedAnsCount)"
        self.lblOptionC.text = answerText
        grayViewRound3.backgroundColor = ColorAppGray
        grayViewRound3.frame = CGRect.init(x: self.btnRafael.frame.origin.x, y:self.btnRafael.frame.origin.y, width: 0, height: self.btnRafael.frame.height)
        grayViewRound3.layer.cornerRadius = self.btnRafael.frame.height/2.0
        grayViewRound3.clipsToBounds = true

        self.MiidleView.addSubview(self.grayViewRound3)
        self.MiidleView.addSubview(self.lblRefear)
        self.view.bringSubview(toFront: self.btnRafael)
        print("Option C \(fillPercent)")
        print(self.btnRafael.frame.origin.x)
        print(self.btnRafael.frame.origin.y)
        UIView.animate(withDuration: 2.0, animations: {
            self.grayViewRound3.backgroundColor = ColorAppGray
            self.grayViewRound3.frame = CGRect(x: self.btnRafael.frame.origin.x, y: self.btnRafael.frame.origin.y, width:  CGFloat(fillPercent), height: self.btnRafael.frame.height)
        })
        
        self.MiidleView.addSubview(lblOptionA)
        self.MiidleView.addSubview(lblOptionB)
        self.MiidleView.addSubview(lblOptionC)
        //btnCoin
//        grayViewRound4.backgroundColor = UIColor.lightGray
//        grayViewRound4.frame = CGRect.init(x:self.btnUseCoin.frame.origin.x+200, y:self.btnUseCoin.frame.origin.y+0, width: self.btnUseCoin.frame.size.width-200, height: 45)
//        grayViewRound4.layer.cornerRadius = 22
//        grayViewRound4.clipsToBounds = true
//        self.view.addSubview(grayViewRound4)
//        self.view.bringSubview(toFront: self.btnUseCoin)
//        UIView.animate(withDuration: 2.0, animations: {
//            self.grayViewRound4.backgroundColor = UIColor.lightGray
//            self.grayViewRound4.frame = CGRect(x: self.btnUseCoin.frame.origin.x+50, y: self.btnUseCoin.frame.origin.y+0, width:  self.btnUseCoin.frame.size.width-50, height: 45)
//        })
    }

  

}
