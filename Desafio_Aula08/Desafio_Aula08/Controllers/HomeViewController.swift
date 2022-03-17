//
//  ViewController.swift
//  Desafio_Aula08
//
//  Created by Idwall Go Dev 003 on 16/03/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var movieImageView: UIImageView!
    
    let movie = Movie(name: "Up", image: "up")
    var schedules: [Schedule]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        registerCell()
        delegates()
        updateUI()
        layout()
    }
    
    private func loadData() {
        schedules = [
            Schedule(movieTitle: movie.name, time: "16:00"),
            Schedule(movieTitle: movie.name, time: "18:00"),
            Schedule(movieTitle: "Soul", time: "20:00"),
            Schedule(movieTitle: "Raya", time: "21:00"),
            Schedule(movieTitle: "Raya", time: "22:00"),
            Schedule(movieTitle: "Incríveis", time: "18:00"),
            Schedule(movieTitle: "Incríveis", time: "19:00"),
            Schedule(movieTitle: "Incríveis", time: "20:00"),
            Schedule(movieTitle: "Wall-e", time: "18:00"),
            Schedule(movieTitle: "Wall-e", time: "19:00"),
            Schedule(movieTitle: "Wall-e", time: "22:00")
        ]
    }
    
    private func layout() {
        tableView.showsVerticalScrollIndicator = false
    }
    
    private func updateUI() {
        title = "Em cartaz"
        movieImageView.image = UIImage(named: "up")
    }
    
    private func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func registerCell() {
        let nib = UINib(nibName: MovieTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: MovieTableViewCell.identifier)
    }
}

extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell else { return UITableViewCell()}
        let schedule = schedules[indexPath.row]
        cell.setup(title: schedule.movieTitle , schedule: schedule.time)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedules.count
    }
    
    
}
