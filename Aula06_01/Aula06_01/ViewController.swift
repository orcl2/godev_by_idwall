//
//  ViewController.swift
//  Aula06_01
//
//  Created by Idwall Go Dev 003 on 14/03/22.
//

import UIKit

struct Team {
    var logo: String
    var name: String
    var description: String
    var isValid: Bool
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var teams: [Team] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDelegates()
        setupView()
        setupData()
    }
    
    private func setupDelegates() {
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupView() {
        title = "Teams"
    }
    
    private func setupData() {
        teams = [Team(logo: "inter" ,name: "Internacional", description: "It is a long              established fact that a reader will be distracted by the readable               content of a page when looking at its layout. The point of using Lorem          Ipsum is that it has a more-or-less normal distribution of letters, as          opposed to using 'Content here, content here', making it look like              readable English.", isValid: true),
                 Team(logo: "inter" ,name: "Internacional", description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",  isValid: true),
                 Team(logo: "inter" ,name: "Internacional", description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",  isValid: true),
                 Team(logo: "inter" ,name: "Internacional", description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",  isValid: true)]
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Time \(teams[indexPath.row].name)")
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else {
            return CustomTableViewCell()
        }
        
        let team = teams[indexPath.row]
        
        cell.setup(team: team)
        
        return cell
    }
    
    
}
