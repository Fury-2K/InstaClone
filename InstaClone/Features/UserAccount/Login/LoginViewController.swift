//
//  LoginViewController.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 14/11/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    let viewModel: UserViewModel = UserViewModel()
    weak var userSigningDelegate: UserSigningDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func loginTapped(_ sender: UIButton) {
        guard let email = emailTextField.text,
        let password = passwordTextField.text else { return }
        showLoadingAnimation()
        viewModel.signInUser(email, password, didFinishWithSuccess: { username, email in
            self.hideLoadingAnimation()
            self.userSigningDelegate?.loginUser(email, password)
        }, didFinishWithError: { (error, discription) in
            self.hideLoadingAnimation()
            let alert = AlertService.shared.createErrorAlert(error, discription, retryHandler: {_ in
                self.loginTapped(sender)
            }, cancelHandler: {_ in
                self.dismiss(animated: true, completion: nil)
            })
            self.present(alert, animated: true, completion: nil)
        })
        
    }
}
