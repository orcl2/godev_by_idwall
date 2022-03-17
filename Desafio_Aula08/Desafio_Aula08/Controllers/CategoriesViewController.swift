//
//  CategoriesViewController.swift
//  Desafio_Aula08
//
//  Created by Idwall Go Dev 003 on 16/03/22.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    var movies: [Movie]!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Filmes"
        
        loadData()
        layout()
        registerCell()
        delegates()
    }
    
    private func layout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 0.4*view.frame.width, height: 240)
        categoriesCollectionView.collectionViewLayout = layout
    }
    
    private func registerCell() {
        let nib = UINib(nibName: MovieCollectionViewCell.identifier, bundle: nil)
        categoriesCollectionView.register(nib, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
    }
    
    private func delegates() {
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
    }
    
    private func loadData() {
        movies = [
            Movie(name: "Toy Story", image: "toystory4"),
            Movie(name: "Coco", image: "coco"),
            Movie(name: "Os Incríveis", image: "incriveis"),
            Movie(name: "Ratatouille", image: "ratatouille"),
            Movie(name: "Up", image: "up"),
            Movie(name: "Raya", image: "raya"),
            Movie(name: "Wall-e", image: "walle"),
            Movie(name: "Soul", image: "soul"),
        ]
    }
}

extension CategoriesViewController: UICollectionViewDelegate {
    
}

extension CategoriesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else { return UICollectionViewCell()}
        let movie = movies[indexPath.row]
        cell.setup(image: movie.image, title: movie.name)
        
        return cell
    }
    
    
}

