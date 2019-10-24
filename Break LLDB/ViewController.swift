//
//  ViewController.swift
//  Break LLDB
//
//  Created by Tyler R on 10/24/19.
//  Copyright © 2019 Teelair. All rights reserved.
//

import UIKit
import Secondary_Target
import Tertiary_Target

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.someProperty)
        print(self.somePropertyInAnotherTarget)
        print(self.somePropertyInAnotherTargetWithAHeader)
        
        self.someFunction()
        self.someFunctionInAnotherTarget()
        self.someFunctionInAnotherTargetWithAHeader()
        
        print("Break here")
    }
}
