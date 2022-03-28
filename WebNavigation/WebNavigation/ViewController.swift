//
//  ViewController.swift
//  WebNavigation
//
//  Created by Idwall Go Dev 003 on 28/03/22.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    lazy var webView: WKWebView! = {
        let webConfiguration = WKWebViewConfiguration()
        let web = WKWebView(frame: .zero, configuration: webConfiguration)
        
        web.navigationDelegate = self
        web.translatesAutoresizingMaskIntoConstraints = false
        
        return web
    }()
    
    lazy var progressView: UIProgressView = {
        let view = UIProgressView(progressViewStyle: .bar)
        
        view.progress = 0
        view.tintColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var appearence: UINavigationBarAppearance! = {
        var appearence = UINavigationBarAppearance()
        
        appearence.shadowColor = .systemBackground
        appearence.backgroundColor = .systemBackground
        appearence.titleTextAttributes = [.foregroundColor: UIColor.label]
        appearence.largeTitleTextAttributes = [.foregroundColor: UIColor.label]
    
        return appearence
    }()
    
    lazy var fowardBarItem: UIBarButtonItem! = {
        let button = UIBarButtonItem(image: UIImage(systemName: "chevron.right"), style: .plain, target: self, action: #selector(fowardAction))
        return button
    }()
    
    lazy var backwardBarItem: UIBarButtonItem! = {
        let button = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backwardAction))
        return button
    }()

    lazy var reloadBarItem: UIBarButtonItem! = {
        let button = UIBarButtonItem(image: UIImage(systemName: "arrow.counterclockwise"), style: .plain, target: self, action: #selector(reloadAction))
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        loadWebView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        configNavigationBar()
    }
    private func configUI() {
        view.backgroundColor = .systemBackground
        title = "Web View"
        
        configWebView()
    }
    
    private func configWebView() {
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 5),
            webView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -5),
            webView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        ])
        
    }

    private func configNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .label
        navigationController?.navigationBar.standardAppearance = appearence
        navigationController?.navigationBar.compactAppearance = appearence
        navigationController?.navigationBar.scrollEdgeAppearance = appearence
        
        navigationItem.leftBarButtonItem = reloadBarItem
        navigationItem.rightBarButtonItems = [fowardBarItem, backwardBarItem]
    }
    
    private func loadWebView() {
        if let url = URL(string: "http://google.com") {
            let urlRequest = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 5)
            webView.load(urlRequest)
        }
    }
    
}

extension ViewController {
    @objc
    private func fowardAction() {
        if webView.canGoForward {
            webView.goForward()
        }
        
        
    }
    
    @objc
    private func backwardAction() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @objc
    private func reloadAction() {
        webView.reload()
    }
}

extension ViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
}
