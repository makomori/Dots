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
  
  
  private let myBlue = UIColor.hexStr(hexStr: "#4284F7", alpha: 1.0)
  private let myRed = UIColor.hexStr(hexStr: "#F74239", alpha: 1.0)
  private let myYellow = UIColor.hexStr(hexStr: "#FDBC02", alpha: 1.0)
  private let myGreen = UIColor.hexStr(hexStr: "#4AB552", alpha: 1.0)
  public var colors: [UIColor] = []
  private var dots: [DotView] = []
  var backGoundView = UIView()
  @IBInspectable var dotBackgoundColor : UIColor = UIColor.clear
  @IBInspectable var mainBackgroundColor: UIColor = UIColor.clear
  
  public init(colors: [UIColor]?) {
    super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    self.backGoundView.frame.size = CGSize(width: 150, height: 100)
    self.backGoundView.center = self.center
    self.backGoundView.backgroundColor = dotBackgoundColor.withAlphaComponent(0.7)
    self.addSubview(backGoundView)
    self.backgroundColor = mainBackgroundColor.withAlphaComponent(0.7)
    if let customColors = colors {
      if customColors.count == 4 {
        // set custom colors
        self.colors = customColors
      } else {
        print("You can set custom colors only if you set four colors.")
        self.colors = [myBlue, myRed, myYellow, myGreen]
      }
    } else {
      self.colors = [myBlue, myRed, myYellow, myGreen]
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
    if #available(iOS 10.0, *) {
      let animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut) {
        for dot in self.dots {
          dot.alpha = 0
        }
      }
      animator.startAnimation()
      animator.addCompletion { _ in
        self.backGoundView.removeFromSuperview()
        self.removeFromSuperview()
      }
    } else {
      // Fallback on earlier versions
      print("It's only availabel from iOS 10")
    }
  }
  
  private func startAnimation() {
    for i in 0..<colors.count {
      let dotFrame = CGRect(x: 0, y: 0, width: CGFloat(length), height: CGFloat(length))
      let dot = DotView(color: colors[i], delay: self.delay*Double(i), frame: dotFrame)
      dot.center = CGPoint(x: self.backGoundView.frame.width/8 + CGFloat(i)*self.backGoundView.frame.width/4, y: self.backGoundView.frame.height/2)
      dots.append(dot)
      self.backGoundView.addSubview(dot)
    }
  }
}
