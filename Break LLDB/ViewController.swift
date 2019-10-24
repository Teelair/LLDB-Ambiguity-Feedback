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
        
        /*
         Relevant Information:
         There are three targets in this project, Break LLDB, Secondary Target and Tertiary Target.
         Secondary Target has a single file aside from its Info.plist, SecondaryExtension.swift
         SecondaryExtension.swift declares a public extension on UIViewController with the property
         'somePropertyInAnotherTarget' and a function 'someFunctionInAnotherTarget'
         At the breakpoint ahead, running 'po self.somePropertyInAnotherTarget' works fine and lldb
         prints out the result as expected.
         
         Tertiary Target is structured similarly, and has two files aside from its Info.plist, TertiaryExtension.swift and Tertiary_Target.h.
         Similar to Secondary Target, Tertiary Target also defines a variable and function inside TertiaryExtension.swift, and has its own extremely similar implementation.
         Tertiary_Target.h is empty besides for a comment, and its content does not seem to matter through my testing.
         However, two things do seem to matter:
         - The filename. The default mapping provided by module.modulemap means that the file should be named Tertiary_Target.h.
         Other header files alone do not influence this bug.
         - The target membership. This one seems somewhat like a no-brainer, but if you give the file no target membership, then
         this bug does not happen.
         At the breakpoint ahead, if you run 'po self.somePropertyInAnotherTargetWithAHeader' in lldb, you'll see the following:
         
         error: <EXPR>:3:1: error: ambiguous use of 'somePropertyInAnotherTargetWithAHeader'
         self.somePropertyInAnotherTargetWithAHeader
         
         This is definitely unexpected because there is no difference between Secondary Target and Tertiary Target other than the empty umbrella header.
         
         
         
         Steps to reproduce:
         - Run 'po self.somePropertyInAnotherTargetWithAHeader' in lldb. You'll see the following:
         
         error: <EXPR>:3:1: error: ambiguous use of 'somePropertyInAnotherTargetWithAHeader'
         self.somePropertyInAnotherTargetWithAHeader
         ^
         
         Running 'po self.someProperty' or 'po self.somePropertyInAnotherTarget' in lldb results in a correct evaluation of that property.
         
         
         
         Expected results:
         lldb prints a correct evaluation of self.somePropertyInAnotherTargetWithAHeader, because it is truly un-ambiguous.
         
         
         
         Actual results:
         lldb finds that self.somePropertyInAnotherTargetWithAHeader is ambiguous, when in reality it is not.
         */
        
        print("Break here")
    }
}
