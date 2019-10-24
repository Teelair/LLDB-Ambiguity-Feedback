//
//  SecondaryExtension.swift
//  Secondary Target
//
//  Created by Tyler R on 10/24/19.
//  Copyright © 2019 Teelair. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    var somePropertyInAnotherTarget: Bool {
        return true
    }
    
    func someFunctionInAnotherTarget() {
        print("Some function in the secondary target ran")
    }
}
