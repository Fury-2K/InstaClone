//
//  ChatLogSendTextView.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 04/12/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit
import Firebase

class ChatLogSendTextView: UIView {
    
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var cameraBtn: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var audioBtn: UIButton!
    @IBOutlet weak var imageBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var cameraBtnWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var cameraBtnHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var defaultStackView: UIStackView!
    @IBOutlet weak var sendBtn: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("ChatLogSendTextView", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        setupCameraBtn()
        setupTextField()
        
        defaultStackView.isHidden = false
        sendBtn.isHidden = true
    }
    
    func setupCameraBtn() {
        cameraBtnHeightConstraint.constant = containerView.frame.height - 8
        cameraBtnWidthConstraint.constant = containerView.frame.height - 8
        cameraBtn.layer.cornerRadius = cameraBtnHeightConstraint.constant / 2
    }
    
    func setupTextField() {
        textField.delegate = self
        textField.placeholder = "Message..."
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let textFieldValue = textField.text else { return }
        
        defaultStackView.isHidden = textFieldValue != ""
        sendBtn.isHidden = textFieldValue == ""
        cameraBtnWidthConstraint.constant = textFieldValue == "" ? 32 : 28
        cameraBtnHeightConstraint.constant = textFieldValue == "" ? 32 : 28
        cameraBtn.layer.cornerRadius = cameraBtnHeightConstraint.constant / 2
    }
    
    @IBAction func sendBtnTapped(_ sender: UIButton) {
        handleSend(textField.text)
        textField.text = ""
    }
    
    func handleSend(_ text: String? = nil) {
        guard let message = text else { return }
        let ref = Database.database().reference().child("Messages")
        let childRef = ref.childByAutoId()
        // Force unwrapped because this method can only be called when user is signedIn
        let fromId = Auth.auth().currentUser!.uid
        let toId = "TestUser"
        let timeStamp: Int = Int(NSDate().timeIntervalSince1970)
        let values: [String: Any] = [
            "toId": toId,
            "fromId": fromId,
            "data": message,
            "timeStamp": timeStamp
            ]
        childRef.updateChildValues(values)
    }
    
}

extension ChatLogSendTextView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        handleSend()
        return true
    }
}
