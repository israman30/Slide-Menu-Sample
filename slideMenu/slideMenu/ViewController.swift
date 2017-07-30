//
//  ViewController.swift
//  slideMenu
//
//  Created by Israel Manzo on 7/29/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var menuVC: MenuViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuVC = storyboard?.instantiateViewController(withIdentifier: "menu") as! MenuViewController
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeMenu(guesture:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeMenu(guesture:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        
        view.addGestureRecognizer(swipeRight)
        view.addGestureRecognizer(swipeLeft)

    }
    
    func swipeMenu(guesture: UISwipeGestureRecognizer){
        switch guesture.direction {
        case UISwipeGestureRecognizerDirection.right:
            showMenu()
//            print("Right Swipe")
        case UISwipeGestureRecognizerDirection.left:
            closeWhenSwipe()
//            print("Left Swipe")
        default:
            break
        }
    }

    @IBAction func menuBtn(_ sender: Any) {
        
        if AppDelegate.isMenu {
            showMenu()
        } else {
            closeMenu()
        }
    }
    
    func closeWhenSwipe(){
        if AppDelegate.isMenu {
//            showMenu()
        } else {
            closeMenu()
        }
    }
    
    func showMenu(){
        UIView.animate(withDuration: 0.3) { 

            self.menuVC.view.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            
            self.menuVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            self.addChildViewController(self.menuVC)
            self.view.addSubview(self.menuVC.view)
            AppDelegate.isMenu = false
        }
    }
 
    func closeMenu(){
        UIView.animate(withDuration: 0.3, animations: { 
            self.menuVC.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        }) { (done) in
            self.menuVC.view.removeFromSuperview()
        }
        
        AppDelegate.isMenu = true
    }

}

