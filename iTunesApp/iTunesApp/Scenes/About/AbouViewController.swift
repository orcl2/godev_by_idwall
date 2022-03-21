//
//  AbouViewController.swift
//  iTunesApp
//
//  Created by Idwall Go Dev 003 on 20/03/22.
//

import Foundation
import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var developersLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
        title = "Sobre"
        logoImageView.image = UIImage(named: "logo")
        appNameLabel.text = "iTunesApp"
        aboutLabel.text = """
        App desenvolvido para exemplificar o uso do CoreData juntamente com chamadas à APIs externas, que no caso foi a API do iTunes.
        """
        developersLabel.text = """
        Desenvolvedores:
        👨🏻‍💻 Alison Gustavo
        👨🏻‍💻 Matheus Lenke
        👨🏻‍💻 João Victor
        👨🏻‍💻 Luiz Gustavo
        👨🏻‍💻 William Daniel
        """
    }
    
}
