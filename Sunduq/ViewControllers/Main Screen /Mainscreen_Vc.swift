//
//  Mainscreen_Vc.swift
//  Sunduq
//
//  Created by Mandip Kanjiya on 19/07/18.
//  Copyright © 2018 Mandip Kanjiya. All rights reserved.
//

import UIKit
import UPCarouselFlowLayout
import CHIPageControl
import Alamofire
import SwiftyJSON


class Mainscreen_Vc: UIViewController,UICollectionViewDelegate , UICollectionViewDataSource, HttpWrapperDelegate {
    
    @IBOutlet weak var Collectionview: UICollectionView!
    @IBOutlet weak var viewUpMenu: UIView!
    @IBOutlet weak var viewMain: UIView!
    var SelectedPage = 0
    var pageControl:CHIPageControlJalapeno = CHIPageControlJalapeno()
    var MenuButton:UIButton = UIButton()
    var btnGameStart:UIButton = UIButton()
    var imgUser:UIImageView = UIImageView()
    var flagSideMenuOpne:Bool = true
    var ViewHight:Float = Float()
    var SqurHeight = 0.0
   var idMeinView = CGRect()
    let arrcolor = ["6A3893","75F2C3","29EEFD","FCBA27"]
    let arrIndex = [0,1,0,0]
    fileprivate let cellIdentifier = "CollectionList_Cell"
    fileprivate let cellIdentifierIpad = "CollectionList_Cell_Ipad"
    
    @IBOutlet weak var btnHome: UIButton!
    @IBOutlet weak var btnWallet: UIButton!
    @IBOutlet weak var btnRules: UIButton!
    @IBOutlet weak var btnLeaderboard: UIButton!
    @IBOutlet weak var btnFaq: UIButton!
    @IBOutlet weak var btnLogOut: UIButton!
    @IBOutlet weak var btnInviteFreinds: UIButton!
    @IBOutlet weak var btnContactUs: UIButton!
    
    var identityCollectionView = CGRect()
    
    var idBtnHome = CGRect()
    var idBtnWallet = CGRect()
    var idBtnRules = CGRect()
    var idBtnInvite = CGRect()
    var idBtnLogout = CGRect()
    var idBtnFaq = CGRect()
    var idBtnContect = CGRect()
    var idBtnLeaderboard = CGRect()
    
    var arrContestList:NSMutableArray = NSMutableArray()
    
    // MARK: HttpWrapper objects
    
    var objAllContest = HttpWrapper()
    var net:NetworkReachabilityManager = NetworkReachabilityManager()!
    
    func setFontandColor(){
        //MARK: - Font
        btnHome.titleLabel?.font = UIFont.init(name: FontMedium, size: 14)
        btnWallet.titleLabel?.font = UIFont.init(name: FontMedium, size: 14)
        btnRules.titleLabel?.font = UIFont.init(name: FontMedium, size: 14)
        btnLeaderboard.titleLabel?.font = UIFont.init(name: FontMedium, size: 14)
        btnFaq.titleLabel?.font = UIFont.init(name: FontMedium, size: 14)
        btnLogOut.titleLabel?.font = UIFont.init(name: FontMedium, size: 14)
        btnContactUs.titleLabel?.font = UIFont.init(name: FontMedium, size: 14)
        btnInviteFreinds.titleLabel?.font = UIFont.init(name: FontMedium, size: 14)
        
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
        viewMain.backgroundColor = ColorAppRed
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UserDefaults.standard.value(forKey: kCustomerId))
        setFontandColor()
        self.viewMain.backgroundColor = ColorAppRed
        let Ipadnib = UINib(nibName: cellIdentifierIpad, bundle: nil)
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        Collectionview.register(Ipadnib, forCellWithReuseIdentifier: cellIdentifierIpad)
        Collectionview.register(nib, forCellWithReuseIdentifier: cellIdentifier)
        Collectionview.delegate   = self
        Collectionview.dataSource = self
       
        let devWid = self.view.frame.width;
        let devHei = self.view.frame.height;
      
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
        self.viewMain.layer.addSublayer(shapeLayer)
        
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
        
        // MARK: - Button Game Start
        let imgHeight = devHei/6
        let newhight = imgHeight/4
        let value = devWid/6/2
        let space = value/6
        let space2 = value/3
        let divideHight = devWid/6-space2
        
