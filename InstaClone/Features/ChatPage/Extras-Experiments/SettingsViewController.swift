//
//  SettingsViewController.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 05/11/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var cellHeight: CGFloat = 44
    var selectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        tableView.dataSource = self
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = true
        registerClasses()
    }
    
    func registerClasses() {
        tableView.register(UINib(nibName: "DetailWebViewCell", bundle: nil), forCellReuseIdentifier: "DetailWebViewCell")
        tableView.register(UINib(nibName: "FillerTableViewCell", bundle: nil), forCellReuseIdentifier: "FillerTableViewCell")
    }

}

extension SettingsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 9 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailWebViewCell", for: indexPath) as? DetailWebViewCell ?? DetailWebViewCell()
            cell.resizeWebCellDelegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FillerTableViewCell", for: indexPath) as? FillerTableViewCell ?? FillerTableViewCell()
            cell.selectionStyle = .none
            return cell
        }
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 9 {
            return cellHeight
        } else {
            return 44
        }
    }
}

extension SettingsViewController: ResizeWebCellDelegate {

    func expandCell() {
        cellHeight = 88
        tableView.beginUpdates()
        tableView.endUpdates()
    }

    func collapseCell() {
        cellHeight = 44
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}
