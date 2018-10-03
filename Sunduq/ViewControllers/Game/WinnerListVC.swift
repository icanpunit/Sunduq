//
//  WinnerListVC.swift
//  Sunduq
//
//  Created by Mandip Kanjiya on 19/07/18.
//  Copyright © 2018 I Can Infotech. All rights reserved.
//

import UIKit
let  WinnerCellID = "WinnerCell"
class WinnerListVC: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var lblWinnerTitle: UILabel!
    @IBOutlet weak var lblTotalWinner: UILabel!
    @IBOutlet weak var lblDoller: UILabel!
    @IBOutlet weak var MainVC: UIView!
    @IBOutlet weak var TopView: UIView!
    @IBOutlet var tblMainVC: UITableView!
    //MARK:- UIView Method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
    }
    func setUp(){
        
        self.tblMainVC.estimatedRowHeight = 44
        self.tblMainVC.rowHeight = UITableViewAutomaticDimension
        self.MainVC.backgroundColor = ColorAppRed
        self.lblDoller.textColor = ColorAppGreen
        self.lblWinnerTitle.textColor = ColorAppOrange
        self.lblTotalWinner.textColor = ColorAppGreen
        // Fonts Size
//        self.lblTotalWinner.font = UIFont.init(name: FontBold, size: 17)
//        self.lblDoller.font = UIFont.init(name: FontBold, size: 25)
//        self.lblWinnerTitle.font = UIFont.init(name: FontBold, size: 30)


    }
}
//MARK:- UITableview DataSource & delegate
extension WinnerListVC : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: WinnerCellID) as! WinnerCell
        cell.lblName.text = "Christiano Ronaldo"
        cell.lblDoller.text = "40$.0"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
