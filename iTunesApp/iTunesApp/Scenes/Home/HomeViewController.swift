//
//  ViewController.swift
//  iTunesApp
//
//  Created by Idwall Go Dev 003 on 19/03/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    lazy var datasource = TrackList(tracksCount: 0, tracks: []) {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        title = "Home"
        
        delegates()
        register()
    }
    
    private func delegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func register() {
        let nib = UINib(nibName: TrackTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TrackTableViewCell.identifier)
    }
    
    private func initDatasource() {
        datasource = TrackList(tracksCount: 0, tracks: [])
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        if let artistName = searchTextField.text {
            ApiService.shared.getTrackList(artistName: artistName) { result in
                switch result {
                case .success(let tracklist):
                    self.datasource = tracklist
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.tracksCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        guard let cell = tableView.dequeueReusableCell(withIdentifier: TrackTableViewCell.identifier, for: indexPath) as? TrackTableViewCell else { return UITableViewCell() }

        var track = datasource.tracks[indexPath.row]
        track.isFavorite = false
        
        cell.track = track

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) as? TrackTableViewCell else {
            return
        }
        
        cell.favoritePressed(cell.favoriteStarButton)
    }
}



