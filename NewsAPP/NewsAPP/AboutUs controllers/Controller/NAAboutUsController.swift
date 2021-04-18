//
//  NAAboutUsController.swift
//  NewsAPP
//
//  Created by Настя Сойко on 14.04.21.
//

import UIKit
import MessageUI

class NAAboutUsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: - add GradientColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor.white.cgColor,
            UIColor.systemOrange.cgColor
        ]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - LinkedIn Action

    @IBAction func onLinkdInButtonWasTapped(_ sender: Any) {
        showAlert()

        UIApplication.shared.open(URL(string: "https://www.linkedin.com/in/anastasiya-s-1472b6132/")! as URL, options: [:], completionHandler: nil) // TODO check link
    }

    // MARK: - YouTube Action

    @IBAction func onYouTubeButtonWasTapped(_ sender: Any) {
        showAlert()

        UIApplication.shared.open(URL(string: "https://www.youtube.com/channel/UCm2JSDHT_Ss2mq3gmne_iNQ")! as URL, options: [:], completionHandler: nil)
    }

    // MARK: - GitHub Action

    @IBAction func onGitHub(_ sender: Any) {
        showAlert()

        UIApplication.shared.open(URL(string: "https://github.com/NastyaS97")! as URL, options: [:], completionHandler: nil)
    }

    // MARK: - Number Action

    @IBAction func callNumber(phoneNumber: String) {
        showAlert()

        guard let url = URL(string: "telprompt://+375298573919"),
            UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    // MARK: - Email Action

    @IBAction func insertEmail(_ sender: AnyObject) {
        showMailComposer()
    }

    func showMailComposer() {
        showAlert()

        guard MFMailComposeViewController.canSendMail() else {
        return
    }
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["nastya.soiko.97@gmail.com"])
        composer.setSubject("Hello World!")
        composer.setMessageBody("I want to sent your email..", isHTML: false)

        present(composer, animated: true)
    }
}


extension NAAboutUsController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let _ = error {
            controller.dismiss(animated: true)
            return
        }

        switch result {
        case .cancelled:
            print("cancelled")
        case .failed:
            print("failed")
        case .saved:
            print("saved")
        case .sent:
            print("sent")
        @unknown default:
            print("default")
        }
        controller.dismiss(animated: true)
    }

    func showAlert() {
        let alert = UIAlertController(title: "Are you agree? Press OK to confirm the transition", message: "OK", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) in
            print("cancel")
        }))
        present(alert, animated: true)
    }
}
