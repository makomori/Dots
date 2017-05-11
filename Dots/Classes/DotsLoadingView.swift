//
//  DotsLoadingView.swift
//  Dots 
//
//  Created by 母利睦人 on 2017/05/11.
//  Copyright © 2017年 makomori. All rights reserved.
//

import UIKit

public class DotsLoadingView: UIView {
    private let delay = 0.25
    private let length = 15
    
    public let loadingViewBackgroundColor = UIColor.white
    
    private let myBlue = UIColor.hexStr(hexStr: "#4284F7", alpha: 1.0)
    private let myRed = UIColor.hexStr(hexStr: "#F74239", alpha: 1.0)
    private let myYellow = UIColor.hexStr(hexStr: "#FDBC02", alpha: 1.0)
    private let myGreen = UIColor.hexStr(hexStr: "#4AB552", alpha: 1.0)
    
    public let colors: [UIColor] = []
    
    public init(colors: [UIColor]?) {
        super.init(frame: CGRect(x: 0, y: 0, width: 150, height: 100))
        if let _ = colors {
            if colors?.count == 4 {
                // set custom colors
            } else {
                print("You can set custom colors only if you set four colors.")
                self.colors = colors
            }
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func show() {
        if let rootViewController = UIApplication.shared.windows.first?.rootViewController {
            rootViewController.view.addSubview(self)
            self.center = rootViewController.view.center
            self.startAnimation()
        } else {
            print("Cannot show DotsLoadingView.")
        }
    }
    
    public func stop() {
        self.removeFromSuperview()
    }
    
    private func startAnimation() {
        let colors = [myBlue, myRed, myYellow, myGreen]
        for i in 0..<colors.count {
            let dotFrame = CGRect(x: 0, y: 0, width: CGFloat(length), height: CGFloat(length))
            let dot = DotView(color: colors[i], delay: self.delay*Double(i), frame: dotFrame)
            dot.center = CGPoint(x: self.frame.width/8 + CGFloat(i)*self.frame.width/4, y: self.frame.height/2)
            self.addSubview(dot)
        }
    }
}