        btnGameStart.frame = CGRect(x: devWid/2-value+space, y: devWid/12+space, width:devWid/6-space2, height: devWid/6-space2)
        let origImage = UIImage(named: "menu")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
       // btnGameStart.setImage(tintedImage, for: .normal)
        btnGameStart.tintColor = ColorAppGreen
        btnGameStart.addTarget(self, action:#selector(self.OnclickBtnGameStart), for: .touchUpInside)
        self.viewMain.addSubview(btnGameStart)
        
        // Part 2
        setLayoutForDevice()
       
       
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        idMeinView = self.viewMain.frame
        Collectionview.reloadData()
        self.identityCollectionView = Collectionview.frame
        
        idBtnHome = btnHome.frame
        idBtnWallet = btnWallet.frame
        idBtnFaq = btnFaq.frame
        idBtnRules = btnRules.frame
        idBtnInvite = btnInviteFreinds.frame
        idBtnLogout = btnLogOut.frame
        idBtnContect = btnContactUs.frame
        idBtnLeaderboard = btnLeaderboard.frame
        
    }

    override func viewWillAppear(_ animated: Bool) {
        self.objAllContest = HttpWrapper.init()
        self.objAllContest.delegate = self
        print(kGetAllContext)
        callGet(paramString: kGetAllContext, objCall: objAllContest)
    }
// MARK: - SideMenu Buttons Action
    
    // MARK: - onClickBtnFAQ Action
    @IBAction func onClickBtnFAQ(_ sender: Any)
    {
        let nextViewController = objFAQ.instantiateViewController(withIdentifier: "FAQMain_Vc")as! FAQMain_Vc
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    // MARK: - onClickBtnWallet Action
    @IBAction func onClickBtnWallet(_ sender: Any)
    {
        let nextViewController = objWallet.instantiateViewController(withIdentifier: "Wallet_Vc")as! Wallet_Vc
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    // MARK: - onClickBtnWallet Action
    @IBAction func onClickBtnRules(_ sender: Any)
    {
        let nextViewController = objGame.instantiateViewController(withIdentifier: "QuestionAnswerVC")as! QuestionAnswerVC
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
     // MARK: - CollectionView Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrContestList.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let Squrheight = self.view.frame.width/3
       
        var FinelCell:UICollectionViewCell = UICollectionViewCell()
       
        if UIDevice().userInterfaceIdiom == .phone
        {
            let cell = Collectionview.dequeueReusableCell(withReuseIdentifier: "CollectionList_Cell", for: indexPath) as! CollectionList_Cell
            
//            let currentContest = arrContestList[indexPath.row]
            print(arrContestList.object(at: indexPath.row))
            if(arrContestList.count > 0) {
                if let strContestName = (arrContestList.object(at: indexPath.row) as! NSDictionary).value(forKey: "cContestName") as? String {
                    cell.lblContestName.text = strContestName
                }
                
                cell.lblSetAlarm.text = "No Alarm"
                
                //                if let strContestName = (arrContestList.object(at: indexPath.row) as! NSDictionary).value(forKey: "cRewardPoolName") as? String {
                //                    cell.lblSetAlarm.text = "No Alarm"
                //                }
                
                if let strRewardPool = (arrContestList.object(at: indexPath.row) as! NSDictionary).value(forKey: "fRewardPool") as? NSNumber {
                    cell.lblRewardPool.text = "\(strRewardPool)K AED"
                }
                
                if let strRewardPoolName = (arrContestList.object(at: indexPath.row) as! NSDictionary).value(forKey: "cRewardPoolName") as? String {
                    cell.lblRewardPoolName.text = strRewardPoolName
                }
                
                if let strSponsorName = (arrContestList.object(at: indexPath.row) as! NSDictionary).value(forKey: "cSponsorName") as? String {
                    cell.lblSponsoredBy.text = "Sponsored by \(strSponsorName)"
                }
                
                let color = arrcolor[indexPath.row]
                
                let ChnageColor = arrIndex[indexPath.row]
                
                //            print(pageControl.progress)
                if SelectedPage == indexPath.row
                {
                    cell.lblLineColor.backgroundColor =  UIColor.clear
                    // cell.lblLineColor.isHidden = true
                }
                else
                {
                    cell.lblLineColor.backgroundColor =  whiteColor
                    // cell.lblLineColor.isHidden = false
                }
                let vallue = cell.contentView.frame.width/6
                
                let height =  UIScreen.main.bounds.size.width / 3
                
                cell.viewBackGroundColor.translatesAutoresizingMaskIntoConstraints = true
                cell.viewBackGroundColor.frame = CGRect(x: 0, y: 0, width: cell.MainView.frame.width+3, height: height)
                
                cell.ViewCenter.translatesAutoresizingMaskIntoConstraints = true
                cell.ViewCenter.frame = CGRect(x: 0, y: height, width: cell.MainView.frame.width+3, height: height)
                
                cell.viewBottom.translatesAutoresizingMaskIntoConstraints = true
                cell.viewBottom.frame = CGRect(x: 0, y: height*2, width: cell.MainView.frame.width+3, height: 57)
                
                cell.viewBackGroundColor.backgroundColor = UIColor.init(hexString: color)
                //        cell.ImgCarLogo.frame = CGRect(x: cell.contentView.frame.width/2-vallue , y:26, width: cell.contentView.frame.width/3, height: cell.contentView.frame.width/3)
                cell.contentView.layer.cornerRadius = 15
                
            }
            FinelCell = cell
        }
        else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifierIpad, for: indexPath) as! CollectionList_Cell_Ipad
            
            let color = arrcolor[indexPath.row]
            if SelectedPage == indexPath.row
            {
                cell.lblLineColor.backgroundColor =  UIColor.clear
                // cell.lblLineColor.isHidden = true
            }
            else
            {
                cell.lblLineColor.backgroundColor =  whiteColor
                // cell.lblLineColor.isHidden = false
            }
            
//            let vallue = cell.contentView.frame.width/6
//            let height =  UIScreen.main.bounds.size.height / 2 + 60
//             cell.viewBackGroundColor.translatesAutoresizingMaskIntoConstraints = true
//            cell.viewBackGroundColor.frame = CGRect(x: 0 , y: 0, width:  cell.MainView.frame.width, height: height/2-100)
           cell.viewBackGroundColor.backgroundColor = UIColor.init(hexString: color)
            //        cell.ImgCarLogo.frame = CGRect(x: cell.contentView.frame.width/2-vallue , y:26, width: cell.contentView.frame.width/3, height: cell.contentView.frame.width/3)
            cell.contentView.layer.cornerRadius = 30
            FinelCell = cell
        }
        return FinelCell
    }
 
