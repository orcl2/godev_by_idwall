//
//  ViewController.swift
//  DependencyInject
//
//  Created by Idwall Go Dev 003 on 30/03/22.
//

import UIKit

class ViewController: UIViewController {

    //Exemplo 1
    //let api = ServicesApi()
    
    //Exemplo 2
    //private let userApi: ServicesApi?
    
    //Exemplo 3
    private let apiServiceProtol: ServicesApiProtocol?
    
    init(apiServiceProtocol: ServicesApiProtocol) {
        self.apiServiceProtol = apiServiceProtocol
        super.init(nibName: nil, bundle: nil)
    }
    
    //Exemplo 2
//    init(apiUser: ServicesApi) {
//        self.userApi = apiUser
//        super.init(nibName: nil, bundle: nil)
//
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        //Exemplo 1
//        api.getUsers { res in
//            switch res {
//            case .success(let users):
//                print("users: \(users)")
//            case .failure(let error):
//                print("Error: \(error.localizedDescription)")
//            }
//        }
        
        //Exemplo 2
//        userApi?.getUsers(completion: { res in
//            switch res {
//            case .success(let users):
//                print("users: \(users)")
//            case .failure(let error):
//                print("Error: \(error.localizedDescription)")
//            }
//        })
        
        //Exemplo 2
        apiServiceProtol?.getUsers(completion: { res in
            switch res {
            case .success(let users):
                print("users: \(users)")
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        })
    }


}

