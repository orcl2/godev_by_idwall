//
//  NavigationViewController.swift
//  Caravel
//
//  Created by Idwall Go Dev 003 on 28/03/22.
//

import UIKit
import WebKit

class NavigationViewController: UIViewController {

    let baseUrl = "http://www.google.com/search?q="
    var search: String?
    
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
    
    lazy var webView: WKWebView = {
        let webViewConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webViewConfiguration)
        webView.navigationDelegate = self
        webView.scrollView.showsVerticalScrollIndicator = false
        webView.translatesAutoresizingMaskIntoConstraints = false

        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        setupDelegates()
        loadWebView(search: search)
    }
    
    
    private func configUI() {
        view.backgroundColor = .systemBackground
        
        setupNavbar()
        configSearchBar()
        configWebView()
    }
    
    private func setupNavbar() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1.00)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let forwardBarItem = UIBarButtonItem(image: UIImage.init(systemName: "chevron.right.square.fill"), style: .plain, target: self, action: #selector(forwardAction))
        
        let backBarItem = UIBarButtonItem(image: UIImage.init(systemName: "chevron.backward.square.fill"), style: .plain, target: self, action: #selector(backAction))
        
        let reloadBarItem = UIBarButtonItem(image: UIImage.init(systemName: "arrow.uturn.left.circle.fill"), style: .plain, target: self, action: #selector(reloadWebView))
        
        navigationItem.rightBarButtonItems = [forwardBarItem, backBarItem]
        navigationItem.leftBarButtonItem = reloadBarItem
    }
    
    private func setupDelegates() {
        searchBar.delegate = self
        searchBar.searchTextField.delegate = self
    }
    
    private func loadWebView(search: String?) {
        
        if let url = search {
            
            let prefix = String("www")
            if url.lowercased().hasPrefix(prefix) {
                let newUrl = "https:/\(url)"
                if verifyUrl(urlString: newUrl) {
                    goToUrl(urlString: newUrl)
                    return
                }
            }
             else {
                goToUrl(urlString: "\(baseUrl)\(url)")
                return
            }
        }
        
        goToUrl(urlString: baseUrl)
    }
    
    private func goToUrl(urlString: String) {
        if let url = URL(string: urlString) {
            
            let request = URLRequest(url: url)
            
            webView.load(request)
        }
    }
    
    private func verifyUrl (urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url = NSURL(string: urlString) {
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
    
    private func configSearchBar() {
        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchBar.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 5),
            searchBar.heightAnchor.constraint(equalToConstant: 55),
            searchBar.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.85)
        ])
    }
    
    private func configWebView() {
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 5),
            webView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            webView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
    }
}

extension NavigationViewController: UISearchBarDelegate {
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

extension NavigationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchBar.searchTextField.resignFirstResponder()
        let searchText = searchBar.searchTextField.text ?? baseUrl

        loadWebView(search: searchText)
        
        return true
    }
}

extension NavigationViewController {
    
    @objc
    private func reloadWebView() {
        
        webView.reload()
        
    }
    
    @objc
    private func forwardAction() {
        
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @objc
    private func backAction() {
        if webView.canGoBack {
            webView.goBack()
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
}

extension NavigationViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("Initializer!!!")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
}

