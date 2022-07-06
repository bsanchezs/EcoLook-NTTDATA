//
//  Date.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 30/06/22.
//

import Foundation

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
