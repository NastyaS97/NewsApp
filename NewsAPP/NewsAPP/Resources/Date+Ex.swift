//
//  Date+Ex.swift
//  NewsAPP
//
//  Created by Настя Сойко on 28.03.21.
//

import Foundation

extension Date {
    var toString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.string(from: self)
    }
}
