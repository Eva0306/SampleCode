//
//  ScrollViewController.swift
//  ScrollView Sample
//
//  Created by 楊芮瑊 on 2024/8/15.
//

import UIKit

class ScrollViewController: UIViewController, UIScrollViewDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 設定 ScrollView
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .lightGray
        
        // 設定 contentInset
        //scrollView.contentInset = UIEdgeInsets(top: 0, left: 70, bottom: 0, right: 70)
        scrollView.isPagingEnabled = true // 開啟分頁
        scrollView.delegate = self // 設置代理
        
        view.addSubview(scrollView)
        
        // 設定 ScrollView 的約束條件
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 59),
            scrollView.heightAnchor.constraint(equalToConstant: 500)
        ])
        
        // 建立一個容器視圖，放置在 ScrollView 中
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(containerView)
        
        // 設定容器視圖的約束條件
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
        
        // 設定視圖的寬度相對於四個視圖的總寬度
        let viewWidth: CGFloat = view.frame.width
        
        // 建立並配置四個視圖
        let colors: [UIColor] = [blueColor, orangeColor, purpleColor, redColor]
        
        var previousView: UIView? = nil
        
        for (index, color) in colors.enumerated() {
            let coloredView = UIView()
            coloredView.backgroundColor = color
            coloredView.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview(coloredView)
            
            NSLayoutConstraint.activate([
                coloredView.topAnchor.constraint(equalTo: containerView.topAnchor),
                coloredView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
                coloredView.widthAnchor.constraint(equalToConstant: viewWidth)
            ])
            
            if let previous = previousView {
                coloredView.leadingAnchor.constraint(equalTo: previous.trailingAnchor).isActive = true
            } else {
                coloredView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
            }
            
            // 設定最後一個視圖的 trailing
            if index == colors.count - 1 {
                coloredView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
            }
            
            previousView = coloredView
        }
    }
}
