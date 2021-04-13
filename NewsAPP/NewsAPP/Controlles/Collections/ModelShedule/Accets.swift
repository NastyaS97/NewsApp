//
//  Accets.swift
//  NewsAPP
//
//  Created by Настя Сойко on 13.04.21.
//

import UIKit

// Структура для работы с ресурсами приложения: UIImage, UIColor, UIFont и т.д.
struct Assets {
    @dynamicMemberLookup
    struct Image {
        subscript(dynamicMember member: String) -> UIImage {
            var properties = ["background": UIImage(named: "background")!]
            for index in 1...16 {
                properties["sketch_\(index)"] = UIImage(named: "sketch\(index)") ?? #imageLiteral(resourceName: "sketch13")
            }

            return properties[member, default: UIImage()]
        }
    }

    static let image = Image()

    private init() {}
}
