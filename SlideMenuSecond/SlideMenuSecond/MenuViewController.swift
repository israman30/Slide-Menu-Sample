//
//  MenuViewController.swift
//  SlideMenuSecond
//
//  Created by Israel Manzo on 7/30/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var titles = ["Menu", "Email", "Contact", "Website", "Phone", "Thumbsnail"]

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var menuPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        menuPhoto.layer.cornerRadius = 70
        menuPhoto.layer.borderWidth = 2
        menuPhoto.layer.borderColor = UIColor.red.cgColor
        menuPhoto.layer.masksToBounds = false
        menuPhoto.clipsToBounds = true
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MenuTableViewCell
        
        cell.titleLbl.text = titles[indexPath.row]
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let revealVC:SWRevealViewController = revealViewController()
//        
//        let cell: MenuTableViewCell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
//        
//        if cell.titleLbl.text == "Home" {
//            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let desController = mainStoryboard.instantiateViewController(withIdentifier: "") as! ViewController
//            let newFrontVC = UINavigationController()
//        }
//    }
}



