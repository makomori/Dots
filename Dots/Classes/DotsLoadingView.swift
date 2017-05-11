//
//  DotsLoadingView.swift
//  Dots 
//
//  Created by 母利睦人 on 2017/05/11.
//  Copyright © 2017年 makomori. All rights reserved.
//

import UIKit

class DotsLoadingView: UIView {
    let delay = 0.25
    let length = 15
    let myBlue = UIColor.hexStr(hexStr: "#4284F7", alpha: 1.0)
    let myRed = UIColor.hexStr(hexStr: "#F74239", alpha: 1.0)
    let myYellow = UIColor.hexStr(hexStr: "#FDBC02", alpha: 1.0)
    let myGreen = UIColor.hexStr(hexStr: "#4AB552", alpha: 1.0)
    
    override func willMove(toSuperview newSuperview: UIView?) {
        self.backgroundColor = UIColor.black
        let colors = [myBlue, myRed, myYellow, myGreen]
        for i in 0..<colors.count {
            let dotX = self.center.x - CGFloat(Double(2-i)*Double(length) * 2.5)
            let dotFrame = CGRect(x: dotX, y: self.center.y, width: CGFloat(length), height: CGFloat(length))
            let dot = DotView(color: colors[i], delay: self.delay*Double(i), frame: dotFrame)
            self.addSubview(dot)
        }
    }
}
