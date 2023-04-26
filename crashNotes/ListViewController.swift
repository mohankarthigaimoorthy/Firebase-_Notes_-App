//
//  ListViewController.swift
//  crashNotes
//
//  Created by Mohan K on 11/04/23.
//

import UIKit
import FirebaseFirestore

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableview = UITableView()
    private var service: UserService?
    private var allusers = [Note]() {
        didSet {
            DispatchQueue.main.async {
                self.users = self.allusers
            }
        }
    }
    
    var users = [Note](){
        didSet {
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        tableview.delegate = self
        tableview.dataSource = self
        loadData()
        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        service = UserService()
        service?.get(collectionID: "User") {
           users in
            self.allusers = users
        }
    }
    
    func setupTableView() {
        view.addSubview(tableview)
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.allowsSelection = true
        tableview.isUserInteractionEnabled = true
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.topAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableview.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableview.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = users[indexPath.row].name
        cell.textLabel?.font =  .systemFont(ofSize: 20, weight: .medium)
        cell.detailTextLabel?.text = users[indexPath.row].email
        return cell
    }
}
