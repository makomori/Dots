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

    override func viewDidLoad() {
        super.viewDidLoad()
        let loadingView = DotsLoadingView(colors: nil)
        loadingView.show()
    }
}
