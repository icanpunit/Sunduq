//
//  FAQMain_Vc.swift
//  Sunduq
//
//  Created by Mandip Kanjiya on 01/08/18.
//  Copyright © 2018 Mandip Kanjiya. All rights reserved.
//

import UIKit
import LUExpandableTableView

class FAQMain_Vc: UIViewController {

    private let expandableTableView = LUExpandableTableView()
    
    @IBOutlet weak var lblHeightChecker: UILabel!
    var MainView:UIView = UIView()
    var MenuButton:UIButton = UIButton()
  var imgUser:UIImageView = UIImageView()
    private let cellReuseIdentifier = "MyCell"
    private let sectionHeaderReuseIdentifier = "MySectionHeader"
    var btnGameStart:UIButton = UIButton()
   
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
    
    var arrManuTitle = ["FAQ","HOW TO PLAY","What is Sunduq?","How much does it cost ot play?","Is that real money?","What is my referal code?","HOW TO GET PAID","My PayPal?","Can I change my username?","Im having problem processing cash?"]
    
    func setFontandColor(){
        //MARK: - Font
        
        //MARK: - Font
       
        
        btnHome.titleLabel?.font = UIFont.init(name: FontMedium, size: 14)
        btnWallet.titleLabel?.font = UIFont.init(name: FontMedium, size: 14)
        btnRules.titleLabel?.font = UIFont.init(name: FontMedium, size: 14)
        btnLeaderboard.titleLabel?.font = UIFont.init(name: FontMedium, size: 14)
        btnFaq.titleLabel?.font = UIFont.init(name: FontMedium, size: 14)
        btnLogOut.titleLabel?.font = UIFont.init(name: FontMedium, size: 14)
        btnContactUs.titleLabel?.font = UIFont.init(name: FontMedium, size: 14)
        btnInviteFreinds.titleLabel?.font = UIFont.init(name: FontMedium, size: 14)
        //MARK: - Shadow
  
        //MARK: - Radius
    
        imgUser.layer.cornerRadius = self.imgUser.frame.size.height/2
        
        //MARK: -Button Color

        
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
        MainView.frame = self.view.frame
        let devWid = self.view.frame.width;
        let devHei = self.view.frame.height;
        var CellHeightFlout: Float = Float()
        self.view.backgroundColor = ColorAppRed
        let imageView1 = UIImageView()
        imageView1.frame = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: devWid/3, height: devWid/3))
        imageView1.backgroundColor = UIColor(red: 105/255, green: 60/255, blue: 145/255, alpha: 1.0)
        self.MainView.addSubview(imageView1)
        
        // 2-1
        let imageView2 = UIImageView()
        imageView2.frame = CGRect(origin: CGPoint(x: devWid/3,y :0), size: CGSize(width: devWid/3, height: devWid/3))
        imageView2.backgroundColor = UIColor(red: 105/255, green: 60/255, blue: 145/255, alpha: 1.0)
        self.MainView.addSubview(imageView2)
        
        // 2-2 circle
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: devWid/2,y: devWid/6), radius: CGFloat(devWid/12), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        // change the fill color
        shapeLayer.fillColor = UIColor(red: 122/255, green: 241/255, blue: 196/255, alpha: 1.0).cgColor
        self.MainView.layer.addSublayer(shapeLayer)
        
        //3-yellow
        let imageView3 = UIImageView()
        imageView3.frame = CGRect(origin: CGPoint(x: devWid*2/3,y :0), size: CGSize(width: devWid/3, height: devWid/3))
        imageView3.backgroundColor = UIColor(red: 251/255, green: 188/255, blue: 83/255, alpha: 1.0)
        self.MainView.addSubview(imageView3)
        
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
        self.MainView.layer.addSublayer(shape)
        
        // MARK: - Button Game Start
        let imgHeight = devHei/6
        let newhight = imgHeight/4
        let value = devWid/6/2
        let space = value/6
        let space2 = value/3
        let divideHight = devWid/6-space2
        
        // MARK: - Side Menu
        MenuButton.frame = CGRect(x: self.view.frame.origin.x+26, y: devWid/6-10, width:18, height: 18)
        let origImage = UIImage(named: "menu")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        MenuButton.setImage(tintedImage, for: .normal)
        MenuButton.tintColor = ColorAppGreen
        MenuButton.addTarget(self, action:#selector(self.MenuClicked), for: .touchUpInside)
        self.MainView.addSubview(MenuButton)
        
        
        imgUser.frame = CGRect(x: devWid/2-value+space, y: devWid/12+space, width:devWid/6-space2, height: devWid/6-space2)
        imgUser.layer.cornerRadius = divideHight/2
        imgUser.clipsToBounds = true
        imgUser.contentMode = .scaleToFill
        //imgUser.translatesAutoresizingMaskIntoConstraints = false
        imgUser.image = UIImage.init(named: "PersonImage")
        
        btnGameStart.frame = CGRect(x: devWid/2-value+space, y: devWid/12+space, width:devWid/6-space2, height: devWid/6-space2)
        let origImage1 = UIImage(named: "menu")
        let tintedImage1 = origImage1?.withRenderingMode(.alwaysTemplate)
        // btnGameStart.setImage(tintedImage, for: .normal)
        btnGameStart.tintColor = ColorAppGreen
       // btnGameStart.addTarget(self, action:#selector(self.OnclickBtnGameStart), for: .touchUpInside)
        self.MainView.addSubview(btnGameStart)
        self.MainView.addSubview(imgUser)
        MainView.backgroundColor = ColorAppRed
        MainView.addSubview(expandableTableView)
        
        self.view.addSubview(MainView)
        expandableTableView.register(MyTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        expandableTableView.register(UINib(nibName: "MyExpandableTableViewSectionHeader", bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: sectionHeaderReuseIdentifier)
        
        expandableTableView.expandableTableViewDataSource = self
        expandableTableView.expandableTableViewDelegate = self
        expandableTableView.estimatedRowHeight = 400
        expandableTableView.backgroundColor = UIColor.clear
        expandableTableView.separatorStyle = .none
         expandableTableView.frame = CGRect(x: 0, y: devWid/3, width: devWid, height: devHei-devWid/3)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        idMeinView = self.MainView.frame
        
        
        idBtnHome = btnHome.frame
        idBtnWallet = btnWallet.frame
        idBtnFaq = btnFaq.frame
        idBtnRules = btnRules.frame
        idBtnInvite = btnInviteFreinds.frame
        idBtnLogout = btnLogOut.frame
        idBtnContect = btnContactUs.frame
        idBtnLeaderboard = btnLeaderboard.frame
        
    
    }

    // MARK: - OnclickBtnGameStart
    
    @objc func OnclickBtnGameStart()
    {
        let nextViewController = objGame.instantiateViewController(withIdentifier: "QuestionAnswerVC")as! QuestionAnswerVC
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    // MARK: - Side Menu Click Method
    
    @objc func MenuClicked()
    {
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
                self.MainView.frame = CGRect(x:self.MainView.frame.origin.x, y: devHei-OnePartHeight, width: self.MainView.frame.width, height: self.MainView.frame.height)
                
                
                
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
                
                
                self.MainView.frame = self.idMeinView
                
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

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
       
        
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
// MARK: - LUExpandableTableViewDataSource

extension FAQMain_Vc: LUExpandableTableViewDataSource {
    func numberOfSections(in expandableTableView: LUExpandableTableView) -> Int {
        return arrManuTitle.count
    }
    
    func expandableTableView(_ expandableTableView: LUExpandableTableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func expandableTableView(_ expandableTableView: LUExpandableTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        expandableTableView.backgroundColor = UIColor.clear
        guard let cell = expandableTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? MyTableViewCell else {
            assertionFailure("Cell shouldn't be nil")
            return UITableViewCell()
        }
        cell.label.font = UIFont(name: Regular, size: 12)
      lblHeightChecker.font = UIFont(name: Regular, size: 12)
        cell.label.text = "This is a sample description that sits below a group. This is a sample description that sits below a group This is a sample description that sits below a group.."
        lblHeightChecker.text = cell.label.text
        print()
      
        lblHeightChecker.layoutIfNeeded()
        cell.label.textColor = UIColor.white
     cell.label.backgroundColor = UIColor.clear
        cell.contentView.backgroundColor = ColorAppRed
        return cell
    }
    
    
    func expandableTableView(_ expandableTableView: LUExpandableTableView, sectionHeaderOfSection section: Int) -> LUExpandableTableViewSectionHeader {
        guard let sectionHeader = expandableTableView.dequeueReusableHeaderFooterView(withIdentifier: sectionHeaderReuseIdentifier) as? MyExpandableTableViewSectionHeader else {
            assertionFailure("Section header shouldn't be nil")
            return LUExpandableTableViewSectionHeader()
        }
        
        sectionHeader.label.text = arrManuTitle[section]
        
        if arrManuTitle[section] == "FAQ" || arrManuTitle[section] == "HOW TO PLAY" || arrManuTitle[section] == "HOW TO GET PAID"
        {
            sectionHeader.label.textColor = ColorAppOrange
            
            if arrManuTitle[section] == "FAQ"
            {
                sectionHeader.label.font = UIFont(name: Regular, size: 17)
            }
            else if arrManuTitle[section] == "HOW TO PLAY"
            {
                sectionHeader.label.font = UIFont(name: FontBold, size: 12)
            }
            else if arrManuTitle[section] == "HOW TO GET PAID"
            {
                sectionHeader.label.font = UIFont(name: FontBold, size: 12)
            }
        }
        else
        {
            sectionHeader.label.textColor = UIColor.white
            sectionHeader.label.font = UIFont(name: Regular, size: 17)
        }
        return sectionHeader
    }
}
extension String {
    func height(constraintedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.text = self
        label.font = font
        label.sizeToFit()
        
        return label.frame.height
    }
}
// MARK: - LUExpandableTableViewDelegate

extension FAQMain_Vc: LUExpandableTableViewDelegate {
    func expandableTableView(_ expandableTableView: LUExpandableTableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        /// Returning `UITableViewAutomaticDimension` value on iOS 9 will cause reloading all cells due to an iOS 9 bug with automatic dimensions
        let CellHeight = lblHeightChecker.text?.height(constraintedWidth: lblHeightChecker.frame.width, font: lblHeightChecker.font)
        print(CellHeight)
       
        return CellHeight!+4.0
    }
    
    func expandableTableView(_ expandableTableView: LUExpandableTableView, heightForHeaderInSection section: Int) -> CGFloat {
        /// Returning `UITableViewAutomaticDimension` value on iOS 9 will cause reloading all cells due to an iOS 9 bug with automatic dimensions
        return 55
    }
    
    // MARK: - Optional
    
    func expandableTableView(_ expandableTableView: LUExpandableTableView, didSelectRowAt indexPath: IndexPath) {
        print("Did select cell at section \(indexPath.section) row \(indexPath.row)")
    }
    
    func expandableTableView(_ expandableTableView: LUExpandableTableView, didSelectSectionHeader sectionHeader: LUExpandableTableViewSectionHeader, atSection section: Int) {
        print("Did select section header at section \(section)")
    }
    
    func expandableTableView(_ expandableTableView: LUExpandableTableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("Will display cell at section \(indexPath.section) row \(indexPath.row)")
    }
    
    func expandableTableView(_ expandableTableView: LUExpandableTableView, willDisplaySectionHeader sectionHeader: LUExpandableTableViewSectionHeader, forSection section: Int) {
        print("Will display section header for section \(section)")
    }
}

