//
//  ViewController.swift
//  Lesson2_5
//
//  Created by Ilnar on 27.11.2024.
//

import UIKit

class ViewController: UIViewController {
    let userTableData = TableUsers.mockUsersData()
    let groupTableData = TableUsers.mockGroupData()
    
    lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return userTableData.count
        } else {
            return groupTableData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // cell.accessoryType = .disclosureIndicator
        var config = cell.defaultContentConfiguration()
        var userArray: [TableUsers] = []
        
        switch indexPath.section {
            case 0: userArray = userTableData
            default: userArray = groupTableData
        }
        
        config.text = userArray[indexPath.row].name
        config.imageProperties.maximumSize = CGSize(width: 24, height: 24)
        config.imageProperties.cornerRadius = 6
        config.image = UIImage(named: userArray[indexPath.row].image)
        config.secondaryText = userArray[indexPath.row].someText
        
        cell.contentConfiguration = config
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case 0: return "Users"
            default: return "Groups"
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
            case 0: let item = userTableData[indexPath.row].name
                print(item)
            default: let item = groupTableData[indexPath.row].name
                print(item)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
    }
}
