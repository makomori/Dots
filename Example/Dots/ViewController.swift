//
//  ViewController.swift
//  Dots
//
//  Created by makomori on 05/11/2017.
//  Copyright (c) 2017 makomori. All rights reserved.
//

import UIKit
import Dots

class ViewController: UIViewController {
    var loadingView: DotsLoadingView?
    @IBOutlet weak var firstHex: UITextField!
    @IBOutlet weak var secondHex: UITextField!
    @IBOutlet weak var thirdHex: UITextField!
    @IBOutlet weak var fourthHex: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showGoogleProgress(_ sender: Any) {
        self.stop(self)
        self.loadingView = DotsLoadingView(colors: nil)
        self.loadingView?.show()
    }
    
    @IBAction func showCustomProgress(_ sender: Any) {
        self.stop(self)
        let firstColor = UIColor(red: 1.0, green: 0.631, blue: 0.761, alpha: 1.0)
        let secondColor = UIColor(red: 1.0, green: 0.431, blue: 0.631, alpha: 1.0)
        let thirdColor = UIColor(red: 1.0, green: 0.259, blue: 0.522, alpha: 1.0)
        let fourthColor = UIColor(red: 1.0, green: 0.082, blue: 0.408, alpha: 1.0)
        self.loadingView = DotsLoadingView(colors: [firstColor, secondColor, thirdColor, fourthColor])
        self.loadingView?.show()
    }
    
    @IBAction func stop(_ sender: Any) {
        if let _ = self.loadingView {
            self.loadingView?.stop()
            self.loadingView = nil
        }
    }
}
