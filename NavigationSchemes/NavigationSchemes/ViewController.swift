//
//  ViewController.swift
//  NavigationSchemes
//
//  Created by Idwall Go Dev 003 on 22/03/22.
//

import UIKit
import MessageUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "App 2"
        
        view.backgroundColor = .systemIndigo
    }

    
    @IBAction func getFacebook(_ sender: UIButton) {
       navigate(with: "fb://")
    }
    
    @IBAction func getWhatsapp(_ sender: UIButton) {
       navigate(with: "whatsapp://")
    }
    
    @IBAction func getNumberPhone(_ sender: UIButton) {
        navigate(with: "tel://+55(51)999887755")
    }
    
    @IBAction func getSms(_ sender: UIButton) {
        navigate(with: "sms://+55(51)999887755")
    }
    
    @IBAction func getMail(_ sender: UIButton) {
        
        let recipientEmail = "abcd@gmail.com"
        let subject = "Mail Test"
        let body = "Email content"
        
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            
            mail.mailComposeDelegate = self
            mail.setCcRecipients([recipientEmail])
            mail.setSubject(subject)
            mail.setMessageBody(body, isHTML: false)
            
            present(mail, animated: true, completion: nil)
        }
    }
    
    @IBAction func getMailGmail(_ sender: UIButton) {
        
        let recipientEmail = "abcd@gmail.com"
        let subject = "Mail Test"
        let body = "Email content"
        
        createEmail(to: recipientEmail, subject: subject, body: body)
    }
    
    private func createEmail(to: String, subject: String, body: String) {
        var schemes = ""
        
        if let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let bodyEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            schemes = "googlegmail://co?to=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)"
        }

        navigate(with: schemes)
    }
    
    @IBAction private func getSafari(_ sender: UIButton) {
        let keywords = "schemes for ios".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        navigate(with: "x-web-search://?schemesforIOS")
    }
    
    private func navigate(with scheme: String) {
        if let url = URL(string: scheme), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.openURL(url)
        }
    }

}

extension ViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        switch result {
        case .cancelled:
            print("cancelled")
        case .saved:
            print("saved")
        case .sent:
            print("sent")
        case .failed:
            print("failed")
        }
        
    }
}
