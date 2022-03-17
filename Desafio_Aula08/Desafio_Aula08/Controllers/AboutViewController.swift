//
//  AboutViewController.swift
//  Desafio_Aula08
//
//  Created by Idwall Go Dev 003 on 16/03/22.
//

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
        appNameLabel.text = "SwiftCorn"
        aboutLabel.text = """
        App desenvolvido para exemplificar o uso de UITableView e UICollectionView
        utilizando XIBs para células customizadas.
        
        Na parte de navegação temos como principal meio o TabViewController, onde temos uma
        barra inferior para transitar entre as páginas.
        """
        developersLabel.text = """
        Desenvolvedores:
        👩🏻‍💻 Alley Pereira
        👨🏻‍💻 Matheus Campos
        👨🏻‍💻 Matheus Lenke
        👨🏻‍💻 Miller Oliveira
        👨🏻‍💻 Rafael Rocha
        👨🏻‍💻 William Daniel
        """
    }
}
