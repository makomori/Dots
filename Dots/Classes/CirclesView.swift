//
//  CirclesView.swift
//  Dots 
//
//  Created by 母利睦人 on 2017/05/11.
//  Copyright © 2017年 makomori. All rights reserved.
//

extension UIColor {
    class func hexStr ( hexStr : NSString, alpha : CGFloat) -> UIColor {
        var hexStr = hexStr
        let alpha = alpha
        hexStr = hexStr.replacingOccurrences(of: "#", with: "") as NSString
        let scanner = Scanner(string: hexStr as String)
        var color: UInt32 = 0
        if scanner.scanHexInt32(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:alpha)
        } else {
            print("invalid hex string")
            return UIColor.white;
        }
    }
}

import UIKit

class CirclesView: UIView {
    let delay = 0.25
    let length = 15
    var circles: [CircleView] = []
    let myBlue = UIColor.hexStr(hexStr: "#4284F7", alpha: 1.0)
    let myRed = UIColor.hexStr(hexStr: "#F74239", alpha: 1.0)
    let myYellow = UIColor.hexStr(hexStr: "#FDBC02", alpha: 1.0)
    let myGreen = UIColor.hexStr(hexStr: "#4AB552", alpha: 1.0)
    
    let myPink = UIColor.hexStr(hexStr: "#E64E79", alpha: 1.0)
    let myEmerald = UIColor.hexStr(hexStr: "#3BAE80", alpha: 1.0)
    let myOrange = UIColor.hexStr(hexStr: "#FF89570", alpha: 1.0)
    let myVividGreen = UIColor.hexStr(hexStr: "#8EE24D", alpha: 1.0)
    
    override func willMove(toSuperview newSuperview: UIView?) {
        self.backgroundColor = UIColor.black
        let colors = [myBlue, myRed, myYellow, myGreen]
        for i in 0..<colors.count {
            let circleX = self.center.x - CGFloat(Double(2-i)*Double(length) * 2.5)
            let circleFrame = CGRect(x: circleX, y: self.center.y, width: CGFloat(length), height: CGFloat(length))
            let circle = CircleView(color: colors[i], delay: self.delay*Double(i), frame: circleFrame)
            self.addSubview(circle)
        }
    }
}
