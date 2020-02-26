//
//  ChatLogSendTextView.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 04/12/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit

protocol AddMessageDelegate {
    func handleSend(_ text: String)
}

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
    
    var addMessageDelegate: AddMessageDelegate?
    
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
        if let text = textField.text, !text.isEmpty {
            addMessageDelegate?.handleSend(text)
        }
    }
    
}

// To enable 'return' key to send the message
extension ChatLogSendTextView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            addMessageDelegate?.handleSend(text)
        }
        return true
    }
}
