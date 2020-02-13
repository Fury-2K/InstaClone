//
//  ChatLogViewController.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 26/11/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class ChatLogViewController: UIViewController {

    @IBOutlet weak var chatLogSendTextView: ChatLogSendTextView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewModel: ChatViewModel = ChatViewModel()
    
    var user: User?
    var messages: [Message] = [] {
        didSet {
            collectionView.reloadData()
            collectionView.scrollToItem(at: IndexPath(item: messages.count - 1, section: 0), at: [.centeredVertically, .centeredHorizontally], animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationBar(user?.username, user?.name)
        
        setupView()
        setupCollectionView()
        APIClient.fetchMessages(didFinishWithSuccess: { (result) in
            if result.toId == self.user?.uid || result.fromId == self.user?.uid { self.messages.append(result) }
        }) { (errorCode, error) in
            print(errorCode, error)
        }
        
        chatLogSendTextView.addMessageDelegate = self
    }

    func setupView() {
        chatLogSendTextView.layer.borderWidth = 1
        chatLogSendTextView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        chatLogSendTextView.layer.cornerRadius = chatLogSendTextView.frame.height / 2
    }
}

extension ChatLogViewController: UICollectionViewDelegate,  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.isScrollEnabled = true
        collectionView.delegate = self
        collectionView.setCollectionViewLayout(UICollectionViewFlowLayout(), animated: true)
        collectionView.alwaysBounceVertical = true
        registerClasses()
    }
    
    func registerClasses() {
        collectionView.register(UINib(nibName: "ChatLogCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ChatLogCollectionViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatLogCollectionViewCell", for: indexPath) as? ChatLogCollectionViewCell ?? ChatLogCollectionViewCell()
        guard let currentUser = UserDefaults.standard.value(forKey: "currentUser") as? User else { return UICollectionViewCell() }
        let isBlue = currentUser.uid == messages[indexPath.row].fromId
        cell.setupCell(messages[indexPath.row], isBlue, collectionView.frame.width - 32)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return ChatLogCollectionViewCell.sizeForItem(messages[indexPath.row], width: collectionView.frame.width)
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
    }
    
}

extension ChatLogViewController: AddMessageDelegate {
    func handleSend(_ text: String) {
        viewModel.sendMessage(text, to: user)
        chatLogSendTextView.textField.text = ""
    }
}
