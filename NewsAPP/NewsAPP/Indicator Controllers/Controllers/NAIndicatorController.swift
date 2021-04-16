//
//  NAIndicatorController.swift
//  NewsAPP
//
//  Created by Настя Сойко on 16.04.21.
//

import UIKit

class IndicatorController: UIViewController {
    @IBOutlet weak var indicator: UIActivityIndicatorView!

    func showActivityIndicator() {
        indicator?.startAnimating()
    }

    func hideActivityIndicator(){
        if (indicator != nil){
            indicator?.stopAnimating()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.indicator.startAnimating()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.indicator.stopAnimating()
        }
    }
}
