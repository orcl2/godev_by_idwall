//
//  ViewController.swift
//  Desafio_Aula06_01
//
//  Created by Idwall Go Dev 003 on 14/03/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var carImageView: UIImageView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupDelegates()
        setupCollectionView()
        
        print(Datasource.cars.count)
    }

    private func setupView() {
        title = "Velozes e Furiosos"
        
        updateUI(car: Datasource.cars[0])
    }
    
    private func setupDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupCollectionView() {
        colletionLayout()
        registerCell()
    }
    
    private func colletionLayout() {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: 200, height: 150)
        layout.minimumLineSpacing = 4
        layout.scrollDirection  = .horizontal
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.collectionViewLayout = layout
    }
    
    private func registerCell() {
        let nib = UINib(nibName: CustomCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
    }
    
    private func updateUI(car: Car) {
        carImageView.image = UIImage(named: car.image) ?? UIImage(systemName: "questionmark")
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Datasource.cars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let car = Datasource.cars[indexPath.row]
        
        cell.setup(image: car.image)
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        Datasource.currentCar = Datasource.cars[indexPath.row]
        
        let car = Datasource.currentCar
        
        updateUI(car: car)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(Datasource.currentCar.specifications.1.count)
        return Datasource.currentCar.specifications.1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SpecificationTableViewCell.identifier, for: indexPath) as? SpecificationTableViewCell else {
            return UITableViewCell()
        }
        
        let car = Datasource.currentCar
        let specification = car.specifications.1[indexPath.row]
        
        cell.keyLabel.text = specification.spec
        cell.valueLabel.text = specification.desc
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Datasource.currentCar.model
    }
}

extension ViewController: UITableViewDelegate {
    
}
