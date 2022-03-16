//
//  ViewController.swift
//  desafioAula07
//
//  Created by Renato F. dos Santos Jr on 15/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
    }
    
    private func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.goToSecondView.rawValue {
            if let user = sender as? User,
               let vc = segue.destination as? SecondViewController {
                vc.user = user
            }
        }
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = DataSource.users[indexPath.row]
        
        performSegue(withIdentifier: "goToSecondViewController", sender: user)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataSource.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = DataSource.users[indexPath.row].name
        
        return cell
    }
}

enum Segue: String {
    case goToSecondView = "goToSecondViewController"
}


