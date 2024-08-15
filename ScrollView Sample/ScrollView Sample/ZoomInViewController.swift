//
//  ZoomableViewController.swift
//  ScrollView Sample
//
//  Created by 楊芮瑊 on 2024/8/15.
//

import UIKit

class ZoomableViewController: UIViewController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 設置 ScrollView
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 4.0
        view.addSubview(scrollView)
        
        // 設置 ImageView
        let imageView = UIImageView(image: UIImage(systemName: "photo.artframe"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = scrollView.bounds
        imageView.tintColor = orangeColor
        scrollView.addSubview(imageView)
        
        // 設置 ScrollView 的內容大小
        scrollView.contentSize = imageView.bounds.size
    }
    
    // Delegate method for zooming
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scrollView.subviews.first
    }
    
    
}

