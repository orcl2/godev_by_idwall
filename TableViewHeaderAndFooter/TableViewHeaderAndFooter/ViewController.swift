//
//  ViewController.swift
//  TableViewHeaderAndFooter
//
//  Created by Idwall Go Dev 003 on 15/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        registerCell()
        setHeader()
        setFooter()
        
    }


    private func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func registerCell() {
        let nib = UINib(nibName: CustomTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
    private func setHeader() {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 70))
        header.backgroundColor = .orange
        tableView.tableHeaderView = header
    }
    
    private func setFooter() {
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: .max, height: 200))
        footer.backgroundColor = .red
        tableView.tableFooterView = footer
    }
    
    private func layout() {
       
    }
}

// MARK: - UITableViewDelegate Extension
extension ViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource Extension
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else
        {
            return UITableViewCell()
        }
        
        return cell
    }
}

