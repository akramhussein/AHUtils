//
//  UILabel+Additions.swift
//  AHUtils
//
//  Created by Akram Hussein on 08/23/2017.
//  Copyright (c) 2017 Akram Hussein. All rights reserved.
//

import UIKit

final class PopGestureDelegate: UIViewController, UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
