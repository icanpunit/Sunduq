    //
//  QuestionAnswerVC.swift
//  Sunduq
//
//  Created by Mandip Kanjiya on 18/07/18.
//  Copyright © 2018 I Can Infotech. All rights reserved.
//

import UIKit
import UPCarouselFlowLayout
import CHIPageControl
import Alamofire
import SwiftyJSON


class QuestionAnswerVC: UIViewController,HttpWrapperDelegate {
    
    
    
    //MARK:- IBoutlet
    @IBOutlet weak var btnOptionB: UIButton!
    @IBOutlet weak var btnOptionA: UIButton!
    @IBOutlet weak var btnOptionC: UIButton!
    @IBOutlet weak var lblTimer: UILabel!
    
    @IBOutlet weak var BottomVC: UIView!
    @IBOutlet weak var lblQuestion: UILabel!
    //MARK:- Varible Declare
    let ColorAppRed = UIColor(hexString: "EE3D6B")
    let ColorAppGreen = UIColor(hexString: "75F2C3")
    let ColorAppSky = UIColor(hexString: "29EEFD")
    let ColorAppOrange = UIColor(hexString: "FCBA27")
    let ColorPurple = UIColor(hexString: "6A3893")
    var strContestId: String = String()
    // MARK: HttpWraper Objects
    var objGetAllQuestions = HttpWrapper();
    var objGetSelectedQuestionAnswer = HttpWrapper();
    var objSelectedAnser = HttpWrapper();
    var net:NetworkReachabilityManager = NetworkReachabilityManager()!
    
