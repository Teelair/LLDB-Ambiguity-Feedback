//
//  TertiaryExtension.swift
//  Tertiary Target
//
//  Created by Tyler R on 10/24/19.
//  Copyright © 2019 Teelair. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    var somePropertyInAnotherTargetWithAHeader: Bool {
        return true
    }
    
    func someFunctionInAnotherTargetWithAHeader() {
        print("Some function in the tertiary target with a header file in it ran")
    }
}
