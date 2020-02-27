//
//  AlertService.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 27/02/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation
import UIKit

enum PopupType {
    case popup
    case signout
    case loader
    case error
}

class AlertService {
    
    public static var shared : AlertService = AlertService()
    
    /// Creates a single action popup
    /// - Parameters:
    ///   - title: Title of popup. **DEFAULT VALUE = 'Alert'**
    ///   - message: Body of popup
    ///   - actionHandler: Okay button pressed **Generally to dismiss the Popup**
    func createAlertPopup(_ title: String = "Alert", for message: String, actionHandler:  @escaping ((UIAlertAction) -> Void?)) -> UIAlertController {
        let popup = UIAlertController(title: title, message: message, preferredStyle: .alert)
        popup.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { result in
            actionHandler(result)
        }))
        return popup
    }
    
    /// Creates a logout sheet
    /// - Parameters:
    ///   - cancelHandler: Handler for the event when user clicks cancel butto
    ///   - logoutHandler: Handler for the event when user clicks logout button
    func createLogoutSheet(cancelHandler:  @escaping ((UIAlertAction) -> Void?), logoutHandler:  @escaping ((UIAlertAction) -> Void?)) -> UIAlertController {
        let logoutSheet = UIAlertController(title: "Sign out?", message: "You can always access your content by signing back in", preferredStyle: .actionSheet)
                logoutSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { result in
                    cancelHandler(result)
                }))
                logoutSheet.addAction(UIAlertAction(title: "Sign out", style: .destructive, handler: { result in
                    logoutHandler(result)
                }))
        return logoutSheet
    }
    
    /// Creates a LoaderView
    func createLoaderAlert() -> UIAlertController {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        return alert
    }
    
    /// Creates an error popup with 2 actions
    /// - Parameters:
    ///   - title: Title for the popup. **DEFAULT VALUE = 'Alert'**
    ///   - message: Body for the popup
    ///   - retryHandler: Handler for the event when user clicks retry button
    ///   - cancelHandler: Handler for the event when user clicks cancel button
    func createErrorAlert(_ title: String = "Alert", _ message: String, retryHandler:  @escaping ((UIAlertAction) -> Void?), cancelHandler:  @escaping ((UIAlertAction) -> Void?)) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { result in
            cancelHandler(result)
        }))
        alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { result in
            retryHandler(result)
        }))
        return alert
    }
}
