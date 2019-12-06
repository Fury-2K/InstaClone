//
//  RegistrationViewController.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 14/11/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import UIKit

protocol UserSigningDelegate: class {
    func userRegistered(_ username: String, _ email: String)
    func userLoggedIn(_ email: String, _ password: String)
}

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    
    weak var userSigningDelegate: UserSigningDelegate?
    let viewModel: UserViewModel = UserViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerBtnTapped(_ sender: UIButton) {
        guard let username = userNameTextField.text else { return }
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        createUser(username, email, password)
    }
    
    func createUser(_ username: String, _ email: String, _ password: String) {
        viewModel.createUser(username, email, password, didFinishWithSuccess: { username, email in
            self.userSigningDelegate?.userRegistered(username, email)
        }, didFinishWithError: { error in
            print("error: ", error)
        })
    }

}
