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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
