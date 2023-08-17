//
//  StockInfo.swift
//  PharosTechnicalTask
//
//  Created by Ahmed Sayed Fathi on 17/08/2023.
//

import Foundation

struct StockInfo {
    var name: String
    var last: Double
    var time: String
    var changeDirection: StockDirection
    var changeValue: Double
    var directionImageName: String {
        return changeDirection == .up ? "arrow.up" : "arrow.down"
    }
    var directionImageTint: String? {
        return changeDirection == .up ? "green" : "red"
    }
}

enum StockDirection {
    case up
    case down
    case stable
}
