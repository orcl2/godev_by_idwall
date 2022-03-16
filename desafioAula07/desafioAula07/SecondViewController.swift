//
//  SecondViewController.swift
//  desafioAula07
//
//  Created by Renato F. dos Santos Jr on 15/03/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!

    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "Usuário"
    
        updateUI()
    }
    
    func updateUI() {
        nameLabel.text = "O nome do usuário é: \(user.name)"
        ageLabel.text = "A idade do usuário é: \(user.age) anos"
        avatarImageView.image = UIImage(systemName: user.avatar)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
