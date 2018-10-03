//
//  Wallet_Vc.swift
//  Sunduq
//
//  Created by Mandip Kanjiya on 21/07/18.
//  Copyright © 2018 Mandip Kanjiya. All rights reserved.
//

import UIKit
import Foundation
class Wallet_Vc: UIViewController {

    @IBOutlet weak var lblLine1: UILabel!
    @IBOutlet weak var lblLine2: UILabel!
    @IBOutlet weak var ConstaintsTxtEmailTreling: NSLayoutConstraint!
    @IBOutlet weak var ConstaintslblLine1Treiling: NSLayoutConstraint!
    @IBOutlet weak var ConstaintstxtScreenNametreiling: NSLayoutConstraint!
    @IBOutlet weak var ConstaintslblLine2Treling: NSLayoutConstraint!
    @IBOutlet weak var ConstaintslblPaypalEmailLeading: NSLayoutConstraint!
    @IBOutlet weak var ConstaintsLblLineLeading: NSLayoutConstraint!
    @IBOutlet weak var ConstaintsLblLine2Leading: NSLayoutConstraint!
    @IBOutlet weak var ConstaintsLblScreenNameLeading: NSLayoutConstraint!
    @IBOutlet weak var ConstaintsBtnSubmitTreiling: NSLayoutConstraint!
    @IBOutlet weak var ConstraintsBtnsubmitLeading: NSLayoutConstraint!
    @IBOutlet weak var UnderLineName: UILabel!
    @IBOutlet weak var UnderLineEmail: UILabel!
    @IBOutlet weak var txtScreenName: UITextField!
    @IBOutlet weak var txtPaypalEmail: UITextField!
    @IBOutlet weak var lblScreenName: UILabel!
    @IBOutlet weak var lblPaypalEmail: UILabel!
    @IBOutlet weak var btnEarn: UIButton!
    @IBOutlet weak var lblCoins: UILabel!
    @IBOutlet weak var lblCoinsPrice: UILabel!
    @IBOutlet weak var viewUnder: UIView!
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var btnCashout: UIButton!
    @IBOutlet weak var lblRewards: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblRank: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var viewUserImg: UIView!
    @IBOutlet weak var btnSubmitChanges: UIButton!
    @IBOutlet weak var viewBottom: UIView!
    var MenuButton:UIButton = UIButton()
    var viewMain:UIView = UIView()
    var flagSideMenuOpne:Bool = true
    @IBOutlet weak var viewUpMenu: UIView!
    @IBOutlet weak var btnHome: UIButton!
    @IBOutlet weak var btnWallet: UIButton!
    @IBOutlet weak var btnRules: UIButton!
    @IBOutlet weak var btnLeaderboard: UIButton!
    @IBOutlet weak var btnFaq: UIButton!
    @IBOutlet weak var btnLogOut: UIButton!
    @IBOutlet weak var btnInviteFreinds: UIButton!
    @IBOutlet weak var btnContactUs: UIButton!
    var idBtnHome = CGRect()
    var idBtnWallet = CGRect()
    var idBtnRules = CGRect()
    var idBtnInvite = CGRect()
    var idBtnLogout = CGRect()
    var idBtnFaq = CGRect()
    var idBtnContect = CGRect()
    var idBtnLeaderboard = CGRect()
     var idMeinView = CGRect()
    func setFontandColor(){
        //MARK: - Font
        
        //MARK: - Font
        btnSubmitChanges.titleLabel?.font = UIFont.init(name: Regular, size: 17)
        btnCashout.titleLabel?.font = UIFont.init(name: Regular, size: 14)
        btnEarn.titleLabel?.font = UIFont.init(name: Regular, size: 14)
        lblUserName.font = UIFont.init(name: FontSFProDisplayMedium, size: 22)
        lblRank.font = UIFont.init(name: Regular, size: 12)
        lblPrice.font = UIFont.init(name: FontSFProDisplayMedium, size: 35)
        txtScreenName.font = UIFont.init(name: Regular, size: 12)
        txtPaypalEmail.font = UIFont.init(name: Regular, size: 12)
        lblScreenName.font =  UIFont.init(name: Regular, size: 12)
        lblPaypalEmail.font =  UIFont.init(name: Regular, size: 12)
        lblCoins.font =  UIFont.init(name: Regular, size: 13)
        lblCoinsPrice.font = UIFont.init(name: FontSFProDisplayMedium, size: 35)
        lblRewards.font = UIFont.init(name: Regular, size: 13)
        
        btnHome.titleLabel?.font = UIFont.init(name: FontMedium, size: 14)
        btnWallet.titleLabel?.font = UIFont.init(name: FontMedium, size: 14)
        btnRules.titleLabel?.font = UIFont.init(name: FontMedium, size: 14)
        btnLeaderboard.titleLabel?.font = UIFont.init(name: FontMedium, size: 14)
        btnFaq.titleLabel?.font = UIFont.init(name: FontMedium, size: 14)
        btnLogOut.titleLabel?.font = UIFont.init(name: FontMedium, size: 14)
        btnContactUs.titleLabel?.font = UIFont.init(name: FontMedium, size: 14)
        btnInviteFreinds.titleLabel?.font = UIFont.init(name: FontMedium, size: 14)
        //MARK: - Shadow
        btnEarn.layer.applySketchShadow(color: ColorAppBlack, alpha: 0.20, x: 0, y: 0, blur: 0.20, spread: 0)
         btnSubmitChanges.layer.applySketchShadow(color: ColorAppBlack, alpha: 0.20, x: 0, y: 0, blur: 0.20, spread: 0)
         btnCashout.layer.applySketchShadow(color: ColorAppBlack, alpha: 0.20, x: 0, y: 0, blur: 0.20, spread: 0)
         //MARK: - Radius
        btnCashout.layer.cornerRadius = self.btnCashout.frame.size.height/2
        btnEarn.layer.cornerRadius = self.btnEarn.frame.size.height/2
        btnSubmitChanges.layer.cornerRadius = self.btnSubmitChanges.frame.size.height/2
        viewUserImg.layer.cornerRadius = self.viewUserImg.frame.size.height/2
        imgUser.layer.cornerRadius = self.imgUser.frame.size.height/2
        
        //MARK: -Button Color
        btnCashout.setTitleColor(ColorAppBlack, for: .normal)
        btnEarn.setTitleColor(ColorAppBlack, for: .normal)
        btnSubmitChanges.setTitleColor(ColorAppBlack, for: .normal)
        viewUserImg.backgroundColor = ColorAppGreen
        lblUserName.textColor = ColorAppOrange
        lblRank.textColor = whiteColor
        lblPrice.textColor = whiteColor
        txtPaypalEmail.textColor = whiteColor
        txtScreenName.textColor = whiteColor
        lblPaypalEmail.textColor = whiteColor
        lblCoins.textColor = whiteColor
        lblCoinsPrice.textColor = whiteColor
        
        btnHome.setTitleColor(ColorAppBlack, for: .normal)
        btnWallet.setTitleColor(ColorAppBlack, for: .normal)
        btnRules.setTitleColor(ColorAppBlack, for: .normal)
        btnLeaderboard.setTitleColor(ColorAppBlack, for: .normal)
        btnFaq.setTitleColor(ColorAppBlack, for: .normal)
        btnLogOut.setTitleColor(ColorAppBlack, for: .normal)
        btnContactUs.setTitleColor(ColorAppBlack, for: .normal)
        btnInviteFreinds.setTitleColor(ColorAppBlack, for: .normal)
        viewUpMenu.backgroundColor = ColorAppSky
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFontandColor()
        
       self.navigationController?.viewControllers.removeFirst()
        
         viewMain.frame = self.view.frame
        self.view.addSubview(viewMain)
        let devWid = self.view.frame.width;
        let devHei = self.view.frame.height;
        // Header Part 1
        
        let imageView1 = UIImageView()
        imageView1.frame = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: devWid/3, height: devWid/3))
        imageView1.backgroundColor = UIColor(red: 105/255, green: 60/255, blue: 145/255, alpha: 1.0)
        self.viewMain.addSubview(imageView1)
        
        // 2-1
        let imageView2 = UIImageView()
        imageView2.frame = CGRect(origin: CGPoint(x: devWid/3,y :0), size: CGSize(width: devWid/3, height: devWid/3))
        imageView2.backgroundColor = UIColor(red: 105/255, green: 60/255, blue: 145/255, alpha: 1.0)
        self.viewMain.addSubview(imageView2)
        
        // 2-2 circle
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: devWid/2,y: devWid/6), radius: CGFloat(devWid/12), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        // change the fill color
        shapeLayer.fillColor = UIColor(red: 122/255, green: 241/255, blue: 196/255, alpha: 1.0).cgColor
       // self.view.layer.addSublayer(shapeLayer)
        
        //3-yellow
        let imageView3 = UIImageView()
        imageView3.frame = CGRect(origin: CGPoint(x: devWid*2/3,y :0), size: CGSize(width: devWid/3, height: devWid/3))
        imageView3.backgroundColor = UIColor(red: 251/255, green: 188/255, blue: 83/255, alpha: 1.0)
        self.viewMain.addSubview(imageView3)
        
        //3-blue(poly)
        let shape = CAShapeLayer()
        shape.opacity = 1
        //        shape.lineWidth = 2
        shape.lineJoin = kCALineJoinMiter
        //        shape.strokeColor = UIColor(hue: 0.786, saturation: 0.79, brightness: 0.53, alpha: 1.0).cgColor
        shape.fillColor = UIColor(red: 59/255, green: 238/255, blue: 251/255, alpha: 1.0).cgColor
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: devWid, y: 0))
        path.addLine(to: CGPoint(x: devWid*2/3, y: devWid/3))
        path.addLine(to: CGPoint(x: devWid, y: devWid/3))
        
        path.close()
        shape.path = path.cgPath
        self.viewMain.layer.addSublayer(shape)
        
         // MARK: - View Bottom
        let cutValue = devWid/3
        viewBottom.translatesAutoresizingMaskIntoConstraints = true
        viewBottom.frame = CGRect(x: 0, y: devWid/3, width:devWid, height: devHei-cutValue)
        viewBottom.backgroundColor = ColorAppRed
        self.viewMain.addSubview(viewBottom)
       
        // MARK: - Side Menu
        MenuButton.frame = CGRect(x: self.view.frame.origin.x+26, y: devWid/6-10, width:18, height: 18)
        let origImage = UIImage(named: "menu")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        MenuButton.setImage(tintedImage, for: .normal)
        MenuButton.tintColor = ColorAppGreen
        MenuButton.addTarget(self, action:#selector(self.MenuClicked), for: .touchUpInside)
        self.viewMain.addSubview(MenuButton)
        viewUnder.translatesAutoresizingMaskIntoConstraints = true
       viewUnder.frame = CGRect(x:  viewUnder.frame.origin.x, y:  viewUnder.frame.origin.y, width:devWid, height: 671)
        scrollview.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        idMeinView = self.viewMain.frame
       
        
        idBtnHome = btnHome.frame
        idBtnWallet = btnWallet.frame
        idBtnFaq = btnFaq.frame
        idBtnRules = btnRules.frame
        idBtnInvite = btnInviteFreinds.frame
        idBtnLogout = btnLogOut.frame
        idBtnContect = btnContactUs.frame
        idBtnLeaderboard = btnLeaderboard.frame
        
       
        if UIDevice().userInterfaceIdiom == .pad
        {
            self.SetIpadLayOut()
        }
        else
        {
            UnderLineName.translatesAutoresizingMaskIntoConstraints = true
            UnderLineName.frame.size.height = 0.75
            
            UnderLineEmail.translatesAutoresizingMaskIntoConstraints = true
            UnderLineEmail.frame.size.height = 0.75
        }
    }
    func SetIpadLayOut()
    {
        self.ConstaintsBtnSubmitTreiling.constant = self.view.frame.width/3-57
        self.ConstraintsBtnsubmitLeading.constant = self.view.frame.width/3-57
        self.ConstaintslblPaypalEmailLeading.constant = self.view.frame.width/3-29
        self.ConstaintsTxtEmailTreling.constant = self.view.frame.width/3-29
        self.ConstaintslblLine1Treiling.constant = self.view.frame.width/3-29
        self.ConstaintsLblLineLeading.constant = self.view.frame.width/3-29
        self.ConstaintslblLine2Treling.constant = self.view.frame.width/3-29
         self.ConstaintsLblLine2Leading.constant = self.view.frame.width/3-29
        self.ConstaintsLblScreenNameLeading.constant = self.view.frame.width/3-29
        self.ConstaintstxtScreenNametreiling.constant = self.view.frame.width/3-29
        
//        self.ConstaintsLblLineLeading.constant = self.view.frame.width/3-86
//        self.ConstaintslblLine1Treiling.constant = self.view.frame.width/3-86
//        self.ConstaintsTxtEmailTreling.constant = self.view.frame.width/3-86
//        self.ConstraintsBtnsubmitLeading.constant = self.view.frame.width/3-86
        self.viewUnder.layoutIfNeeded()
        self.viewBottom.layoutIfNeeded()
        self.scrollview.layoutIfNeeded()
        self.view.layoutIfNeeded()
        
        UnderLineName.translatesAutoresizingMaskIntoConstraints = true
        UnderLineName.frame.size.height = 0.75
        
        UnderLineEmail.translatesAutoresizingMaskIntoConstraints = true
        UnderLineEmail.frame.size.height = 0.75
    }
    @IBAction func onClickBtnHome(_ sender: Any)
    {
        let nextViewController = objMainScreen.instantiateViewController(withIdentifier: "Mainscreen_Vc")as! Mainscreen_Vc
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func onClickBtnCashOut(_ sender: Any) {
        let labelText = "$321"
        let labelMsg = "Send to"
        let labelMsg2 = " d@audiConstantsPayPCalsahcocuotunt."
        let strokeTextAttributes = [
            NSAttributedStringKey.foregroundColor : ColorAppBlack,
            NSAttributedStringKey.font : UIFont.init(name: Regular, size: 14)
            ] as [NSAttributedStringKey : Any]
        
       
        
      let Title  = NSAttributedString(string: labelText, attributes: strokeTextAttributes)
        let normalFont = UIFont(name: Regular, size: 14)
        let boldFont = UIFont(name: FontBold, size: 14)
        
        let value = addBoldText(fullString: "Send to d@audience.ae PayPCalsahcocuotunt..", boldPartOfString: "d@audience.ae", font: normalFont!, boldFont: boldFont!)
      
        let alert = UIAlertController(title: "", message: "",  preferredStyle: .alert)
       alert.setValue(Title, forKey: "attributedTitle")
       alert.setValue(value, forKey: "attributedMessage")
        alert.view.backgroundColor = UIColor.white
        alert.view.layer.cornerRadius = 10
        //let alert = UIAlertController(title: NSLocalizedString("AppName", comment: ""), message: NSLocalizedString("Msg_Logout", comment: ""), preferredStyle: .alert)
       // alert.view.tintColor = UIColor.init(hexString: "FE2D55")
        
        alert.addAction(UIAlertAction(title: "Cash Out", style: .default, handler: {(alert: UIAlertAction!) in
           
        }))
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: {(alert: UIAlertAction!) in print("Foo")
            
        }))
        
        self.present(alert, animated: true)
    }
    func addBoldText(fullString: NSString, boldPartOfString: NSString, font: UIFont!, boldFont: UIFont!) -> NSAttributedString {
        let nonBoldFontAttribute = [NSAttributedStringKey.font:font!]
        let boldFontAttribute = [NSAttributedStringKey.font:boldFont!]
        let boldString = NSMutableAttributedString(string: fullString as String, attributes:nonBoldFontAttribute)
        boldString.addAttributes(boldFontAttribute, range: fullString.range(of: boldPartOfString as String))
        return boldString
    }
    @IBAction func onClickBtnEarn(_ sender: Any) {
        let nextViewController = objGame.instantiateViewController(withIdentifier: "WinnerListVC")as! WinnerListVC
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    @objc func MenuClicked() {
        let devWid = self.view.frame.width;
        let devHei = self.view.frame.height;
        let OnePartHeight = devWid/3
        if flagSideMenuOpne == true
        {
            
            self.btnHome.translatesAutoresizingMaskIntoConstraints = false
            self.btnWallet.translatesAutoresizingMaskIntoConstraints = false
            self.btnRules.translatesAutoresizingMaskIntoConstraints = false
            self.btnLeaderboard.translatesAutoresizingMaskIntoConstraints = false
            self.btnContactUs.translatesAutoresizingMaskIntoConstraints = false
            self.btnFaq.translatesAutoresizingMaskIntoConstraints = false
            self.btnLogOut.translatesAutoresizingMaskIntoConstraints = false
            
            self.btnHome.isHidden = true
            self.btnWallet.isHidden = true
            self.btnRules.isHidden = true
            self.btnLeaderboard.isHidden = true
            self.btnInviteFreinds.isHidden = true
            self.btnContactUs.isHidden = true
            self.btnFaq.isHidden = true
            self.btnLogOut.isHidden = true
            
            flagSideMenuOpne = false
            UIView.transition(with: self.btnHome, duration: 0.9, animations: {
                self.viewMain.frame = CGRect(x:self.viewMain.frame.origin.x, y: devHei-OnePartHeight, width: self.viewMain.frame.width, height: self.viewMain.frame.height)
                
                
                
                UIView.animate(withDuration: 0.15, animations: {
                    self.btnHome.isHidden = false
                    self.btnWallet.isHidden = false
                    self.btnRules.isHidden = false
                    self.btnLeaderboard.isHidden = false
                    self.btnInviteFreinds.isHidden = false
                    self.btnContactUs.isHidden = false
                    self.btnFaq.isHidden = false
                    self.btnLogOut.isHidden = false
                    
                    
                    self.btnHome.frame = CGRect(x: self.btnHome.frame.origin.x, y: self.btnHome.frame.origin.y-40, width: self.btnHome.frame.width, height: self.btnHome.frame.height)
                    
                    self.btnWallet.frame = CGRect(x: self.btnWallet.frame.origin.x, y: self.btnWallet.frame.origin.y-40, width: self.btnWallet.frame.width, height: self.btnWallet.frame.height)
                    self.btnRules.frame = CGRect(x: self.btnRules.frame.origin.x, y: self.btnRules.frame.origin.y-40, width: self.btnRules.frame.width, height: self.btnRules.frame.height)
                    self.btnLeaderboard.frame = CGRect(x: self.btnLeaderboard.frame.origin.x, y: self.btnLeaderboard.frame.origin.y-40, width: self.btnLeaderboard.frame.width, height: self.btnLeaderboard.frame.height)
                    self.btnInviteFreinds.frame = CGRect(x: self.btnInviteFreinds.frame.origin.x, y: self.btnInviteFreinds.frame.origin.y-40, width: self.btnInviteFreinds.frame.width, height: self.btnInviteFreinds.frame.height)
                    self.btnContactUs.frame = CGRect(x: self.btnContactUs.frame.origin.x, y: self.btnContactUs.frame.origin.y-40, width: self.btnContactUs.frame.width, height: self.btnContactUs.frame.height)
                    self.btnFaq.frame = CGRect(x: self.btnFaq.frame.origin.x, y: self.btnFaq.frame.origin.y-40, width: self.btnFaq.frame.width, height: self.btnFaq.frame.height)
                    self.btnLogOut.frame = CGRect(x: self.btnLogOut.frame.origin.x, y: self.btnLogOut.frame.origin.y-40, width: self.btnLogOut.frame.width, height: self.btnLogOut.frame.height)
                    
                })
                
            }, completion: { (true) in
                
                
            })
            
        }
        else
        {
            
            
            UIView.transition(with: self.view, duration: 0.9,  animations: {
                
                
                self.viewMain.frame = self.idMeinView
                
            }, completion: { (true) in
                
                UIView.animate(withDuration: 0.5, animations: {
                    
                    self.btnHome.isHidden = true
                    self.btnWallet.isHidden = true
                    self.btnRules.isHidden = true
                    self.btnLeaderboard.isHidden = true
                    self.btnInviteFreinds.isHidden = true
                    self.btnContactUs.isHidden = true
                    self.btnFaq.isHidden = true
                    self.btnLogOut.isHidden = true
                    
                    self.btnHome.frame = self.idBtnHome
                    self.btnWallet.frame = self.idBtnWallet
                    self.btnRules.frame = self.idBtnRules
                    self.btnLeaderboard.frame = self.idBtnLeaderboard
                    self.btnInviteFreinds.frame = self.idBtnInvite
                    self.btnContactUs.frame = self.idBtnContect
                    self.btnFaq.frame = self.idBtnFaq
                    self.btnLogOut.frame = self.idBtnLogout
                    
                }, completion: nil)
                self.flagSideMenuOpne = true
            })
            
            
            
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
