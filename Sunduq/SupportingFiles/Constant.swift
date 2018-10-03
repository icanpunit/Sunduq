//
//  Constant.swift
//  Deputize America
//
//  Created by Darshak Trivedi.
//  Copyright © 2017 Scorch Mobile. All rights reserved.
//

import Foundation
import Alamofire

//MARK:- General Constants

//let checkAuth = "http://scorchmobile.com/71329/dev/dpt/api/"
let checkAuth = "http://52.59.5.17/CoFly/public/api/login"

let appDelegate = UIApplication.shared.delegate as! AppDelegate

//MARK:- Storyboards Objects
let objLaunchScreenSB = UIStoryboard(name: "LaunchScreenSB", bundle: nil)
let objMain = UIStoryboard(name: "Main", bundle: nil)
let objMainScreen = UIStoryboard(name: "MainScreenSB", bundle: nil)
let objWallet = UIStoryboard(name: "WalletSB", bundle: nil)
let objGame = UIStoryboard(name: "GameSB", bundle: nil)
let objFAQ = UIStoryboard(name: "FAQSB", bundle: nil)

//MARK:- Color

let ColorAppBlack = UIColor.init(hexString: "252525")
let ColorAppBlue = UIColor.init(hexString: "6A3893")
let ColorAppRed = UIColor.init(hexString: "EE3D6B")
let ColorAppGreen = UIColor.init(hexString: "75F2C3")
let ColorAppSky = UIColor.init(hexString: "29EEFD")
let ColorAppOrange = UIColor.init(hexString: "FCBA27")
let ColorAppGray = UIColor.init(hexString: "dddddd")

let backGroundColor = UIColor(red: 255.0/255.0, green: 255/255, blue: 255/255, alpha: 1.0)
let darkGrayColor = UIColor(red: 85/255.0, green: 85/255, blue: 85/255, alpha: 1.0)
let PinkColor = UIColor(red: 158/255.0, green: 1/255, blue: 92/255, alpha: 1.0)
let whiteColor = UIColor(red: 255/255.0, green: 255/255, blue: 255/255, alpha: 1.0)
let fontColor = UIColor(red: 64/255.0, green: 64/255, blue: 64/255, alpha: 1.0)
let textviewFont = UIColor(red: 64/255.0, green: 64/255, blue: 64/255, alpha: 1.0)
//MARK:- Fonts
let FontSemibold = "FontsSFProText-SemiBold"
let Regular = "SFProText-Regular"
let FontBold = "SFProText-Bold"
let FontMedium = "SFProText-Medium"
let FontSFProDisplayMedium = "SFProDisplay-Medium"
let FontSFProDisplayRegular = "SFProDisplay-Regular"
let FontSFProDisplayBold = "SFProDisplay-Bold"
let FontSFCompactDisplayMedium = "SFCompactDisplay-Medium"

//MARK:- Dev API
let kbaseURL = "http://ec2-18-218-95-30.us-east-2.compute.amazonaws.com:3000/"

//MARK:- Webservice API list
let kLogin                           = kbaseURL + "customer/login"
let kSignup                          = kbaseURL + "customer/insertcustomer"
let kGetAllContext                   = kbaseURL + "contest/selectallcontests"
let kGetAllQuestions                 = kbaseURL + "question/selectquestioncontestwise"
let kGetSelectedQuestionAnswer       = kbaseURL + "question/selectquestionans"
let kGetSelectedAnswer               = kbaseURL + "question/storeresult"
let kGetQuestionsWithAnswer          = kbaseURL + "question/selectquestionwithanswer"

// MARK: Mobile Verification urls

let kSmsUrl = "https://api.authy.com/protected/json/phones/"
let kSmsOtpSendUrl = kSmsUrl+"verification/start"
let kSmsOtpConfirmUrl = kSmsUrl+"verification/check"
let kSmsApiKey = "LTQ8mvOcxywKtHDfd5BSLPOFG7FoQIQW"


// MARK: Customer Details

let kCustomerId = "nCustomerId"  // nCustomerId
let kCustomerFirstName = "cCustomerFirstName"  // cCustomerFirstName
let kCustomerLastName = "cCustomerLastName"  // cCustomerLastName
let kCustomerEmailId = "cCustomerEmailId"  // cCustomerEmailId
let kCustomerImage = "cCustomerImage" // cCustomerImage

enum ConstantsStripe {
    static let publishableKey = "pk_test_2qbPoTrTYmDpLI8Qyd4lHhar"
    static let defaultCurrency = ""
    static let defaultDescription = ""
}

//0-pending , 1=friends , 2=reject , 3=block , 4=unblock
enum FreindStatus {
    static let pending = "0"
    static let friends = "1"
    static let reject  = "2"
    static let block   = "3"
    static let unblock = "4"
}
class Constants {
    
    struct NotificationKeys {
        static let SignedIn = "onSignInCompleted"
    }
    
    // DBProvider
    static let FriendList = "FriendList"
    static let Messages = "messages";
    
    static let USER_MESSAGES_ID = "User_Messages";
    
    //FriendList Key
    static let FriendDate = "Date"
    static let FriendName = "FriendName"
    static let FriendUserId = "FriendUserId"
    static let IsBlock = "IsBlock"
    static let LastMsg = "LastMsg"
    static let PhotoUrl = "PhotoUrl"
    static let Remarks1 = "Remarks1"
    static let Remarks2 = "Remarks2"
    static let TokenId = "TokenId"
    
    
    // Messages Key
    
    static let name = "name"
    
    static let MsgDate = "Date"
    static let IsUnRead = "IsUnRead"
    static let Remarks = "Remarks"
    static let Status = "Status"
    static let Textmessage = "message"
    static let user_Receiver = "user_Receiver"
    static let user_Sender = "user_Sender"
    
    
   
    
}



