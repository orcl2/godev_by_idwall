//
//  ViewController.swift
//  WhatsAppScreen
//
//  Created by Idwall Go Dev 003 on 25/03/22.
//

import UIKit

class ChatsViewController: UIViewController {
    // MARK: Public Variables
    var profile: Profile? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    lazy var profileService: FetchProfileService! = {
        let profileService = FetchProfileService.shared
        
        return profileService
    }()

    // MARK: View Components
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()
    
    lazy var appearence: UINavigationBarAppearance! = {
        var appearence = UINavigationBarAppearance()
        
        appearence.backgroundColor = .systemBackground
        appearence.titleTextAttributes = [.foregroundColor: UIColor.label]
        appearence.largeTitleTextAttributes = [.foregroundColor: UIColor.label]
        
        return appearence
    }()
    
    lazy var editButton: UIBarButtonItem! = {
        let button = UIBarButtonItem(image: UIImage.init(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(callEditView))
        
        return button
    }()
    
    lazy var doneButton: UIBarButtonItem! = {
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(callDoneView))
        
        return button
    }()
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        setupUI()
        registerCell()
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configNavigationBar()
        configNavigationBarButtons()
    }
    
    // MARK: Private Methods
    private func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
        profileService.delegate = self
    }
    
    private func registerCell() {
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
    }
    
    private func loadData() {
        profileService.execute()
    }
    
    private func setupUI() {
        title = "Chats"
        view.backgroundColor = .systemBackground
        
        configTableView()
    }
    
    private func configTableView() {
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 5),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5)
        ])
    }
    
    private func configNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.standardAppearance = appearence
        navigationController?.navigationBar.compactAppearance = appearence
        navigationController?.navigationBar.scrollEdgeAppearance = appearence
    }
    
    private func configNavigationBarButtons() {
        navigationItem.leftBarButtonItem = doneButton
        navigationItem.rightBarButtonItem = editButton
    }
    
    @objc private func callDoneView() {
        let viewController = DoneViewController()
        
        callViewController(viewController)
    }
    
    @objc private func callEditView() {
        let viewController = EditViewController()
        
        callViewController(viewController)
    }

    private func callViewController(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: UITableViewDelegate
extension ChatsViewController: UITableViewDelegate {
    
}

// MARK: UITableViewDataSource
extension ChatsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as? ChatTableViewCell else {
            return UITableViewCell()
        }

        let friend = profile!.friends[indexPath.row]
        cell.setupUI(friend: friend)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profile?.friends.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

// MARK: ProfileDelegate
extension ChatsViewController: ProfileDelegate {
    func updateModel(with profile: Profile) {
        self.profile = profile
    }
}