    func ReloadData(RowAtIndex:Int)
    {
        for (index, element) in arrcolor.enumerated() {
            print("Item \(index): \(element)")
        
            if index == RowAtIndex
            {
                
            }
            else
            {
                let indexPath = IndexPath(item: index, section: 0)
                
                let cell = Collectionview.reloadItems(at: [indexPath])
//                contestiPhoneCell
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if(arrContestList.count > 0) {
            if let strContestId = (arrContestList.object(at: indexPath.row) as! NSDictionary).value(forKey: "nContestId") as? NSNumber {
                let nextViewController = objGame.instantiateViewController(withIdentifier: "QuestionAnswerVC")as! QuestionAnswerVC
                nextViewController.strContestId = "\(strContestId)"
                self.navigationController?.pushViewController(nextViewController, animated: true)
            }
        }
    }
   
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
        let index = scrollView.contentOffset.x / witdh
        let roundedIndex = ceil(index)
        print(roundedIndex)
        SelectedPage = Int(roundedIndex)
        pageControl.set(progress: Int(roundedIndex), animated: true)
        Collectionview.reloadData()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //Change the current page
//        let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
//        let index = scrollView.contentOffset.x / witdh
//        let roundedIndex = ceil(index)
//        print(roundedIndex)
//        SelectedPage = Int(roundedIndex)
//       pageControl.set(progress: Int(roundedIndex), animated: true)
//        Collectionview.reloadData()
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     // MARK: - OnclickBtnGameStart
    
    @objc func OnclickBtnGameStart()
    {
//        let nextViewController = objGame.instantiateViewController(withIdentifier: "QuestionAnswerVC")as! QuestionAnswerVC
//        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
   // MARK: - Side Menu Click Method
    
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
            UIView.transition(with: self.Collectionview, duration: 0.9, options: .transitionFlipFromTop, animations: {
                self.viewMain.frame = CGRect(x:self.viewMain.frame.origin.x, y: devHei-OnePartHeight, width: self.viewMain.frame.width, height: self.viewMain.frame.height)
                
                 self.Collectionview.frame =  CGRect(x: self.view.frame.origin.x, y: self.view.frame.size.height, width: self.Collectionview.frame.width, height: self.Collectionview.frame.height)
               
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
          
            
            UIView.transition(with: self.Collectionview, duration: 0.9, options: .transitionFlipFromBottom, animations: {
                
                self.Collectionview.frame = self.identityCollectionView
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
        print("Button Clicked")
    }
    
    func setLayoutForDevice(){
        let devWid = self.view.frame.width;
        let devHei = self.view.frame.height;
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
                
            case 1334,1920,1136:
                print("iPhone 6/6S/7/8")
              
                
                //4
                let imageView4 = UIImageView()
                imageView4.frame = CGRect(origin: CGPoint(x: 0,y :devHei-devWid*2/3), size: CGSize(width: devWid/3, height: devWid/3))
                imageView4.backgroundColor = UIColor(red: 105/255, green: 60/255, blue: 145/255, alpha: 1.0)
                self.viewMain.addSubview(imageView4)
                //
                //5 (Circle-big)
                let circlePath2 = UIBezierPath(arcCenter: CGPoint(x: devWid/3,y: devHei-devWid*2/6), radius: CGFloat(devWid/3), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
                
                let shapeLayer2 = CAShapeLayer()
                shapeLayer2.path = circlePath2.cgPath
                // change the fill color
                shapeLayer2.fillColor = UIColor(red: 59/255, green: 238/255, blue: 251/255, alpha: 1.0).cgColor
                viewMain.layer.addSublayer(shapeLayer2)
                
                //6-red rect
                let imageView5 = UIImageView()
                imageView5.frame = CGRect(origin: CGPoint(x: 0,y :devHei-devWid/3), size: CGSize(width: devWid/3, height: devWid*2/3))
                imageView5.backgroundColor = UIColor(red: 235/255, green: 64/255, blue: 109/255, alpha: 1.0)
                self.viewMain.addSubview(imageView5)
                ////
                ////        //7 3poly-bo
                let shape2 = CAShapeLayer()
                shape2.opacity = 1
                shape2.lineJoin = kCALineJoinMiter
                shape2.fillColor = UIColor(red: 105/255, green: 60/255, blue: 145/255, alpha: 1.0).cgColor
                ////
                let path2 = UIBezierPath()
                path2.move(to: CGPoint(x: 0, y: devHei-devWid*2/6))
                path2.addLine(to: CGPoint(x: devWid/3, y: devHei-devWid*2/6))
                path2.addLine(to: CGPoint(x: devWid/3, y: devHei))
                path2.close()
                shape2.path = path2.cgPath
                self.viewMain.layer.addSublayer(shape2)
                //
                ////        //8 yellow rect
                let imageView6 = UIImageView()
                imageView6.frame = CGRect(origin: CGPoint(x: devWid/3,y :devHei-devWid*2/3), size: CGSize(width: devWid/3, height: devWid*2/3))
                imageView6.backgroundColor = UIColor(red: 251/255, green: 188/255, blue: 83/255, alpha: 1.0)
                self.viewMain.addSubview(imageView6)
                ////
                ////        //9
                let imageView7 = UIImageView()
                imageView7.frame = CGRect(origin: CGPoint(x: devWid*2/3,y :devHei-devWid*2/3), size: CGSize(width: devWid/3, height: devWid/3))
                imageView7.backgroundColor = UIColor(red: 122/255, green: 241/255, blue: 196/255, alpha: 1.0)
                self.viewMain.addSubview(imageView7)
                ////
                let imageView8 = UIImageView()
                imageView8.frame = CGRect(origin: CGPoint(x: devWid*2/3,y :devHei-devWid/3), size: CGSize(width: devWid/3, height: devWid/3))
                imageView8.backgroundColor = UIColor(red: 59/255, green: 238/255, blue: 251/255, alpha: 1.0)
                self.viewMain.addSubview(imageView8)
                
                // MARK: - Side Menu
                MenuButton.frame = CGRect(x: self.view.frame.origin.x+26, y: devWid/6-10, width:18, height: 18)
                let origImage = UIImage(named: "menu")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                MenuButton.setImage(tintedImage, for: .normal)
                MenuButton.tintColor = ColorAppGreen
                MenuButton.addTarget(self, action:#selector(self.MenuClicked), for: .touchUpInside)
                self.viewMain.addSubview(MenuButton)
                
                let imgHeight = devHei/6
                let newhight = imgHeight/4
                let value = devWid/6/2
                let space = value/6
                let space2 = value/3
                let divideHight = devWid/6-space2
                imgUser.frame = CGRect(x: devWid/2-value+space, y: devWid/12+space, width:devWid/6-space2, height: devWid/6-space2)
                imgUser.layer.cornerRadius = divideHight/2
                imgUser.clipsToBounds = true
                imgUser.contentMode = .scaleToFill
                //imgUser.translatesAutoresizingMaskIntoConstraints = false
                imgUser.image = UIImage.init(named: "PersonImage")
                imgUser.isUserInteractionEnabled = true
                let tapImage = UITapGestureRecognizer(target: self, action: #selector(self.openImagePicker(_:)))
                
                //CollectionView
                let height1 = devWid/3*2+57
                let layout = UPCarouselFlowLayout()
                layout.itemSize = CGSize(width: devWid-52, height: height1)
                layout.scrollDirection = .horizontal
                layout.sideItemScale = 0.75
               
                layout.sideItemAlpha = 1.0
                
                
                //self.automaticallyAdjustsScrollViewInsets = false
                //layout.spacingMode = 26
                Collectionview.translatesAutoresizingMaskIntoConstraints = true
                let height =  devHei/2+57
                let value1 = height/2
                Collectionview.frame = CGRect(x: 0, y: devHei-devWid*2/3-value1+28, width: devWid, height: devHei/2+57)
                Collectionview.collectionViewLayout = layout
                
                Collectionview.backgroundColor = UIColor.clear
                self.viewMain.addSubview(Collectionview)
                self.viewMain.addSubview(imgUser)
                
                pageControl = CHIPageControlJalapeno(frame: CGRect(x: 0, y:Collectionview.frame.origin.y+Collectionview.frame.size.height-10, width: devWid, height: 20))
                pageControl.numberOfPages = arrContestList.count
                pageControl.radius = 4
                pageControl.tintColor = whiteColor
                pageControl.currentPageTintColor = whiteColor
                pageControl.padding = 6
                
//                pageControl.radius = 5
//                pageControl.padding = 10
//                pageControl.inactiveTintColor = UIColor.white.withAlphaComponent(0.4)
//                pageControl.currentPageTintColor = whiteColor
//                pageControl.borderWidth = 1
//                pageControl.borderColor = UIColor.black.withAlphaComponent(0.4)
                
                // pageControl.intrinsicContentSize = CGSize(width: 50, height: 50)
                self.viewMain.addSubview(pageControl)
               
            case 2436, 2208:
                
                
                let imageView4 = UIImageView()
                imageView4.frame = CGRect(origin: CGPoint(x: 0,y :devHei-devWid), size: CGSize(width: devWid/3, height: devWid/3))
                imageView4.backgroundColor = UIColor(red: 105/255, green: 60/255, blue: 145/255, alpha: 1.0)
                self.viewMain.addSubview(imageView4)
                
                //5 (Circle-big)
                let circlePath2 = UIBezierPath(arcCenter: CGPoint(x: devWid/3,y: devHei-devWid*2/3), radius: CGFloat(devWid/3), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
                
                let shapeLayer2 = CAShapeLayer()
                shapeLayer2.path = circlePath2.cgPath
                // change the fill color
                shapeLayer2.fillColor = UIColor(red: 59/255, green: 238/255, blue: 251/255, alpha: 1.0).cgColor
                viewMain.layer.addSublayer(shapeLayer2)
                
                //6-red rect
                let imageView5 = UIImageView()
                imageView5.frame = CGRect(origin: CGPoint(x: 0,y :devHei-devWid*2/3), size: CGSize(width: devWid/3, height: devWid*2/3))
                imageView5.backgroundColor = UIColor(red: 235/255, green: 64/255, blue: 109/255, alpha: 1.0)
                self.viewMain.addSubview(imageView5)
                
                //7 3poly-bo
                let shape2 = CAShapeLayer()
                shape2.opacity = 1
                shape2.lineJoin = kCALineJoinMiter
                shape2.fillColor = UIColor(red: 105/255, green: 60/255, blue: 145/255, alpha: 1.0).cgColor
                
                let path2 = UIBezierPath()
                path2.move(to: CGPoint(x: 0, y: devHei-devWid*2/3))
                path2.addLine(to: CGPoint(x: devWid/3, y: devHei-devWid*2/3))
                path2.addLine(to: CGPoint(x: devWid/3, y: devHei-devWid/3))
                path2.close()
                shape2.path = path2.cgPath
                self.viewMain.layer.addSublayer(shape2)
                
                //8 yellow rect
                let imageView6 = UIImageView()
                imageView6.frame = CGRect(origin: CGPoint(x: devWid/3,y :devHei-devWid), size: CGSize(width: devWid/3, height: devWid*2/3))
                imageView6.backgroundColor = UIColor(red: 251/255, green: 188/255, blue: 83/255, alpha: 1.0)
                self.viewMain.addSubview(imageView6)
                
                //9
                let imageView7 = UIImageView()
                imageView7.frame = CGRect(origin: CGPoint(x: devWid*2/3,y :devHei-devWid), size: CGSize(width: devWid/3, height: devWid/3))
                imageView7.backgroundColor = UIColor(red: 122/255, green: 241/255, blue: 196/255, alpha: 1.0)
                self.viewMain.addSubview(imageView7)
                
                let imageView8 = UIImageView()
                imageView8.frame = CGRect(origin: CGPoint(x: devWid*2/3,y :devHei-devWid*2/3), size: CGSize(width: devWid/3, height: devWid/3))
                imageView8.backgroundColor = UIColor(red: 59/255, green: 238/255, blue: 251/255, alpha: 1.0)
                self.viewMain.addSubview(imageView8)
                
                let imageView9 = UIImageView()
                imageView9.frame = CGRect(origin: CGPoint(x: devWid/3,y :devHei-devWid/3), size: CGSize(width: devWid/3, height: devWid/3))
                imageView9.backgroundColor = UIColor(red: 122/255, green: 241/255, blue: 196/255, alpha: 1.0)
                self.viewMain.addSubview(imageView9)
                
                let imageView10 = UIImageView()
                imageView10.frame = CGRect(origin: CGPoint(x: devWid*2/3,y :devHei-devWid/3), size: CGSize(width: devWid/3, height: devWid/3))
                imageView10.backgroundColor = UIColor(red: 105/255, green: 60/255, blue: 145/255, alpha: 1.0)
                self.viewMain.addSubview(imageView10)
                
                // MARK: - Side Menu
                MenuButton.frame = CGRect(x: self.view.frame.origin.x+26, y: devWid/6-10, width:18, height: 18)
                let origImage = UIImage(named: "menu")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                MenuButton.setImage(tintedImage, for: .normal)
                MenuButton.tintColor = ColorAppGreen
                MenuButton.addTarget(self, action:#selector(self.MenuClicked), for: .touchUpInside)
                self.viewMain.addSubview(MenuButton)
                
                let imgHeight = devHei/6
                let newhight = imgHeight/4
                let value = devWid/6/2
                let space = value/6
                let space2 = value/3
                let divideHight = devWid/6-space2
                imgUser.frame = CGRect(x: devWid/2-value+space, y: devWid/12+space, width:devWid/6-space2, height: devWid/6-space2)
                imgUser.layer.cornerRadius = divideHight/2
                imgUser.clipsToBounds = true
                imgUser.contentMode = .scaleToFill
                //imgUser.translatesAutoresizingMaskIntoConstraints = false
                imgUser.image = UIImage.init(named: "PersonImage")
                
               
                
                //CollectionView
                let height1 = devWid/3*2+57
                let layout = UPCarouselFlowLayout()
                layout.itemSize = CGSize(width: devWid-52, height:height1)
                layout.scrollDirection = .horizontal
                layout.sideItemScale = 0.75
                layout.sideItemAlpha = 1.0
                
                
                //self.automaticallyAdjustsScrollViewInsets = false
                //layout.spacingMode = 26
                Collectionview.translatesAutoresizingMaskIntoConstraints = true
                let height =  devHei/2+57
                let value1 = height/2
                Collectionview.frame = CGRect(x: 0, y: devHei-devWid-value1+28, width: devWid, height: devHei/2+57)
                Collectionview.collectionViewLayout = layout
                
                Collectionview.backgroundColor = UIColor.clear
                self.viewMain.addSubview(Collectionview)
                self.viewMain.addSubview(imgUser)
                print("iPhone X")
            default:
                print("unknown")
                
            }
        }
        else
        {
            
            //4
            let imageView4 = UIImageView()
            imageView4.frame = CGRect(origin: CGPoint(x: 0,y :devHei-devWid*2/3), size: CGSize(width: devWid/3, height: devWid/3))
            imageView4.backgroundColor = UIColor(red: 105/255, green: 60/255, blue: 145/255, alpha: 1.0)
            self.viewMain.addSubview(imageView4)
            //
            //5 (Circle-big)
            let circlePath2 = UIBezierPath(arcCenter: CGPoint(x: devWid/3,y: devHei-devWid*2/6), radius: CGFloat(devWid/3), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
            
            let shapeLayer2 = CAShapeLayer()
            shapeLayer2.path = circlePath2.cgPath
            // change the fill color
            shapeLayer2.fillColor = UIColor(red: 59/255, green: 238/255, blue: 251/255, alpha: 1.0).cgColor
            viewMain.layer.addSublayer(shapeLayer2)
            
            //6-red rect
            let imageView5 = UIImageView()
            imageView5.frame = CGRect(origin: CGPoint(x: 0,y :devHei-devWid/3), size: CGSize(width: devWid/3, height: devWid*2/3))
            imageView5.backgroundColor = UIColor(red: 235/255, green: 64/255, blue: 109/255, alpha: 1.0)
            self.viewMain.addSubview(imageView5)
            ////
            ////        //7 3poly-bo
            let shape2 = CAShapeLayer()
            shape2.opacity = 1
            shape2.lineJoin = kCALineJoinMiter
            shape2.fillColor = UIColor(red: 105/255, green: 60/255, blue: 145/255, alpha: 1.0).cgColor
            ////
            let path2 = UIBezierPath()
            path2.move(to: CGPoint(x: 0, y: devHei-devWid*2/6))
            path2.addLine(to: CGPoint(x: devWid/3, y: devHei-devWid*2/6))
            path2.addLine(to: CGPoint(x: devWid/3, y: devHei))
            path2.close()
            shape2.path = path2.cgPath
            self.viewMain.layer.addSublayer(shape2)
            //
            ////        //8 yellow rect
            let imageView6 = UIImageView()
            imageView6.frame = CGRect(origin: CGPoint(x: devWid/3,y :devHei-devWid*2/3), size: CGSize(width: devWid/3, height: devWid*2/3))
            imageView6.backgroundColor = UIColor(red: 251/255, green: 188/255, blue: 83/255, alpha: 1.0)
            self.viewMain.addSubview(imageView6)
            ////
            ////        //9
            let imageView7 = UIImageView()
            imageView7.frame = CGRect(origin: CGPoint(x: devWid*2/3,y :devHei-devWid*2/3), size: CGSize(width: devWid/3, height: devWid/3))
            imageView7.backgroundColor = UIColor(red: 122/255, green: 241/255, blue: 196/255, alpha: 1.0)
            self.viewMain.addSubview(imageView7)
            ////
            let imageView8 = UIImageView()
            imageView8.frame = CGRect(origin: CGPoint(x: devWid*2/3,y :devHei-devWid/3), size: CGSize(width: devWid/3, height: devWid/3))
            imageView8.backgroundColor = UIColor(red: 59/255, green: 238/255, blue: 251/255, alpha: 1.0)
            self.viewMain.addSubview(imageView8)
            
            // MARK: - Side Menu
            MenuButton.frame = CGRect(x: self.view.frame.origin.x+52, y: devWid/6-20, width:36, height: 36)
            let origImage = UIImage(named: "menu")
            let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
            MenuButton.setImage(tintedImage, for: .normal)
            MenuButton.tintColor = ColorAppGreen
            MenuButton.addTarget(self, action:#selector(self.MenuClicked), for: .touchUpInside)
            self.viewMain.addSubview(MenuButton)
            
            let imgHeight = devHei/6
            let newhight = imgHeight/4
            let value = devWid/6/2
            let space = value/6
            let space2 = value/3
            let divideHight = devWid/6-space2
            imgUser.frame = CGRect(x: devWid/2-value+space, y: devWid/12+space, width:devWid/6-space2, height: devWid/6-space2)
            imgUser.layer.cornerRadius = divideHight/2
            imgUser.clipsToBounds = true
            imgUser.contentMode = .scaleToFill
            //imgUser.translatesAutoresizingMaskIntoConstraints = false
            imgUser.image = UIImage.init(named: "PersonImage")
            
            //CollectionView
            
            let height1 = devWid/3*2+114
            let layout = UPCarouselFlowLayout()
            layout.itemSize = CGSize(width: devWid-104, height: height1)
            layout.scrollDirection = .horizontal
            layout.sideItemScale = 0.75
            layout.sideItemAlpha = 1.0
            layout.spacingMode = UPCarouselFlowLayoutSpacingMode.fixed(spacing: 26)
            
            //self.automaticallyAdjustsScrollViewInsets = false
            //layout.spacingMode = 26
            Collectionview.translatesAutoresizingMaskIntoConstraints = true
            let height =  devHei/2+57
            let value1 = height/2
            Collectionview.frame = CGRect(x: 0, y: devHei-devWid*2/3-value1+29, width: devWid, height: height1)
            Collectionview.collectionViewLayout = layout
            
            Collectionview.backgroundColor = UIColor.clear
            self.viewMain.addSubview(Collectionview)
            self.viewMain.addSubview(imgUser)
            
          pageControl = CHIPageControlJalapeno(frame: CGRect(x: 0, y:Collectionview.frame.origin.y+Collectionview.frame.size.height+20, width: devWid, height: 20))
            pageControl.numberOfPages = 4
            pageControl.radius = 7
            pageControl.tintColor = whiteColor
            pageControl.currentPageTintColor = whiteColor
            pageControl.padding = 6
            // pageControl.intrinsicContentSize = CGSize(width: 50, height: 50)
            self.viewMain.addSubview(pageControl)
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: HttpWrapperDelegates
    
    func HttpWrapperfetchDataSuccess(wrapper: HttpWrapper, dicsResponse: NSMutableDictionary) {
        AppHelper.hideLoadingView()
        print(dicsResponse)
        if  wrapper == objAllContest {
            if dicsResponse.value(forKey: "success") as! NSNumber == 1
            {
                if let tempNames: NSArray = dicsResponse.value(forKey: "response") as? NSArray
                {
                    arrContestList = tempNames.mutableCopy() as! NSMutableArray
                    let devWid = self.view.frame.width;
                    let devHei = self.view.frame.height;
                    
                    pageControl = CHIPageControlJalapeno(frame:  CGRect(x: 0, y:Collectionview.frame.origin.y+Collectionview.frame.size.height-50, width: devWid, height: 20))
                    pageControl.numberOfPages = arrContestList.count
                    pageControl.radius = 4
                    pageControl.tintColor = whiteColor
                    pageControl.currentPageTintColor = whiteColor
                    pageControl.padding = 6
                    
                    
                    
                    
                    // pageControl.intrinsicContentSize = CGSize(width: 50, height: 50)
                    self.viewMain.addSubview(pageControl)
                }
                Collectionview.reloadData()
            }else{
                AppHelper.showAlert(kAlertTitle, message: dicsResponse.value(forKey: "message") as! String)
            }
        }
    }
    
    func HttpWrapperfetchDataFail(wrapper: HttpWrapper, error: NSError) {
        print(error)
    }
    
    
    func callPost(dictParameters:[String:AnyObject], objCall:HttpWrapper, callUrl:String){
        if net.isReachable == false
        {
            let alert = UIAlertController(title: internetConnectedTitle, message: internetConnected, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            AppHelper.showLoadingView()
            objCall.requestWithparamdictParamPostMethod(url:callUrl, dicsParams: dictParameters)
        }
    }
    
    func callGet(paramString:String, objCall:HttpWrapper){
        if net.isReachable == false
        {
            let alert = UIAlertController(title: internetConnectedTitle, message: internetConnected, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            AppHelper.showLoadingView()
            objCall.requestWithparamdictParam(paramString)
        }
    }
    
    @objc func openImagePicker(_ sender: UITapGestureRecognizer) {
        print("Dhruv...!")
    }
    
}
