//
//  UIDevice.swift
//  AHUtils
//
//  Created by Akram Hussein on 08/23/2017.
//  Copyright (c) 2017 Akram Hussein. All rights reserved.
//

import UIKit

public extension UIDevice {
    var iPhone: Bool {
        return UIDevice().userInterfaceIdiom == .phone
    }

    enum ScreenType: String {
        case iPhone4
        case iPhone5
        case iPhone6
        case iPhone6Plus
        case unknown
    }

    var screenType: ScreenType {
        guard iPhone else { return .unknown }

        switch UIScreen.main.nativeBounds.height {
        case 960:
            return .iPhone4
        case 1136:
            return .iPhone5
        case 1334:
            return .iPhone6
        case 2208:
            return .iPhone6Plus
        default:
            return .unknown
        }
    }
}
