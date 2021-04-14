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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    @IBAction func onLinkdInButtonWasTapped(_ sender: Any) {
        UIApplication.shared.open(URL(string: "www.linkedin.com/in/anastasiya-s-1472b6132")! as URL, options: [:], completionHandler: nil) // TODO check link
    }


    @IBAction func onYouTubeButtonWasTapped(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.youtube.com/channel/UCm2JSDHT_Ss2mq3gmne_iNQ")! as URL, options: [:], completionHandler: nil)
    }

    @IBAction func callNumber(phoneNumber: String) {
        guard let url = URL(string: "telprompt://+375298573919"),
            UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    @IBAction func insertEmail() {

        let email = "nastya.soiko.97@gmail.com"
        let subject = "your subject goes here"
        let bodyText = "your body text goes here"

        if MFMailComposeViewController.canSendMail() {

            let mailComposerVC = MFMailComposeViewController()
            mailComposerVC.mailComposeDelegate = self as? MFMailComposeViewControllerDelegate

            mailComposerVC.setToRecipients([email])
            mailComposerVC.setSubject(subject)
            mailComposerVC.setMessageBody(bodyText, isHTML: false)

            self.present(mailComposerVC, animated: true, completion: nil)

        } else {
            print("Device not configured to send emails, trying with share ...")

            let coded = "mailto:\(email)?subject=\(subject)&body=\(bodyText)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            if let emailURL = URL(string: coded!) {
                if #available(iOS 10.0, *) {
                    if UIApplication.shared.canOpenURL(emailURL) {
                        UIApplication.shared.open(emailURL, options: [:], completionHandler: { (result) in
                            if !result {
                                print("Unable to send email.")
                            }
                        })
                    }
                }
                else {
                    UIApplication.shared.openURL(emailURL as URL)
                }
            }
        }
    }
}
