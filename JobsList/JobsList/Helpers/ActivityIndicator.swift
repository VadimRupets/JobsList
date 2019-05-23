//
//  ActivityIndicator.swift
//  JobsList
//
//  Created by Vadzim Rupets on 5/23/19.
//  Copyright © 2019 Vadim Rupets. All rights reserved.
//

import Foundation
import UIKit

class ActivityIndicator {
    private static let activityIndicatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        return view
    }()
    
    static func show() {
        guard let keyWindow = UIApplication.shared.keyWindow else { return }
        keyWindow.addSubview(activityIndicatorView)
        
        activityIndicatorView.leadingAnchor.constraint(equalTo: keyWindow.leadingAnchor).isActive = true
        activityIndicatorView.trailingAnchor.constraint(equalTo: keyWindow.trailingAnchor).isActive = true
        activityIndicatorView.topAnchor.constraint(equalTo: keyWindow.topAnchor).isActive = true
        activityIndicatorView.bottomAnchor.constraint(equalTo: keyWindow.bottomAnchor).isActive = true
        
        keyWindow.layoutIfNeeded()
    }
    
    static func hide() {
        activityIndicatorView.removeFromSuperview()
    }
}
