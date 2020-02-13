//
//  RegistrationViewController.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 14/11/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import UIKit

protocol UserSigningDelegate: class {
    func loginUser(_ email: String, _ password: String)
}

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    
    weak var userSigningDelegate: UserSigningDelegate?
    let viewModel: UserViewModel = UserViewModel()
    var userImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerBtnTapped(_ sender: UIButton) {
        guard let username = userNameTextField.text,
        let email = emailTextField.text,
        let password = passwordTextField.text,
        let userImage = userImage else { return }
        createUser(username, email, password, userImage)
    }
    
    private func createUser(_ username: String, _ email: String, _ password: String, _ userImage: UIImage?) {
        showLoadingAnimation()
        viewModel.createUser(username, email, password, userImage, didFinishWithSuccess: { username, email in
            self.userSigningDelegate?.loginUser(username, email)
            self.hideLoadingAnimation()
        }, didFinishWithError: { error in
            print("error: ", error)
            self.hideLoadingAnimation()
        })
    }

}
