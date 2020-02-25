//
//  UserAccountViewController.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 14/11/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import UIKit

class UserAccountViewController: UIViewController {

    @IBOutlet weak var pageSwitcher: UISegmentedControl!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet var userImageView: UIImageView!
    
    let loginViewController = LoginViewController()
    let registerViewController = RegistrationViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContentView()
        setupImageView()
        loginViewController.userSigningDelegate = self
        registerViewController.userSigningDelegate = self
    }
    
    private func setupImageView() {
        userImageView.layer.cornerRadius = userImageView.frame.height/2
        userImageView.addTapGesture(#selector(openImagePicker), target: self)
    }
    
    private func setupContentView() {
        let isLoginSelected: Bool = pageSwitcher.selectedSegmentIndex == 1
        
        userImageView.isHidden = isLoginSelected
        
        contentView.addSubview(isLoginSelected ? loginViewController.view : registerViewController.view)
        addChild(isLoginSelected ? loginViewController : registerViewController)
        addSubViewConstraints(isLoginSelected ? loginViewController.view : registerViewController.view)
    }
    
    @objc private func openImagePicker() {
        showLoadingAnimation()
        let imagePickerViewController = UIImagePickerController()
        imagePickerViewController.delegate = self
        present(imagePickerViewController, animated: true, completion: {
            self.hideLoadingAnimation()
        })
    }
    
    private func addSubViewConstraints(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        view.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }

    @IBAction func pageSwitcherTriggered(_ sender: UISegmentedControl) {
        setupContentView()
    }
}

// --------------------------
// MARK: - UserSigningDelegate
// --------------------------

extension UserAccountViewController: UserSigningDelegate {
    func loginUser(_ email: String, _ password: String) {
        UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
        
        let mainViewController = MainViewController()
        let navigationController = UINavigationController(rootViewController: mainViewController)

        navigationController.navigationBar.isOpaque = true
        navigationController.navigationBar.tintColor = .black
        navigationController.navigationBar.backgroundColor = .white
        UIApplication.shared.keyWindow?.rootViewController = navigationController
    }
}

// --------------------------
// MARK: - UIImagePickerControllerDelegate and UINavigationControllerDelegate
// --------------------------

extension UserAccountViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            userImageView.image = image
            registerViewController.userImage = image
        }
        dismiss(animated: true, completion: nil)
    }
    
}
