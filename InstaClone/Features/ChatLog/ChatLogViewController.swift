//
//  ChatLogViewController.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 26/11/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit

class ChatLogViewController: UIViewController {

    @IBOutlet weak var chatLogSendTextView: ChatLogSendTextView!
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel: ChatViewModel = ChatViewModel()
    
    var user: User?
    var messages: [Message] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationBar(user?.username, user?.name)
        
        setupView()
        setupTableView()
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
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ChatLogViewController: UITableViewDelegate {}

extension ChatLogViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell(style: .subtitle, reuseIdentifier: "cellId")
        cell.textLabel?.text = messages[indexPath.row].toId
        cell.detailTextLabel?.text = messages[indexPath.row].text
        return cell
    }
}

extension ChatLogViewController: AddMessageDelegate {
    func handleSend(_ text: String?) {
        viewModel.sendMessage(text, to: user)
        chatLogSendTextView.textField.text = ""
    }
}
