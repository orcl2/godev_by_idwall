//
//  jjjViewController.swift
//  Aula06_01
//
//  Created by Idwall Go Dev 003 on 14/03/22.
//

import UIKit

import UIKit

class RedirectSite: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.layer.cornerRadius = 5
//        insertItens()
//
//    //MARK: - Método para Observar quando entrar e sair de Backgroiund o App
//
//        NotificationCenter.default.addObserver(self, selector: #selector(exitBG), name: UIApplication.didBecomeActiveNotification, object: .none)
//        NotificationCenter.default.addObserver(self, selector: #selector(enterBG), name: UIApplication.willResignActiveNotification, object: .none)
//
//    //MARK: - Ajustes de Layout de Elementos
//
//        NSLayoutConstraint.activate([
//            redirectSite.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40),
//            redirectSite.heightAnchor.constraint(equalToConstant: 160),
//            redirectSite.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            redirectSite.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -15),
//
//            redirectTitle.topAnchor.constraint(equalTo: self.redirectSite.topAnchor, constant: 25),
//            redirectTitle.leadingAnchor.constraint(equalTo: self.redirectSite.leadingAnchor, constant: 25),
//
//            redirectText.topAnchor.constraint(equalTo: self.redirectTitle.topAnchor, constant: 35),
//            redirectText.leadingAnchor.constraint(equalTo: self.redirectSite.leadingAnchor, constant: 25),
//
//            botaoBrancoLeft.widthAnchor.constraint(equalToConstant: 100),
//            botaoBrancoLeft.heightAnchor.constraint(equalToConstant: 20),
//            botaoBrancoLeft.centerXAnchor.constraint(equalTo: redirectSite.centerXAnchor, constant: 3),
//            botaoBrancoLeft.bottomAnchor.constraint(equalTo: redirectSite.safeAreaLayoutGuide.bottomAnchor, constant: -30),
//
//            botaoBrancoRight.widthAnchor.constraint(equalToConstant: 100),
//            botaoBrancoRight.heightAnchor.constraint(equalToConstant: 20),
//            botaoBrancoRight.trailingAnchor.constraint(equalTo: redirectSite.trailingAnchor, constant: -7),
//            botaoBrancoRight.bottomAnchor.constraint(equalTo: redirectSite.safeAreaLayoutGuide.bottomAnchor, constant: -30)
//        ])
//    }
//
//    //MARK: - Funcao para chamar elementos
//
//    func insertItens() {
//        self.view.addSubview(redirectSite)
//        self.redirectSite.addSubview(redirectTitle)
//        self.redirectSite.addSubview(redirectText)
//        self.redirectSite.addSubview(botaoBrancoLeft)
//        self.redirectSite.addSubview(botaoBrancoRight)
//    }
//
//    //MARK: - Colocando Elementos na tela
//
//    private let redirectSite: UIView = {
//        let redirect = UIView(frame: .zero)
//        redirect.translatesAutoresizingMaskIntoConstraints = false
//        redirect.layer.cornerRadius = 5
//        redirect.backgroundColor = .white
//        return redirect
//    }()
//
//    private lazy var redirectTitle: UILabel = {
//        let title = UILabel(frame: .zero)
//        title.translatesAutoresizingMaskIntoConstraints = false
//        title.text = "Redirecionar para site"
//        title.font = UIFont.boldSystemFont(ofSize: 18)
//        return title
//    }()
//
//    private lazy var redirectText: UILabel = {
//        let title = UILabel(frame: .zero)
//        title.translatesAutoresizingMaskIntoConstraints = false
//        title.text = "Em 5 seg você será \nredirecionado para o nosso site."
//        title.numberOfLines = 0
//        title.font = UIFont.systemFont(ofSize: 16)
//        return title
//    }()
//
//    private lazy var botaoBrancoLeft: UIButton = {
//        let botao = Botoes().botaoOne()
//        botao.translatesAutoresizingMaskIntoConstraints = false
//        botao.backgroundColor = .white
//        botao.addTarget(self, action: #selector(returnButton), for: .touchUpInside)
//
//        let attributes: [NSAttributedString.Key : Any] = [
//            NSAttributedString.Key.underlineStyle: 1.2,
//            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15),
//            NSAttributedString.Key.foregroundColor: UIColor.santanderColor
//        ]
//        let attributedString = NSMutableAttributedString(string: "Cancelar", attributes: attributes)
//
//        botao.setAttributedTitle(NSAttributedString(attributedString: attributedString), for: .normal)
//        botao.setTitleColor(.santanderColor, for: .normal)
//        botao.layer.cornerRadius = 5
//        return botao
//    }()
//
//    private lazy var botaoBrancoRight: UIButton = {
//        let botao = Botoes().botaoOne()
//        botao.translatesAutoresizingMaskIntoConstraints = false
//        botao.backgroundColor = .white
//        botao.addTarget(self, action: #selector(navigatorWebViewAccount), for: .touchUpInside)
//
//        let attributes: [NSAttributedString.Key : Any] = [
//            NSAttributedString.Key.underlineStyle: 1.2,
//            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15),
//            NSAttributedString.Key.foregroundColor: UIColor.santanderColor
//        ]
//        let attributedString = NSMutableAttributedString(string: "Ir Agora", attributes: attributes)
//
//        botao.setAttributedTitle(NSAttributedString(attributedString: attributedString), for: .normal)
//        botao.setTitleColor(.santanderColor, for: .normal)
//        botao.layer.cornerRadius = 5
//        return botao
//    }()
//
//    //MARK: - Chamando as Navegacoes dessa Tela
//
//    @objc func returnButton() {
//        stopTimer()
//        self.dismiss(animated: true, completion: nil)
//    }
//
//    @objc func navigatorWebViewAccount() {
//        let rootVC = WebViewPage()
//        let navVC = UINavigationController(rootViewController: rootVC)
//        navVC.modalPresentationStyle = .fullScreen
//        present(navVC, animated: true)
//        self.redirectSite.isHidden = true
//        self.dismiss(animated: true, completion: nil)
//    }
//
//    @objc func enterBG() {
//        self.redirectSite.isHidden = true
//        self.dismiss(animated: true, completion: nil)
//    }
//
//    @objc func exitBG() {
//        self.dismiss(animated: true, completion: nil)
//        self.redirectSite.isHidden = true
//    }
//
//    //MARK: - Redirecionando automático site do banco
//
////    override func viewDidLayoutSubviews() {
////        super.viewDidLayoutSubviews()
////
////        DispatchQueue.main.asyncAfter(deadline: .now()+5, execute: {
////            self.animated()
////        })
////    }
//
//    @objc func animated() {
//        UIView.animate(withDuration: 0, animations: {self.dismiss(animated: true, completion: nil)}, completion: { done in
//            if done {
//                DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
//                    let viewController = WebViewPage()
//                    viewController.modalTransitionStyle = .crossDissolve
//                    viewController.modalPresentationStyle = .fullScreen
//                    self.present(viewController, animated: true)
//                })
//            }
//        })
//    }
//
//
//    var timer: Timer?
//
//    func startTimer() {
//        timer?.invalidate()
//
//        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(animated), userInfo: nil, repeats: false)
//    }
//
//    func stopTimer() {
//        timer?.invalidate()
//    }
    
}
