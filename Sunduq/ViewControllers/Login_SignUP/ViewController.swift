//
//  ViewController.swift
//  Sunduq
//
//  Created by Mandip Kanjiya on 18/07/18.
//  Copyright © 2018 Mandip Kanjiya. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource,HttpWrapperDelegate {
    
    @IBOutlet weak var ConstraintViewOtp: NSLayoutConstraint!
    @IBOutlet weak var ConstaintViewMobileNumber: NSLayoutConstraint!
    @IBOutlet weak var ConstaintViewFirstNamelast: NSLayoutConstraint!
    @IBOutlet weak var UnderLineCodeContry: UILabel!
    @IBOutlet weak var UnderLineMobileNo: UILabel!
    @IBOutlet weak var UnderLineLastName: UILabel!
    @IBOutlet weak var UnderlingFirstName: UILabel!
    @IBOutlet weak var lblConfirmSMSCode: UILabel!
    @IBOutlet weak var imgOtpCircle4: UIImageView!
    @IBOutlet weak var imgOtpCircle3: UIImageView!
    @IBOutlet weak var imgOtpCircle2: UIImageView!
    @IBOutlet weak var imgOtpCircle1: UIImageView!
    @IBOutlet weak var viewOtpText: UIView!
    @IBOutlet weak var txtSelectCountryCode: UITextField!
    @IBOutlet weak var btnsignup: UIButtonX!
    @IBOutlet weak var btnlogin: UIButtonX!
    @IBOutlet weak var viewCenter: UIView!
    let muteForPickerData = ["minute(s)","hour(s)"]
    @IBOutlet weak var txtMobileNumber: UITextField!
   
    @IBOutlet weak var otpTextField1: UITextField!
    @IBOutlet weak var otpTextField2: UITextField!
    @IBOutlet weak var otpTextField3: UITextField!
    @IBOutlet weak var otpTextField4: UITextField!
    
    @IBOutlet weak var lblviewOtpTextTitle: UILabel!
    @IBOutlet weak var viewMobileNumber: UIView!
    @IBOutlet weak var lblViewFirstLastNameTitle: UILabel!
    @IBOutlet weak var lblViewMobileTitle: UILabel!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var viewFirstLastName: UIView!
    @IBOutlet weak var txtFirstName: UITextField!
    var toolBar = UIToolbar()
    
    var selectedTextField: UITextField? = nil
    
    //MARK: - Animation Fram Identity
    var isSignUp:Bool = false
    var SignUpPageNo = 0
    var LoginPageNo = 0
    var idBtnsignUp = CGRect()
    var idBtnLogin = CGRect()
    var idViewMobileNumber = CGRect()
     var idviewFirstLastName = CGRect()
    var idlblViewFirstLastNameTitle = CGRect()
    var idviewOtpText = CGRect()
     //MARK: - Store TextFeild Value
   
    var strFirstName:String = String()
    var strLastName:String = String()
    var strAge:String = String()
    var strGender:String = String()
    var strPhoneNumber:String = String()
    var strCountryCode: String = String()
    var picker: UIPickerView = UIPickerView()
    
    //MARK: httpObject
    
    var objSendSms = HttpWrapper()
    var objVerifySms = HttpWrapper()
    var objLogin = HttpWrapper()
    var objSignup = HttpWrapper()
    var net:NetworkReachabilityManager = NetworkReachabilityManager()!
    
    func setFontandColor(){
        //MARK: - Font
        btnlogin.titleLabel?.font = UIFont.init(name: Regular, size: 17)
         btnsignup.titleLabel?.font = UIFont.init(name: Regular, size: 17)
        btnlogin.layer.applySketchShadow(color: ColorAppBlack, alpha: 0.20, x: 0, y: 0, blur: 0.20, spread: 0)
        btnlogin.layer.applySketchShadow(color: ColorAppBlack, alpha: 0.20, x: 0, y: 0, blur: 0.20, spread: 0)
        //MARK: - Color
        btnsignup.setTitleColor(ColorAppBlack, for: .normal)
         btnlogin.setTitleColor(ColorAppBlack, for: .normal)
        
        txtFirstName.textColor = whiteColor
        txtLastName.textColor = whiteColor
        txtMobileNumber.textColor = whiteColor
        txtSelectCountryCode.textColor = whiteColor
        //tx.textColor = whiteColor
        txtSelectCountryCode.textColor = whiteColor
         //MARK: - ViewOtptext Font
        lblConfirmSMSCode.font = UIFont.init(name: Regular, size: 17)
        otpTextField1.font = UIFont.init(name: Regular, size: 17)
        otpTextField2.font = UIFont.init(name: Regular, size: 17)
        otpTextField3.font = UIFont.init(name: Regular, size: 17)
        otpTextField4.font = UIFont.init(name: Regular, size: 17)
        lblViewFirstLastNameTitle.font = UIFont.init(name: Regular, size: 13)
        txtFirstName.font = UIFont.init(name: Regular, size: 14)
        txtLastName.font = UIFont.init(name: Regular, size: 14)
        otpTextField1.backgroundColor = UIColor.clear
        otpTextField2.backgroundColor = UIColor.clear
        otpTextField3.backgroundColor = UIColor.clear
        otpTextField4.backgroundColor = UIColor.clear
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFontandColor()
        //MARK: - Change Pleceholder Color For textFeilds
        txtFirstName.attributedPlaceholder = NSAttributedString(string: self.txtFirstName.placeholder!,
                                                               attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtLastName.attributedPlaceholder = NSAttributedString(string: self.txtLastName.placeholder!,
                                                                attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtMobileNumber.attributedPlaceholder = NSAttributedString(string: self.txtMobileNumber.placeholder!,
                                                               attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtSelectCountryCode.attributedPlaceholder = NSAttributedString(string: self.txtSelectCountryCode.placeholder!,
                                                                   attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        
        
        otpTextField1.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        otpTextField2.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        otpTextField3.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        otpTextField4.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)

        //MARK: - Change Color of OutLets
        lblViewFirstLastNameTitle.textColor = ColorAppOrange
         lblViewMobileTitle.textColor = ColorAppOrange
         lblviewOtpTextTitle.textColor = ColorAppOrange
        
        self.view.backgroundColor = ColorAppRed
       
        
        let devWid = self.view.frame.width;
        let devHei = self.view.frame.height;
        
        
        picker = UIPickerView(frame: CGRect(x: 0, y: 200, width: self.view.frame.width, height: 300))
        picker.backgroundColor = UIColor.white
        
        picker.showsSelectionIndicator = true
        picker.delegate = self
        picker.dataSource = self
        
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = ColorAppBlack
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(ViewController.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(ViewController.cancelClick))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        
        
        
// Header Part 1
        
        let imageView1 = UIImageView()
        imageView1.frame = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: devWid/3, height: devWid/3))
        imageView1.backgroundColor = UIColor(red: 105/255, green: 60/255, blue: 145/255, alpha: 1.0)
        self.view.addSubview(imageView1)
        
        // 2-1
        let imageView2 = UIImageView()
        imageView2.frame = CGRect(origin: CGPoint(x: devWid/3,y :0), size: CGSize(width: devWid/3, height: devWid/3))
        imageView2.backgroundColor = UIColor(red: 105/255, green: 60/255, blue: 145/255, alpha: 1.0)
        self.view.addSubview(imageView2)
        
        // 2-2 circle
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: devWid/2,y: devWid/6), radius: CGFloat(devWid/12), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        // change the fill color
        shapeLayer.fillColor = UIColor(red: 122/255, green: 241/255, blue: 196/255, alpha: 1.0).cgColor
        self.view.layer.addSublayer(shapeLayer)
        
        //3-yellow
        let imageView3 = UIImageView()
        imageView3.frame = CGRect(origin: CGPoint(x: devWid*2/3,y :0), size: CGSize(width: devWid/3, height: devWid/3))
        imageView3.backgroundColor = UIColor(red: 251/255, green: 188/255, blue: 83/255, alpha: 1.0)
        self.view.addSubview(imageView3)
        
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
        self.view.layer.addSublayer(shape)
        
// Part 2

        setLayoutForDevice()
        // Do any additional setup after loading the view, typically from a nib.
    }

     //MARK: - viewDidAppear
    
    override func viewDidAppear(_ animated: Bool) {
      idBtnLogin = self.btnlogin.frame
        idBtnsignUp = btnsignup.frame
        viewFirstLastName.isHidden = true
        viewMobileNumber.isHidden = true
         viewOtpText.isHidden = true
        
        viewFirstLastName.backgroundColor = UIColor.clear
        viewMobileNumber.backgroundColor = UIColor.clear
        viewOtpText.backgroundColor = UIColor.clear
        idviewFirstLastName = self.viewFirstLastName.frame
        idViewMobileNumber = self.viewMobileNumber.frame
        idviewOtpText = self.viewOtpText.frame
        UnderLineLastName.translatesAutoresizingMaskIntoConstraints = true
        UnderLineLastName.frame.size.height = 0.75
        
        UnderlingFirstName.translatesAutoresizingMaskIntoConstraints = true
        UnderlingFirstName.frame.size.height = 0.75
        
        UnderLineMobileNo.translatesAutoresizingMaskIntoConstraints = true
        UnderLineMobileNo.frame.size.height = 0.75
        
        UnderLineCodeContry.translatesAutoresizingMaskIntoConstraints = true
        UnderLineCodeContry.frame.size.height = 0.75
        
        if UIDevice().userInterfaceIdiom == .pad
        {
            
        }
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        let text = textField.text
        if  text?.count == 1 {
            switch textField{
            case otpTextField1:
                imgOtpCircle1.isHidden = true
                otpTextField2.becomeFirstResponder()
            case otpTextField2:
                imgOtpCircle2.isHidden = true
                otpTextField3.becomeFirstResponder()
            case otpTextField3:
                imgOtpCircle3.isHidden = true
                otpTextField4.becomeFirstResponder()
            case otpTextField4:
                imgOtpCircle4.isHidden = true
                otpTextField4.resignFirstResponder()
            default:
                break
            }
        }
        if  text?.count == 0 {
            switch textField{
            case otpTextField1:
                imgOtpCircle1.isHidden = true
                otpTextField1.becomeFirstResponder()
            case otpTextField2:
                imgOtpCircle2.isHidden = true
                otpTextField1.becomeFirstResponder()
            case otpTextField3:
                imgOtpCircle3.isHidden = true
                otpTextField2.becomeFirstResponder()
            case otpTextField4:
                imgOtpCircle4.isHidden = true
                otpTextField3.becomeFirstResponder()
            default:
                break
            }
        }
        else{
            
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var returnBool:Bool = true
        var length = 0
        if textField == self.txtMobileNumber {
            length = (textField.text?.count)!
            if (length <= 10) {
                returnBool = false
            }
            else {
                returnBool = true
            }
        }
        return returnBool
    }
    
    
    //MARK: - onClickBtnSignUp
    
    @IBAction func onClickBtnSignUp(_ sender: Any)
    {
        isSignUp = true
       // self.btnsignup.translatesAutoresizingMaskIntoConstraints = true
        self.viewFirstLastName.frame = CGRect(x: self.viewFirstLastName.frame.origin.x, y: self.viewFirstLastName.frame.origin.y - self.btnsignup.frame.size.height, width: self.viewFirstLastName.frame.size.width, height: self.viewFirstLastName.frame.size.height)
        lblViewFirstLastNameTitle.isHidden = true
        SignUpPageNo = 1
        UIView.transition(with: self.btnsignup, duration: 0.3, options: .curveEaseIn, animations: {
            
            self.viewFirstLastName.isHidden = false
            self.btnsignup.frame = self.idBtnLogin
            self.viewFirstLastName.frame = self.idviewFirstLastName
            self.btnlogin.setTitle("Next", for: .normal)
            
        }, completion: { (true) in
            self.btnsignup.isHidden = true
            self.lblViewFirstLastNameTitle.isHidden = false
            })
    }
    //MARK: - onClickBtnLogin
        
    @IBAction func onClickBtnLogin(_ sender: Any)
    {
        if isSignUp == true
        {
            if SignUpPageNo == 1
            {
               // self.viewFirstLastName.frame = idviewFirstLastName
                strFirstName = self.txtFirstName.text!
                strLastName = self.txtLastName.text!
                
                if strFirstName == "" {
                    AppHelper.showAlert(kAlertTitle, message: kMessageFirstname)
                }
                else if strLastName == "" {
                    AppHelper.showAlert(kAlertTitle, message: kMessageLastname)
                }
                else {
                        SignUpPageNo = 2
                        self.txtFirstName.becomeFirstResponder()
                        self.viewFirstLastName.frame = CGRect(x: self.viewFirstLastName.frame.origin.x, y: self.viewFirstLastName.frame.origin.y - self.btnsignup.frame.size.height, width: self.viewFirstLastName.frame.size.width, height: self.viewFirstLastName.frame.size.height)
                        lblViewFirstLastNameTitle.isHidden = true
                        UIView.transition(with: self.viewFirstLastName, duration: 0.3, options: .curveEaseIn, animations: {
                            
                            self.viewFirstLastName.isHidden = false
                            self.txtFirstName.text = ""
                            self.txtLastName.text = ""
                            self.btnsignup.frame = self.idBtnLogin
                            self.viewFirstLastName.frame = self.idviewFirstLastName
                            self.btnlogin.setTitle("Next", for: .normal)
                            self.txtFirstName.attributedPlaceholder = NSAttributedString(string: "Age",
                                                                                         attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
                            self.txtLastName.attributedPlaceholder = NSAttributedString(string: "Gender",
                                                                                        attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
                            self.txtFirstName.keyboardType = UIKeyboardType.phonePad;
                            self.selectedTextField = self.txtLastName
                            self.txtLastName.inputView = self.toolBar
                            self.txtLastName.inputAccessoryView = self.picker
                        }, completion: { (true) in
                            self.btnsignup.isHidden = true
                            self.lblViewFirstLastNameTitle.isHidden = false
                        })
                    
                }
            }
            else if SignUpPageNo == 2
            {
                strAge = self.txtFirstName.text!
                strGender = self.txtLastName.text!
                print(strGender)
                
                if strAge == "" {
                    AppHelper.showAlert(kAlertTitle, message: kMessageAge)
                }
                else if strGender == "" {
                    AppHelper.showAlert(kAlertTitle, message: kMessageGender)
                }
                else {
                    SignUpPageNo = 3
                    UIView.animate(withDuration: 0.3, animations: {
                        self.viewFirstLastName.isHidden = true
                    }) { (true) in
                        
                        self.viewMobileNumber.frame = CGRect(x: self.viewMobileNumber.frame.origin.x, y: self.viewMobileNumber.frame.origin.y - self.btnsignup.frame.size.height, width: self.viewMobileNumber.frame.size.width, height: self.viewMobileNumber.frame.size.height)
                        self.lblViewMobileTitle.isHidden = true
                        
                        UIView.transition(with: self.viewMobileNumber, duration: 0.3, options: .curveEaseIn, animations: {
                            
                            self.viewMobileNumber.isHidden = false
                            self.btnsignup.frame = self.idBtnLogin
                            self.viewMobileNumber.frame = self.idViewMobileNumber
                            self.btnlogin.setTitle("Next", for: .normal)
                            self.selectedTextField = self.txtSelectCountryCode
                            self.txtSelectCountryCode.inputView = self.toolBar
                            self.txtSelectCountryCode.inputAccessoryView =  self.picker
                        }, completion: { (true) in
                            self.btnsignup.isHidden = true
                            self.lblViewMobileTitle.isHidden = false
                        })
                    }
                }

            }
            else if SignUpPageNo == 3
            {
                strCountryCode = txtSelectCountryCode.text as! String
                strPhoneNumber = txtMobileNumber.text as! String
                if strCountryCode == "" {
                    AppHelper.showAlert(kAlertTitle, message: kMessageCountryCode)
                }
                else if strPhoneNumber == "" {
                    AppHelper.showAlert(kAlertTitle, message: kMessageContactNo)
                }
                else {
                    let dictParameters:[String:AnyObject] = ["api_key" : kSmsApiKey as AnyObject,
                                                             "country_code" : strCountryCode as AnyObject,
                                                             "phone_number" : strPhoneNumber as AnyObject,
                                                             "via" : "sms" as AnyObject]
                    self.objSendSms = HttpWrapper.init()
                    self.objSendSms.delegate = self
                    callPost(dictParameters: dictParameters, objCall: objSendSms, callUrl: kSmsOtpSendUrl)
                }
            }
            else if SignUpPageNo == 4
            {
                let strOTPcode = otpTextField1.text!+""+otpTextField2.text!+""+otpTextField3.text!+""+otpTextField4.text!
                
                if strOTPcode == "" {
                    AppHelper.showAlert(kAlertTitle, message: kMessageOTPCode)
                }
                else {
                    let param:String = String(format: "%@?api_key=%@&verification_code=%@&phone_number=%@&country_code=%@", kSmsOtpConfirmUrl,kSmsApiKey,strOTPcode,strPhoneNumber,strCountryCode)
                    
                    self.objVerifySms = HttpWrapper.init()
                    self.objVerifySms.delegate = self
                    callGet(paramString: param, objCall: objVerifySms)
                }
            }
        }
        else
        {
            if LoginPageNo == 0
            {
                LoginPageNo = 1
                UIView.animate(withDuration: 0.3, animations: {
                    self.viewFirstLastName.isHidden = true
                }) { (true) in
                    
                    self.viewMobileNumber.frame = CGRect(x: self.viewMobileNumber.frame.origin.x, y: self.viewMobileNumber.frame.origin.y - self.btnsignup.frame.size.height, width: self.viewMobileNumber.frame.size.width, height: self.viewMobileNumber.frame.size.height)
                    self.lblViewMobileTitle.isHidden = true
                    
                    UIView.transition(with: self.viewMobileNumber, duration: 0.3, options: .curveEaseIn, animations: {
                        
                        self.viewMobileNumber.isHidden = false
                        self.btnsignup.frame = self.idBtnLogin
                        self.viewMobileNumber.frame = self.idViewMobileNumber
                        self.btnlogin.setTitle("Next", for: .normal)
                        
                        
                    }, completion: { (true) in
                        self.btnsignup.isHidden = true
                        self.lblViewMobileTitle.isHidden = false
                    })
                }
            }
            else if LoginPageNo == 1
            {
                strCountryCode = txtSelectCountryCode.text as! String
                strPhoneNumber = txtMobileNumber.text as! String
                if strCountryCode == "" {
                    AppHelper.showAlert(kAlertTitle, message: kMessageCountryCode)
                }
                else if strPhoneNumber == "" {
                    AppHelper.showAlert(kAlertTitle, message: kMessageContactNo)
                }
                else {
//                    let dictParameters:[String:AnyObject] = ["api_key" : kSmsApiKey as AnyObject,
//                                                             "country_code" : strCountryCode as AnyObject,
//                                                             "phone_number" : strPhoneNumber as AnyObject,
//                                                             "via" : "sms" as AnyObject]
//                    self.objSendSms = HttpWrapper.init()
//                    self.objSendSms.delegate = self
//                    callPost(dictParameters: dictParameters, objCall: objSendSms, callUrl: kSmsOtpSendUrl)
                    let strFullContactNumber = "\(strCountryCode)\(strPhoneNumber)"
                    print(strFullContactNumber)
                    let dictParameters:[String:AnyObject] = ["cCustomerEmailId" : strFullContactNumber as AnyObject]
                    
                    self.objLogin = HttpWrapper.init()
                    self.objLogin.delegate = self
                    callPost(dictParameters: dictParameters, objCall: objLogin, callUrl: kLogin)
                }
            }
            else if LoginPageNo == 2
            {
                let strOTPcode = otpTextField1.text!+""+otpTextField2.text!+""+otpTextField3.text!+""+otpTextField4.text!
                
                if strOTPcode == "" {
                    AppHelper.showAlert(kAlertTitle, message: kMessageOTPCode)
                }
                else {
                    
                    let param:String = String(format: "%@?api_key=%@&verification_code=%@&phone_number=%@&country_code=%@", kSmsOtpConfirmUrl,kSmsApiKey,strOTPcode,strPhoneNumber,strCountryCode)
                    
                    self.objVerifySms = HttpWrapper.init()
                    self.objVerifySms.delegate = self
                    callGet(paramString: param, objCall: objVerifySms)
                }
            }
        }
    }
    
  
    
    @objc func doneClick() {
        
        if self.selectedTextField == self.txtLastName {
            txtLastName.resignFirstResponder()
        }
        else if self.selectedTextField == self.txtSelectCountryCode {
            txtSelectCountryCode.resignFirstResponder()
        }

    }
    @objc func cancelClick() {
        if self.selectedTextField == self.txtLastName {
            txtLastName.resignFirstResponder()
        }
        else if self.selectedTextField == self.txtSelectCountryCode {
            txtSelectCountryCode.resignFirstResponder()
        }
    }
    
   
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        var optionsCount = 0
        
        if self.selectedTextField == self.txtLastName {
            optionsCount = genders.count
        }
        else if self.selectedTextField == self.txtSelectCountryCode {
            
            optionsCount = arrcountryCode.count
        }
        
        return optionsCount
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var strint = ""
        
        if self.selectedTextField == self.txtLastName {
            let gender = genders[row]
            strint = gender["title"] as! String
        }
        else if self.selectedTextField == self.txtSelectCountryCode {
            let Code = arrcountryCode[row]
            let name = Code["name"] as! String
            let PhoneCodec = Code["dial_code"] as! String
            
            strint = "\(name)  \(PhoneCodec)"
        }
       
        return strint
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
        if self.selectedTextField == self.txtLastName {
            let gender = genders[row]
            txtLastName.text = gender["title"] as! String
        }
        else if self.selectedTextField == self.txtSelectCountryCode {
            let Code = arrcountryCode[row]
            let name = Code["name"] as! String
            let PhoneCodec = Code["dial_code"] as! String
            
            txtSelectCountryCode.text = PhoneCodec
        }
    }
    
    func setLayoutForDevice(){
        let devWid = self.view.frame.width;
        let devHei = self.view.frame.height;
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
           
            case 1334,1920,1136:
                print("iPhone 6/6S/7/8")
                viewCenter.translatesAutoresizingMaskIntoConstraints = true
                viewCenter.frame = CGRect(origin: CGPoint(x: 0,y :devWid/3), size: CGSize(width: devWid, height: devHei-(3*(devWid/3))))
                viewCenter.backgroundColor = ColorAppRed
                self.view.addSubview(viewCenter)
                
                // Button SignUp
                
                btnsignup.backgroundColor = ColorAppGreen
                btnsignup.cornerRadius = self.btnsignup.frame.size.height/2
                
                // Button login
                
                btnlogin.backgroundColor = ColorAppGreen
                btnlogin.cornerRadius = self.btnsignup.frame.size.height/2
               
                //4
                let imageView4 = UIImageView()
                imageView4.frame = CGRect(origin: CGPoint(x: 0,y :devHei-devWid*2/3), size: CGSize(width: devWid/3, height: devWid/3))
                imageView4.backgroundColor = UIColor(red: 105/255, green: 60/255, blue: 145/255, alpha: 1.0)
                self.view.addSubview(imageView4)
                //
                //5 (Circle-big)
                let circlePath2 = UIBezierPath(arcCenter: CGPoint(x: devWid/3,y: devHei-devWid*2/6), radius: CGFloat(devWid/3), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
                
                let shapeLayer2 = CAShapeLayer()
                shapeLayer2.path = circlePath2.cgPath
                // change the fill color
                shapeLayer2.fillColor = UIColor(red: 59/255, green: 238/255, blue: 251/255, alpha: 1.0).cgColor
                view.layer.addSublayer(shapeLayer2)
                
                //6-red rect
                let imageView5 = UIImageView()
                imageView5.frame = CGRect(origin: CGPoint(x: 0,y :devHei-devWid/3), size: CGSize(width: devWid/3, height: devWid*2/3))
                imageView5.backgroundColor = UIColor(red: 235/255, green: 64/255, blue: 109/255, alpha: 1.0)
                self.view.addSubview(imageView5)
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
                self.view.layer.addSublayer(shape2)
                //
                ////        //8 yellow rect
                let imageView6 = UIImageView()
                imageView6.frame = CGRect(origin: CGPoint(x: devWid/3,y :devHei-devWid*2/3), size: CGSize(width: devWid/3, height: devWid*2/3))
                imageView6.backgroundColor = UIColor(red: 251/255, green: 188/255, blue: 83/255, alpha: 1.0)
                self.view.addSubview(imageView6)
                ////
                ////        //9
                let imageView7 = UIImageView()
                imageView7.frame = CGRect(origin: CGPoint(x: devWid*2/3,y :devHei-devWid*2/3), size: CGSize(width: devWid/3, height: devWid/3))
                imageView7.backgroundColor = UIColor(red: 122/255, green: 241/255, blue: 196/255, alpha: 1.0)
                self.view.addSubview(imageView7)
                ////
                let imageView8 = UIImageView()
                imageView8.frame = CGRect(origin: CGPoint(x: devWid*2/3,y :devHei-devWid/3), size: CGSize(width: devWid/3, height: devWid/3))
                imageView8.backgroundColor = UIColor(red: 59/255, green: 238/255, blue: 251/255, alpha: 1.0)
                self.view.addSubview(imageView8)
            
            case 2436, 2208:
                viewCenter.translatesAutoresizingMaskIntoConstraints = true
                viewCenter.frame = CGRect(origin: CGPoint(x: 0,y :devWid/3), size: CGSize(width: devWid, height: devHei-(4*(devWid/3))))
                viewCenter.backgroundColor = ColorAppRed
                self.view.addSubview(viewCenter)
                
                // Button SignUp
                
                btnsignup.backgroundColor = ColorAppGreen
                btnsignup.cornerRadius = self.btnsignup.frame.size.height/2
               
                
                // Button login
                
                btnlogin.backgroundColor = ColorAppGreen
                btnlogin.cornerRadius = self.btnsignup.frame.size.height/2
               
                
                let imageView4 = UIImageView()
                imageView4.frame = CGRect(origin: CGPoint(x: 0,y :devHei-devWid), size: CGSize(width: devWid/3, height: devWid/3))
                imageView4.backgroundColor = UIColor(red: 105/255, green: 60/255, blue: 145/255, alpha: 1.0)
                self.view.addSubview(imageView4)
                
                //5 (Circle-big)
                let circlePath2 = UIBezierPath(arcCenter: CGPoint(x: devWid/3,y: devHei-devWid*2/3), radius: CGFloat(devWid/3), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
                
                let shapeLayer2 = CAShapeLayer()
                shapeLayer2.path = circlePath2.cgPath
                // change the fill color
                shapeLayer2.fillColor = UIColor(red: 59/255, green: 238/255, blue: 251/255, alpha: 1.0).cgColor
                view.layer.addSublayer(shapeLayer2)
                
                //6-red rect
                let imageView5 = UIImageView()
                imageView5.frame = CGRect(origin: CGPoint(x: 0,y :devHei-devWid*2/3), size: CGSize(width: devWid/3, height: devWid*2/3))
                imageView5.backgroundColor = UIColor(red: 235/255, green: 64/255, blue: 109/255, alpha: 1.0)
                self.view.addSubview(imageView5)
                
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
                self.view.layer.addSublayer(shape2)
                
                //8 yellow rect
                let imageView6 = UIImageView()
                imageView6.frame = CGRect(origin: CGPoint(x: devWid/3,y :devHei-devWid), size: CGSize(width: devWid/3, height: devWid*2/3))
                imageView6.backgroundColor = UIColor(red: 251/255, green: 188/255, blue: 83/255, alpha: 1.0)
                self.view.addSubview(imageView6)
                
                //9
                let imageView7 = UIImageView()
                imageView7.frame = CGRect(origin: CGPoint(x: devWid*2/3,y :devHei-devWid), size: CGSize(width: devWid/3, height: devWid/3))
                imageView7.backgroundColor = UIColor(red: 122/255, green: 241/255, blue: 196/255, alpha: 1.0)
                self.view.addSubview(imageView7)
                
                let imageView8 = UIImageView()
                imageView8.frame = CGRect(origin: CGPoint(x: devWid*2/3,y :devHei-devWid*2/3), size: CGSize(width: devWid/3, height: devWid/3))
                imageView8.backgroundColor = UIColor(red: 59/255, green: 238/255, blue: 251/255, alpha: 1.0)
                self.view.addSubview(imageView8)
                
                let imageView9 = UIImageView()
                imageView9.frame = CGRect(origin: CGPoint(x: devWid/3,y :devHei-devWid/3), size: CGSize(width: devWid/3, height: devWid/3))
                imageView9.backgroundColor = UIColor(red: 122/255, green: 241/255, blue: 196/255, alpha: 1.0)
                self.view.addSubview(imageView9)
                
                let imageView10 = UIImageView()
                imageView10.frame = CGRect(origin: CGPoint(x: devWid*2/3,y :devHei-devWid/3), size: CGSize(width: devWid/3, height: devWid/3))
                imageView10.backgroundColor = UIColor(red: 105/255, green: 60/255, blue: 145/255, alpha: 1.0)
                self.view.addSubview(imageView10)
                print("iPhone X")
            default:
                print("unknown")
                
            }
        }
        else
        {
            viewCenter.translatesAutoresizingMaskIntoConstraints = true
            viewCenter.frame = CGRect(origin: CGPoint(x: devWid/3-83,y :devWid/3), size: CGSize(width: devWid/3+166, height: devHei-(3*(devWid/3))))
            
            lblViewMobileTitle.translatesAutoresizingMaskIntoConstraints = true
            lblViewMobileTitle.frame = CGRect(x: 0, y: lblViewFirstLastNameTitle.frame.origin.y, width: viewCenter.frame.width, height: lblViewFirstLastNameTitle.frame.height)
            
            lblviewOtpTextTitle.translatesAutoresizingMaskIntoConstraints = true
            lblviewOtpTextTitle.frame = CGRect(x: 0, y: lblViewFirstLastNameTitle.frame.origin.y, width: viewCenter.frame.width, height: lblViewFirstLastNameTitle.frame.height)
            
            lblViewFirstLastNameTitle.translatesAutoresizingMaskIntoConstraints = true
            lblViewFirstLastNameTitle.frame = CGRect(x: 0, y: lblViewFirstLastNameTitle.frame.origin.y, width: viewCenter.frame.width, height: lblViewFirstLastNameTitle.frame.height)
            lblViewFirstLastNameTitle.textAlignment = .center
            //lblViewFirstLastNameTitle.backgroundColor = UIColor.blue
        
            viewCenter.backgroundColor = ColorAppRed
            self.view.addSubview(viewCenter)
            
            // Button SignUp
            
            btnsignup.backgroundColor = ColorAppGreen
            btnsignup.cornerRadius = self.btnsignup.frame.size.height/2
           self.ConstaintViewFirstNamelast.constant = 16
            //self.ConstraintViewOtp.constant = 16
            self.ConstaintViewMobileNumber.constant = 16
            self.viewCenter.layoutIfNeeded()
            // Button login
            
            btnlogin.backgroundColor = ColorAppGreen
            btnlogin.cornerRadius = self.btnsignup.frame.size.height/2
            
            //4
            let imageView4 = UIImageView()
            imageView4.frame = CGRect(origin: CGPoint(x: 0,y :devHei-devWid*2/3), size: CGSize(width: devWid/3, height: devWid/3))
            imageView4.backgroundColor = UIColor(red: 105/255, green: 60/255, blue: 145/255, alpha: 1.0)
            self.view.addSubview(imageView4)
            //
            //5 (Circle-big)
            let circlePath2 = UIBezierPath(arcCenter: CGPoint(x: devWid/3,y: devHei-devWid*2/6), radius: CGFloat(devWid/3), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
            
            let shapeLayer2 = CAShapeLayer()
            shapeLayer2.path = circlePath2.cgPath
            // change the fill color
            shapeLayer2.fillColor = UIColor(red: 59/255, green: 238/255, blue: 251/255, alpha: 1.0).cgColor
            view.layer.addSublayer(shapeLayer2)
            
            //6-red rect
            let imageView5 = UIImageView()
            imageView5.frame = CGRect(origin: CGPoint(x: 0,y :devHei-devWid/3), size: CGSize(width: devWid/3, height: devWid*2/3))
            imageView5.backgroundColor = UIColor(red: 235/255, green: 64/255, blue: 109/255, alpha: 1.0)
            self.view.addSubview(imageView5)
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
            self.view.layer.addSublayer(shape2)
            //
            ////        //8 yellow rect
            let imageView6 = UIImageView()
            imageView6.frame = CGRect(origin: CGPoint(x: devWid/3,y :devHei-devWid*2/3), size: CGSize(width: devWid/3, height: devWid*2/3))
            imageView6.backgroundColor = UIColor(red: 251/255, green: 188/255, blue: 83/255, alpha: 1.0)
            self.view.addSubview(imageView6)
            ////
            ////        //9
            let imageView7 = UIImageView()
            imageView7.frame = CGRect(origin: CGPoint(x: devWid*2/3,y :devHei-devWid*2/3), size: CGSize(width: devWid/3, height: devWid/3))
            imageView7.backgroundColor = UIColor(red: 122/255, green: 241/255, blue: 196/255, alpha: 1.0)
            self.view.addSubview(imageView7)
            ////
            let imageView8 = UIImageView()
            imageView8.frame = CGRect(origin: CGPoint(x: devWid*2/3,y :devHei-devWid/3), size: CGSize(width: devWid/3, height: devWid/3))
            imageView8.backgroundColor = UIColor(red: 59/255, green: 238/255, blue: 251/255, alpha: 1.0)
            self.view.addSubview(imageView8)
            
           // viewCenter.addSubview(lblViewFirstLastNameTitle)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: HttpWrapperDelegates
    
    func HttpWrapperfetchDataSuccess(wrapper: HttpWrapper, dicsResponse: NSMutableDictionary) {
        AppHelper.hideLoadingView()
        print(dicsResponse)
        if  wrapper == objSendSms {
            if dicsResponse.value(forKey: "success") as! NSNumber == 1
            {
                if isSignUp == true
                {
                    SignUpPageNo = 4
                }
                else{
                    LoginPageNo = 2
                }
                
                UIView.animate(withDuration: 0.3, animations: {
                    self.viewMobileNumber.isHidden = true
                }) { (true) in
                    
                    self.viewOtpText.frame = CGRect(x: self.viewOtpText.frame.origin.x, y: self.viewOtpText.frame.origin.y - self.btnsignup.frame.size.height, width: self.viewOtpText.frame.size.width, height: self.viewOtpText.frame.size.height)
                    self.lblviewOtpTextTitle.isHidden = true
                    
                    UIView.transition(with: self.viewMobileNumber, duration: 0.3, options: .curveEaseIn, animations: {
                        
                        self.viewOtpText.isHidden = false
                        self.btnsignup.frame = self.idBtnLogin
                        self.viewOtpText.frame = self.idviewOtpText
                        self.btnlogin.setTitle("Confirm", for: .normal)
                        
                        
                    }, completion: { (true) in
                        self.btnsignup.isHidden = true
                        self.lblviewOtpTextTitle.isHidden = false
                    })
                }
            }
        }
        
        if wrapper == objVerifySms {
            if dicsResponse.value(forKey: "success") as! NSNumber == 1
            {
                if isSignUp == true {
                   
                    let strFullContactNumber = "\(strCountryCode)\(strPhoneNumber)"
                    
                    let dictParameters:[String:AnyObject] = ["cCustomerFirstName" : strFirstName as AnyObject,
                                                             "cCustomerLastName" : strLastName as AnyObject,
                                                             "cCustomerContactNo" : strFullContactNumber as AnyObject,
                                                             "cDeviceType" : "IOS" as AnyObject,
                                                             "cDeviceAddress" : appDelegate.deviceID as AnyObject,
                                                             "nAge" : strAge as AnyObject]
                    
                    
                    self.objSignup = HttpWrapper.init()
                    self.objSignup.delegate = self
                    callPost(dictParameters: dictParameters, objCall: objSignup, callUrl: kSignup)
                }
                else {
                    let strFullContactNumber = "\(strCountryCode)\(strPhoneNumber)"
                    print(strFullContactNumber)
                    let dictParameters:[String:AnyObject] = ["cCustomerEmailId" : strFullContactNumber as AnyObject]
                    
                    self.objLogin = HttpWrapper.init()
                    self.objLogin.delegate = self
                    callPost(dictParameters: dictParameters, objCall: objLogin, callUrl: kLogin)
                }
            }
            else{
                AppHelper.showAlert(kAlertTitle, message: dicsResponse.value(forKey: "message") as! String)
            }
        }
        
        if wrapper == objSignup {
            if dicsResponse.value(forKey: "success") as! NSNumber == 1 {
                
                let data = dicsResponse.value(forKey: "response") as! NSArray
                let json = JSON(data[0])
                print(json["nCustomerId"])
                UserDefaults.standard.setValue("\(json["nCustomerId"])", forKey: kCustomerId)
                UserDefaults.standard.setValue("\(json["cCustomerFirstName"])", forKey: kCustomerFirstName)
                UserDefaults.standard.setValue("\(json["cCustomerLastName"])", forKey: kCustomerLastName)
                UserDefaults.standard.setValue("\(json["cCustomerEmailId"])", forKey: kCustomerEmailId)
                UserDefaults.standard.setValue("\(json["cCustomerImage"])", forKey: kCustomerImage)
                
                
                let nextViewController = objMainScreen.instantiateViewController(withIdentifier: "Mainscreen_Vc")as! Mainscreen_Vc
                self.navigationController?.pushViewController(nextViewController, animated: true)
            }
            else {
                AppHelper.showAlert(kAlertTitle, message: dicsResponse.value(forKey: "message") as! String)
            }
        }
        
        if wrapper == objLogin {
            if dicsResponse.value(forKey: "success") as! NSNumber == 1 {
                let data = dicsResponse.value(forKey: "response") as! NSArray
                let json = JSON(data[0])
                print(json["nCustomerId"])
                UserDefaults.standard.setValue("\(json["nCustomerId"])", forKey: kCustomerId)
                UserDefaults.standard.setValue("\(json["cCustomerFirstName"])", forKey: kCustomerFirstName)
                UserDefaults.standard.setValue("\(json["cCustomerLastName"])", forKey: kCustomerLastName)
                UserDefaults.standard.setValue("\(json["cCustomerEmailId"])", forKey: kCustomerEmailId)
                
                let nextViewController = objMainScreen.instantiateViewController(withIdentifier: "Mainscreen_Vc")as! Mainscreen_Vc
                self.navigationController?.pushViewController(nextViewController, animated: true)
            }
            else {
                AppHelper.showAlert(kAlertTitle, message: dicsResponse.value(forKey: "message") as! String)
            }
        }
    }
    func HttpWrapperfetchDataFail(wrapper: HttpWrapper, error: NSError) {
        AppHelper.showLoadingView()
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
}