    var arrQuestionList:NSMutableArray = NSMutableArray()
    var decOptionA:NSDictionary = NSDictionary()
    var decOptionB:NSDictionary = NSDictionary()
    var decOptionC:NSDictionary = NSDictionary()
    var arrQuestionAnswerList:NSMutableArray = NSMutableArray()
    var nQuestionId:NSNumber = NSNumber()
    var currentQuestionCount:Int = 0
    var isAnserTrue:Bool = true
    var timeCounter:Int = Int()
    var timer:Timer = Timer()
    //MARK:- UIView Method
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UserDefaults.standard.value(forKey: kCustomerId))
        lblQuestion.isHidden = true
        btnOptionA.isHidden = true
        btnOptionA.title(for: UIControlState.normal)
        btnOptionB.isHidden = true
        btnOptionB.title(for: UIControlState.normal)
        btnOptionC.isHidden = true
        btnOptionC.title(for: UIControlState.normal)
        
        let devWid = self.view.frame.width;
        let devHei = self.view.frame.height;
        self.navigationController?.isNavigationBarHidden = true
        let imageView4 = UIImageView()
        imageView4.frame = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: devWid/3, height: devWid/3))
        imageView4.backgroundColor = UIColor(red: 105/255, green: 60/255, blue: 145/255, alpha: 1.0)
        self.view.addSubview(imageView4)
        
        //5 (Circle-big)
        let circlePath2 = UIBezierPath(arcCenter: CGPoint(x: devWid/3,y: devWid/3), radius: CGFloat(devWid/3), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        let shapeLayer2 = CAShapeLayer()
        shapeLayer2.path = circlePath2.cgPath
        // change the fill color
        shapeLayer2.fillColor = UIColor(red: 59/255, green: 238/255, blue: 251/255, alpha: 1.0).cgColor
        view.layer.addSublayer(shapeLayer2)
        
        //6-red rect
        let imageView5 = UIImageView()
        imageView5.frame = CGRect(origin: CGPoint(x: 0,y :devWid/3), size: CGSize(width: devWid/3, height: devWid*2/3))
        imageView5.backgroundColor = UIColor(red: 235/255, green: 64/255, blue: 109/255, alpha: 1.0)
        self.view.addSubview(imageView5)
        
        //7 3poly-bo
        let shape2 = CAShapeLayer()
        shape2.opacity = 1
        shape2.lineJoin = kCALineJoinMiter
        shape2.fillColor = UIColor(red: 105/255, green: 60/255, blue: 145/255, alpha: 1.0).cgColor
        
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: 0, y: devWid/3))
        path2.addLine(to: CGPoint(x: devWid/3, y: devWid/3))
        path2.addLine(to: CGPoint(x: devWid/3, y: devWid/3*2))
        path2.close()
        shape2.path = path2.cgPath
        self.view.layer.addSublayer(shape2)
        
        //8 yellow rect
        let imageView6 = UIImageView()
        imageView6.frame = CGRect(origin: CGPoint(x: devWid/3,y :0), size: CGSize(width: devWid/3, height: devWid*2/3))
        imageView6.backgroundColor = UIColor(red: 251/255, green: 188/255, blue: 83/255, alpha: 1.0)
        self.view.addSubview(imageView6)
        
        //9
        let imageView7 = UIImageView()
        imageView7.frame = CGRect(origin: CGPoint(x: devWid*2/3,y :0), size: CGSize(width: devWid/3, height: devWid/3))
        imageView7.backgroundColor = UIColor(red: 122/255, green: 241/255, blue: 196/255, alpha: 1.0)
        self.view.addSubview(imageView7)
        
        let imageView8 = UIImageView()
        imageView8.frame = CGRect(origin: CGPoint(x: devWid*2/3,y :devWid/3), size: CGSize(width: devWid/3, height: devWid/3))
        imageView8.backgroundColor = UIColor(red: 59/255, green: 238/255, blue: 251/255, alpha: 1.0)
        self.view.addSubview(imageView8)
        
        let imageView9 = UIImageView()
        imageView9.frame = CGRect(origin: CGPoint(x: devWid/3,y :devWid/3*2), size: CGSize(width: devWid/3, height: devWid/3*2))
        imageView9.backgroundColor = UIColor(red: 122/255, green: 241/255, blue: 196/255, alpha: 1.0)
        self.view.addSubview(imageView9)
        
        let imageView10 = UIImageView()
        imageView10.frame = CGRect(origin: CGPoint(x: devWid*2/3,y :devWid/3*2), size: CGSize(width: devWid/3, height: devWid/3))
        imageView10.backgroundColor = UIColor(red: 105/255, green: 60/255, blue: 145/255, alpha: 1.0)
        self.view.addSubview(imageView10)
        
        let imageView11 = UIImageView()
        imageView11.frame = CGRect(origin: CGPoint(x: devWid*2/3,y :devWid/3*3), size: CGSize(width: devWid/3, height: devWid/3))
        imageView11.backgroundColor =  UIColor(red: 235/255, green: 64/255, blue: 109/255, alpha: 1.0)
        self.view.addSubview(imageView11)
        
        let imageView12 = UIImageView()
        imageView12.frame = CGRect(origin: CGPoint(x: 0,y :devWid/3*3), size: CGSize(width: devWid/3, height: devWid/3))
        imageView12.backgroundColor = UIColor(red: 105/255, green: 60/255, blue: 145/255, alpha: 1.0)
        self.view.addSubview(imageView12)
        self.cliptoBoundButton()

         self.view.bringSubview(toFront: self.BottomVC)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let dictParameters:[String:AnyObject] = ["nContestId" : strContestId as AnyObject]
        self.objGetAllQuestions = HttpWrapper.init()
        self.objGetAllQuestions.delegate = self
        callPost(dictParameters: dictParameters, objCall: objGetAllQuestions, callUrl: kGetQuestionsWithAnswer)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.timer.invalidate()
    }
    
