//
//  ViewController.swift
//  AppNetworking
//
//  Created by Idwall Go Dev 003 on 18/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var loadActivityIndicator: UIActivityIndicatorView!
    
    lazy var users = [User]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.tableView.isHidden = false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUsers()
        delegates()
        
        initUI()
    }

    private func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func getUsers() {
        Service.shared.getUsers { result in
            switch result {
            case .success(let res):
                self.users = res
            case .failure(let error):
                print(error)
            }
            
            self.hideLoading()
        }
    }
    
    private func showLoading() {
        loadActivityIndicator.showAsync()
    }
    
    private func hideLoading() {
        loadActivityIndicator.hideAsync()
    }
    
    func initUI() {
        tableView.isHidden = true
        
        showLoading()
    }
}

extension ViewController: UITableViewDelegate {

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.username
        
        return cell
    }
}

extension UIActivityIndicatorView {
    func showAsync() {
        DispatchQueue.main.async {
            self.startAnimating()
            self.isHidden = false
        }
    }
    
    func hideAsync() {
        DispatchQueue.main.async {
            self.stopAnimating()
            self.isHidden = true
        }
    }
}
