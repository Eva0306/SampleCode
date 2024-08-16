//
//  ViewController.swift
//  ScrollView Sample
//
//  Created by 楊芮瑊 on 2024/8/15.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let orangeView = UIView()
        orangeView.backgroundColor = orangeColor
        let blueView = UIView()
        blueView.backgroundColor = blueColor
        
        orangeView.frame =
        CGRect(x: 46, y: 176, width: 300, height: 500)
        
        view.addSubview(orangeView)
        
        blueView.frame = 
        CGRect(x: 100, y: 100, width: 100, height: 100)
        
        orangeView.addSubview(blueView)
        
        orangeView.bounds = CGRect(x: -100, y: -100, width: 300, height: 500)
        
        print("Orange View frame:\n\(orangeView.frame)")
//        print("Orange View bounds:\n\(orangeView.bounds)")
//        print("Blue View frame:\n\(blueView.frame)")
//        print("Blue View bounds:\n\(blueView.bounds)")
    }
}

