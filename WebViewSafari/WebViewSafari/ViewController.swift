//
//  ViewController.swift
//  WebViewSafari
//
//  Created by Idwall Go Dev 003 on 28/03/22.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        
        button.setTitle("Call Safari", for: .normal)
        button.setTitleColor(UIColor.label, for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(callSafari), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    private func configUI() {
        title = "Browser"
        view.backgroundColor = .systemBackground
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 45),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc
    private func callSafari() {
     
        if let url = URL(string: "http://google.com") {
            
            let configuration = SFSafariViewController.Configuration()
            configuration.entersReaderIfAvailable = true
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.modalPresentationStyle = .fullScreen
            safariViewController.delegate = self
            safariViewController.title = "Safari"

            present(safariViewController, animated: true, completion: nil)
            
//            navigationController?.pushViewController(safariViewController, animated: true)
//            navigationController?.navigationItem.leftBarButtonItem?.isEnabled = false
        }
        
    }
}

extension ViewController: SFSafariViewControllerDelegate {
    
    func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
        print("didLoadSuccessfully: \(didLoadSuccessfully)")
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
        print("dismiss safariController")
    }
    
}

