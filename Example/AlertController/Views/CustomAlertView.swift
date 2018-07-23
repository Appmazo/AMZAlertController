//
//  CustomAlertView.swift
//  AlertController_Example
//
//  Created by James Hickman on 7/23/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class CustomAlertView: UIView {
    private let pageControl = UIPageControl()
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 17.0, weight: .medium)
        titleLabel.text = "Alert with Custom View"
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        
        let detailsLabel = UILabel()
        detailsLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        detailsLabel.text = "👈🏽 Try Scrolling Me! 👉🏽"
        detailsLabel.textAlignment = .center
        addSubview(detailsLabel)
        
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        addSubview(scrollView)
        
        pageControl.pageIndicatorTintColor = UIColor.appmazoDarkGray
        pageControl.currentPageIndicatorTintColor = UIColor.appmazoDarkOrange
        pageControl.isUserInteractionEnabled = false
        addSubview(pageControl)
        
        let imageWidth = 50.0
        let imageHeight = 50.0
        let slideCount: Int = 6
        let slideWidth: CGFloat = UIScreen.main.modalWidth() // Width of alert
        let slideHeight: CGFloat = 100.0
        var slideOffset: CGFloat = 0.0
        let slideImages = [UIImage(named: "icon-exclamation-circle"),
                           UIImage(named: "icon-exclamation-triangle-hollow"),
                           UIImage(named: "icon-exclamation-triangle-filled-yellow"),
                           UIImage(named: "icon-exclamation-triangle-filled"),
                           UIImage(named: "icon-exclamation-triangle-filled-red"),
                           UIImage(named: "icon-siren")]
        for i in 0..<slideCount {
            let slide = UIView(frame: CGRect(x: slideOffset, y: 0.0, width: slideWidth, height: slideHeight))
            scrollView.addSubview(slide)
            
            let imageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: imageWidth, height: imageHeight))
            imageView.image = slideImages[i]
            imageView.contentMode = .scaleAspectFit
            slide.addSubview(imageView, centeredWithView: slide)
            
            slideOffset = slide.frame.maxX
        }
        scrollView.contentSize = CGSize(width: slideOffset, height: slideHeight)
        pageControl.numberOfPages = slideCount
        
        let views = ["titleLabel": titleLabel,
                     "detailsLabel": detailsLabel,
                     "scrollView": scrollView,
                     "pageControl" : pageControl]
        let metrics = ["scrollViewHeight": slideHeight]
        
        for (_, view) in views {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "|-[titleLabel]-|", options: [], metrics: metrics, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "|-[detailsLabel]-|", options: [], metrics: metrics, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "|[scrollView]|", options: [], metrics: metrics, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[titleLabel]-16-[detailsLabel]-16-[scrollView(scrollViewHeight)]-16-[pageControl]-|", options: [], metrics: metrics, views: views))
        
        NSLayoutConstraint(item: pageControl, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0.0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomAlertView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let slideWidth: CGFloat = UIScreen.main.modalWidth() // Width of alert
        let currentPage = Int(scrollView.contentOffset.x / CGFloat(slideWidth))
        pageControl.currentPage = currentPage
    }
}