//MARK:- Button Action
    //MARK:- onClickBtnOptionA Action
    @IBAction func onClickBtnOptionA(_ sender: UIButton) {
        
        //B
        self.btnOptionB.backgroundColor = whiteColor
        self.btnOptionB.titleLabel?.font = UIFont.init(name: Regular, size: 15)
        
        //C
        self.btnOptionC.backgroundColor = whiteColor
        self.btnOptionC.titleLabel?.font = UIFont.init(name: Regular, size: 15)
        
        UIView.animate(withDuration: 0.2, animations: {
            sender.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
       
        //A
        self.btnOptionA.backgroundColor = self.ColorAppOrange
        
        }) { (true) in
            sender.transform = CGAffineTransform.identity
            
            if let isActive:NSNumber = self.decOptionA.value(forKey: "IsAnswer") as? NSNumber {
                if isActive == 1 {
                    self.lblQuestion.isHidden = true
                    self.btnOptionA.isHidden = true
                    self.btnOptionB.isHidden = true
                    self.btnOptionC.isHidden = true
                    self.btnOptionA.titleLabel?.font = UIFont.init(name: FontBold, size: 15)
                    self.btnOptionA.backgroundColor = whiteColor
                    self.currentQuestionCount = self.currentQuestionCount + 1
                    self.isAnserTrue = true
                }
                else {
                    self.isAnserTrue = false
                }
                let dictParameters:[String:AnyObject] = [
                    "nQuestionId" : self.nQuestionId as AnyObject,
                    "nCustomerId" : UserDefaults.standard.value(forKey: kCustomerId) as AnyObject,
                    "IsAnswer" : isActive as AnyObject,
                    "nAnswerId" : self.decOptionA.value(forKey: "nAnswerId") as AnyObject
                ]
                
                self.objSelectedAnser = HttpWrapper.init()
                self.objSelectedAnser.delegate = self
                self.callPost(dictParameters: dictParameters, objCall: self.objSelectedAnser, callUrl: kGetSelectedAnswer)
//                self.getSelectedQuestionAnswer()
                
            }
        }
    }
    //MARK:- onClickBtnOptionB Action
    @IBAction func onClickBtnOptionB(_ sender: UIButton) {
        
        //A
        self.btnOptionA.backgroundColor = whiteColor
        self.btnOptionA.titleLabel?.font = UIFont.init(name: Regular, size: 15)
        //C
        self.btnOptionC.backgroundColor = whiteColor
        self.btnOptionC.titleLabel?.font = UIFont.init(name: Regular, size: 15)
        
    UIView.animate(withDuration: 0.2, animations: {
            sender.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        
        //B
            self.btnOptionB.backgroundColor = self.ColorAppOrange
        self.btnOptionB.titleLabel?.font = UIFont.init(name: FontBold, size: 15)
        
        }) { (true) in
            sender.transform = CGAffineTransform.identity
            
            if let isActive:NSNumber = self.decOptionB.value(forKey: "IsAnswer") as? NSNumber {
                if isActive == 1 {
                    self.lblQuestion.isHidden = true
                    self.btnOptionA.isHidden = true
                    self.btnOptionB.isHidden = true
                    self.btnOptionC.isHidden = true
                    self.btnOptionB.backgroundColor = whiteColor
                    self.currentQuestionCount = self.currentQuestionCount + 1
//                    self.getSelectedQuestionAnswer()
                    self.isAnserTrue = true
                }
                else {
                    self.isAnserTrue = false
                }
                let dictParameters:[String:AnyObject] = [
                    "nQuestionId" : self.nQuestionId as AnyObject,
                    "nCustomerId" : UserDefaults.standard.value(forKey: kCustomerId) as AnyObject,
                    "IsAnswer" : isActive as AnyObject,
                    "nAnswerId" : self.decOptionA.value(forKey: "nAnswerId") as AnyObject
                ]
                
                self.objSelectedAnser = HttpWrapper.init()
                self.objSelectedAnser.delegate = self
                self.callPost(dictParameters: dictParameters, objCall: self.objSelectedAnser, callUrl: kGetSelectedAnswer)
            }
        }
    }
    //MARK:- onClickBtnOptionC Action
    @IBAction func onClickBtnOptionC(_ sender: UIButton) {
        
        //A
        self.btnOptionA.backgroundColor = whiteColor
        self.btnOptionA.titleLabel?.font = UIFont.init(name: Regular, size: 15)
        
        //B
        self.btnOptionB.backgroundColor = whiteColor
        self.btnOptionB.titleLabel?.font = UIFont.init(name: Regular, size: 15)
        
        UIView.animate(withDuration: 0.2, animations: {
            sender.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
       
        //C
        self.btnOptionC.backgroundColor = self.ColorAppOrange
        self.btnOptionC.titleLabel?.font = UIFont.init(name: FontBold, size: 15)
        }) { (true) in
            sender.transform = CGAffineTransform.identity
            
            if let isActive:NSNumber = self.decOptionC.value(forKey: "IsAnswer") as? NSNumber {
                if isActive == 1 {
                    self.lblQuestion.isHidden = true
                    self.btnOptionA.isHidden = true
                    self.btnOptionB.isHidden = true
                    self.btnOptionC.isHidden = true
                    self.btnOptionC.backgroundColor = whiteColor
                    self.isAnserTrue = true
                }
                else {
                    self.isAnserTrue = false
                }
                let dictParameters:[String:AnyObject] = [
                    "nQuestionId" : self.nQuestionId as AnyObject,
                    "nCustomerId" : UserDefaults.standard.value(forKey: kCustomerId) as AnyObject,
                    "IsAnswer" : isActive as AnyObject,
                    "nAnswerId" : self.decOptionA.value(forKey: "nAnswerId") as AnyObject
                ]
                
                self.objSelectedAnser = HttpWrapper.init()
                self.objSelectedAnser.delegate = self
                self.callPost(dictParameters: dictParameters, objCall: self.objSelectedAnser, callUrl: kGetSelectedAnswer)
            }
            
        }
    }
    func cliptoBoundButton() {
        //
        self.BottomVC.backgroundColor = ColorAppSky
//        self.btnIsco.backgroundColor = ColorAppOrange
        self.btnOptionA.layer.cornerRadius = self.btnOptionA.frame.size.height/2.0
        self.btnOptionA.clipsToBounds = true
        //
        self.btnOptionB.layer.cornerRadius = self.btnOptionB.frame.size.height/2.0
        self.btnOptionB.clipsToBounds = true
        //
        self.btnOptionC.layer.cornerRadius = self.btnOptionC.frame.size.height/2.0
        self.btnOptionC.clipsToBounds = true
        //
        self.BottomVC.layer.cornerRadius = 30.0
        self.BottomVC.clipsToBounds = true
        //
        self.btnOptionA.titleLabel?.font = UIFont.init(name: Regular, size: 15)
        self.btnOptionB.titleLabel?.font = UIFont.init(name: Regular, size: 15)
        self.btnOptionC.titleLabel?.font = UIFont.init(name: Regular, size: 15)
        self.lblQuestion.font = UIFont.init(name: FontBold, size: 15)
        
        self.btnOptionA.setTitleColor(ColorAppBlack, for: .normal)
        self.btnOptionB.setTitleColor(ColorAppBlack, for: .normal)
        self.btnOptionC.setTitleColor(ColorAppBlack, for: .normal)
        self.lblQuestion.textColor = ColorAppBlack
        //
        
    }
    
    // MARK: HttpWrapperDelegate
    
    func HttpWrapperfetchDataSuccess(wrapper: HttpWrapper, dicsResponse: NSMutableDictionary) {
        print(dicsResponse)
        if  wrapper == objGetAllQuestions {
            if dicsResponse.value(forKey: "success") as! NSNumber == 1
            {
                if let arrQues: NSArray = dicsResponse.value(forKey: "response") as? NSArray
                {
                        arrQuestionList = arrQues.mutableCopy() as! NSMutableArray
                        showNextQuestion()
                        print(arrQuestionList)
                }
            }
        }
        
//        if wrapper == objGetSelectedQuestionAnswer {
//            if dicsResponse.value(forKey: "success") as! NSNumber == 1 {
//                if let arrAns: NSArray = dicsResponse.value(forKey: "response") as? NSArray {
//                    arrQuestionAnswerList = arrAns.mutableCopy() as! NSMutableArray
//                }
//            }
//        }
        
        if wrapper == objSelectedAnser {
            if dicsResponse.value(forKey: "success") as! NSNumber == 1 {
                AppHelper.hideLoadingView()
                if let arrAnswerResponse: NSArray = dicsResponse.value(forKey: "response") as? NSArray {

                    if isAnserTrue {
                        self.currentQuestionCount = self.currentQuestionCount + 1
                        if arrQuestionList.count > self.currentQuestionCount {
                                showNextQuestion()
                        }
                        else {
                            timer.invalidate()
                            let nextViewController = objGame.instantiateViewController(withIdentifier: "WinnerListVC")as! WinnerListVC
                            self.navigationController?.pushViewController(nextViewController, animated: true)
                        }
                    }
                    else {
                        timer.invalidate()
                        let nextViewController = objGame.instantiateViewController(withIdentifier: "ScroreCardVC")as! ScroreCardVC
                        nextViewController.arrAnserResponse = arrAnswerResponse.mutableCopy() as! NSMutableArray
                        self.navigationController?.pushViewController(nextViewController, animated: true)
                    }
                }
            }
        }
    }
    
    func HttpWrapperfetchDataFail(wrapper: HttpWrapper, error: NSError) {
        print(error)
    }
    
    // MARK: Get-Post Methods
   
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
    
    
    // MARK: show question and answers Functions
    
    func getSelectedQuestionAnswer(){
        nQuestionId = ((arrQuestionList.object(at: currentQuestionCount) as! NSDictionary).value(forKey: "nQuestionId") as? NSNumber)!

        let dictParameters:[String:AnyObject] = ["nQuestionId" : nQuestionId as AnyObject]

        objGetSelectedQuestionAnswer  = HttpWrapper.init()
        objGetSelectedQuestionAnswer.delegate = self

        callPost(dictParameters: dictParameters, objCall: objGetSelectedQuestionAnswer, callUrl: kGetSelectedQuestionAnswer)
    }
    
    func showNextQuestion(){
        timeCounter = 10
        self.lblTimer.text = "\(timeCounter)"
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
        self.view.addSubview(self.lblTimer)
        print(currentQuestionCount)
        nQuestionId = ((arrQuestionList.object(at: currentQuestionCount) as! NSDictionary).value(forKey: "nQuestionId") as? NSNumber)!
        self.lblQuestion.text = (arrQuestionList.object(at: currentQuestionCount) as! NSDictionary).value(forKey: "cQuestionTitle") as? String
        arrQuestionAnswerList = ((arrQuestionList.object(at: currentQuestionCount) as! NSDictionary).value(forKey: "cAnswer") as! NSArray).mutableCopy() as! NSMutableArray
        decOptionA = arrQuestionAnswerList.object(at: 0) as! NSDictionary
        print(decOptionA)
        decOptionB = arrQuestionAnswerList.object(at: 1) as! NSDictionary
        print(decOptionB)
        decOptionC = arrQuestionAnswerList.object(at: 2) as! NSDictionary
        print(decOptionC)

        self.btnOptionA.setTitle(decOptionA.value(forKey: "cAnswerText") as? String, for: UIControlState.normal)
        self.btnOptionB.setTitle(decOptionB.value(forKey: "cAnswerText") as? String, for: UIControlState.normal)
        self.btnOptionC.setTitle(decOptionC.value(forKey: "cAnswerText") as? String, for: UIControlState.normal)
        
        lblQuestion.isHidden = false
        btnOptionA.isHidden = false
        self.btnOptionA.titleLabel?.font = UIFont.init(name: Regular, size: 15)
        btnOptionB.isHidden = false
        self.btnOptionB.titleLabel?.font = UIFont.init(name: Regular, size: 15)
        btnOptionC.isHidden = false
        self.btnOptionC.titleLabel?.font = UIFont.init(name: Regular, size: 15)
        AppHelper.hideLoadingView()
    }
    
    @objc func updateTime(){
        timeCounter = timeCounter - 1
        print(timeCounter)
        if  timeCounter == 0 {
            timer.invalidate()
            currentQuestionCount = currentQuestionCount + 1
            if arrQuestionList.count > currentQuestionCount{
                    showNextQuestion()
            }
            else {
                let nextViewController = objGame.instantiateViewController(withIdentifier: "WinnerListVC")as! WinnerListVC
                self.navigationController?.pushViewController(nextViewController, animated: true)
            }
        }
        else {
            self.lblTimer.text = "\(timeCounter)"
        }
    }
}
