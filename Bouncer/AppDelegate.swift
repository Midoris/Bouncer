//
//  AppDelegate.swift
//  Bouncer
//
//  Created by тигренок  on 11/28/15.
//  Copyright (c) 2015 Midori.s. All rights reserved.
//

import UIKit
import CoreMotion

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // motion is done using hardware that must be shared
    // so anyone in this app using CoreMotion must use this
    struct Motion {
        static let Manager = CMMotionManager()
    }

}

