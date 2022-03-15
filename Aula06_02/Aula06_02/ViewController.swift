//
//  ViewController.swift
//  Aula06_02
//
//  Created by Idwall Go Dev 003 on 14/03/22.
//

import UIKit

class ViewController: UIViewController {

    let teams = ["cloud", "globe.americas", "flame", "person", "airplane", "gamecontroller"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDelegates()
        registerCell()
        colletionLayout()
    }

    func setupDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func registerCell() {
        let nib = UINib(nibName: ItemCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
    }
    
    private func colletionLayout() {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: view.frame.size.width / 3, height: 100)
        layout.minimumLineSpacing = 10
        layout.scrollDirection  = .horizontal
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.collectionViewLayout = layout
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Clicou em \(indexPath.row)")
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as? ItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let team = teams[indexPath.row]
        
        cell.setup(image: team)
        
        return cell
    }
    
    
    
    
}
