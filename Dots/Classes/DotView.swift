//
//  DotView.swift
//  Dots
//
//  Created by 母利睦人 on 2017/05/11.
//  Copyright © 2017年 makomori. All rights reserved.
//

import UIKit

class DotView: UIView {
    private let expandRate: CGFloat = 2.0
    private let animationDuration = 0.4
    private var expanding = false
    private var animationDelay: Double?
    
    init(color: UIColor, delay: Double, frame: CGRect) {
        super.init(frame: frame)
        
        // Create circle shape
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
        
        self.backgroundColor = color
        self.animationDelay = delay
        self.startAnimation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func startAnimation() {
        if #available(iOS 10.0, *) {
            var animator = UIViewPropertyAnimator(duration: self.animationDuration, curve: .linear)
            if self.expanding {
                // shrink
                animator = UIViewPropertyAnimator(duration: self.animationDuration / 1.05, curve: .easeInOut)
                animator.addAnimations({
                    // animate transform
                    self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                })
            } else {
                // expand
                animator.addAnimations({
                    // animate transform
                    self.transform = CGAffineTransform(scaleX: self.expandRate, y: self.expandRate)
                })
            }
            
            animator.addCompletion { _ in
                self.startAnimation()
            }
            
            animator.startAnimation(afterDelay: self.animationDelay!)
            // update expanding boolean value
            if self.expanding {
                self.expanding = false
                // set animation delay for expand
                self.animationDelay = 0.9
            } else {
                self.expanding = true
                // set animation delay for shrink
                self.animationDelay = 0.1
            }
        } else {
            // Fallback on earlier versions
            print("It's only availabel from iOS 10")
        }
    }
}
