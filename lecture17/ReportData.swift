//
//  ReportData.swift
//  lecture17
//
//  Created by MacBook Pro on 14.04.24.
//

import UIKit

struct ReportData {
    var reportIcon: Icon
    var reportTitle: String
    var reportDescription: String
}

enum Icon {
    case red
    case green
    case purple
    case yellow
    
    var image: UIImage {
        switch self {
        case .red:
            return UIImage(named: "redicon")!
        case .green:
            return UIImage(named: "greenicon")!
        case .purple:
            return UIImage(named: "purpleicon")!
        case .yellow:
            return UIImage(named: "yellowicon")!
        }
    }
}

