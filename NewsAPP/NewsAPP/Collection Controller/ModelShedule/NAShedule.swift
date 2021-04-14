//
//  Shedule.swift
//  NewsAPP
//
//  Created by Настя Сойко on 13.04.21.
//

import UIKit

struct Shedule {
    let title: String
    let lecturer: String
    let group: String
    let time: String
    let background: UIImage

    var timeAndGroup: String {
        "\(time) • \(group)"
    }
}
