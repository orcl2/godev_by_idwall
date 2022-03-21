//
//  ViewController.swift
//  MockyApp
//
//  Created by Idwall Go Dev 003 on 21/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var founderApi = FounderApiService()
    lazy var founders = [Founder]() {
        didSet{
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        register()
        delegates()
        loadData()
    }

    private func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
        founderApi.delegate = self
    }

    private func register() {
        let nib = UINib(nibName: CustomTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
    private func layout() {

    }
    
    private func loadData() {
        founderApi.performRequest()
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return founders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        let founder = founders[indexPath.row]
        
        cell.setup(with: founder)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension ViewController: FounderDelegate {
    func updateDatasource(with founders: [Founder]) {
        self.founders = founders
    }
}

