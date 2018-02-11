//
//  UIView.swift
//  AH Utils
//
//  Created by Akram Hussein on 18/1/2018.
//  Copyright © 2018 Akram Hussein. All rights reserved.
//

import UIKit

public extension UIView {

    public func layoutAttachAll(to parentView: UIView) {
        var constraints = [NSLayoutConstraint]()
        self.translatesAutoresizingMaskIntoConstraints = false
        constraints.append(NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: parentView, attribute: .left, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: parentView, attribute: .right, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: parentView, attribute: .top, multiplier: 1.0, constant: 0))
        constraints.append(NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: parentView, attribute: .bottom, multiplier: 1.0, constant: 0))
        parentView.addConstraints(constraints)
    }

    public func addSubviewAndAttach(subview: UIView, clipsToBounds: Bool = true) {
        self.addSubview(subview)
        subview.layoutAttachAll(to: self)
        self.clipsToBounds = true
    }

    @discardableResult
    func fromNib<T: UIView>(bundle: Bundle = Bundle.main, named: String? = nil) -> T? {
        let name = named ?? String(describing: type(of: self))
        guard let view = bundle.loadNibNamed(name, owner: self, options: nil)?[0] as? T else {
            print("Xib not loaded, or it's top view is of the wrong type")
            return nil
        }

        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layoutAttachAll(to: self)
        return view
    }
}
