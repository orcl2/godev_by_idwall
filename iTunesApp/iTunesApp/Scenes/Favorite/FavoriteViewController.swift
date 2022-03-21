//
//  FavoriteViewController.swift
//  iTunesApp
//
//  Created by Idwall Go Dev 003 on 19/03/22.
//

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var tracks = [Track]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Favorites"
        delegates()
        register()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        loadData()
    }
    
    private func delegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func register() {
        let nib = UINib(nibName: TrackTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TrackTableViewCell.identifier)
    }
    
    private func loadData() {
        tracks = ManagedObjectContext.shared.get() 
    }
}

extension FavoriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: TrackTableViewCell.identifier, for: indexPath) as? TrackTableViewCell else { return UITableViewCell() }

        let track = tracks[indexPath.row]
        cell.track = track
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

extension FavoriteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) as? TrackTableViewCell else {
            return
        }
        
        cell.favoritePressed(cell.favoriteStarButton)
        
        loadData()
    }
}
