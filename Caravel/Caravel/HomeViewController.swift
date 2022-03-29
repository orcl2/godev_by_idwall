//
//  ViewController.swift
//  Caravel
//
//  Created by Idwall Go Dev 003 on 28/03/22.
//

import UIKit
import WebKit

class HomeViewController: UIViewController {
    
    var safeArea: UILayoutGuide!
    
    
    lazy var logoImageView: UIImageView! = {
        let view = UIImageView()
        
        view.image = UIImage(named: "logo")
        view.layer.cornerRadius = 45
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var searchBar: UISearchBar! = {
        let searchBar = UISearchBar(frame: .zero)
        
        searchBar.layer.borderColor = UIColor.label.cgColor
        searchBar.searchBarStyle = .minimal
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.tintColor = .systemRed
        searchBar.searchTextField.returnKeyType = .search
        searchBar.searchTextField.enablesReturnKeyAutomatically = true
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        return searchBar
    }()
    
    lazy var appearence: UINavigationBarAppearance! = {
        var appearence = UINavigationBarAppearance()
        
        appearence.shadowColor = .clear
        appearence.backgroundColor = .systemBackground
        appearence.titleTextAttributes = [.foregroundColor: UIColor.label]
        appearence.largeTitleTextAttributes = [.foregroundColor: UIColor.systemBackground]
    
        return appearence
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        safeArea = view.layoutMarginsGuide
        
        configUI()
        setupDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configNavigationBar()
    }
    
    private func configUI() {
        title = "Home"
        view.backgroundColor = .systemBackground
        
        configSearchBar()
        configLogoImageView()
    }
    
    private func configNavigationBar() {
        let barButtonImage = UIImage(systemName: "house.fill")
        let barButtonItem = UIBarButtonItem(image: barButtonImage, style: .plain, target: self, action: #selector(callNavigationView))
        
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.rightBarButtonItem?.tintColor = .label
        
        let apearence = UINavigationBarAppearance()
        apearence.shadowColor = UIColor.clear
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.tintColor = .label
        navigationController?.navigationBar.standardAppearance = appearence
        navigationController?.navigationBar.compactAppearance = appearence
        navigationController?.navigationBar.scrollEdgeAppearance = appearence
    }
    
    private func configSearchBar() {
        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchBar.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 55),
            searchBar.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.85)
        ])
    }
    
    
    private func configLogoImageView() {
        view.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.bottomAnchor.constraint(equalTo: searchBar.topAnchor, constant: -35),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.50),
            logoImageView.heightAnchor.constraint(equalToConstant: view.bounds.width * 0.50)
            
        ])
    }
    
    private func setupDelegates() {
        searchBar.delegate = self
        searchBar.searchTextField.delegate = self
    }
    
    @objc
    private func callNavigationView() {
        let navController = NavigationViewController()
        
        navigationController?.pushViewController(navController, animated: false)
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.searchTextField.text = ""
        searchBar.resignFirstResponder()

    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        searchBar.setShowsCancelButton(true, animated: true)
    }

    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {

        return true
    }

}

extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchBar.searchTextField.resignFirstResponder()
        let searchText = searchBar.searchTextField.text

        let navController = NavigationViewController()
       
        navController.search = searchText
        
        navigationController?.pushViewController(navController, animated: false);
        
        return true
    }
}

