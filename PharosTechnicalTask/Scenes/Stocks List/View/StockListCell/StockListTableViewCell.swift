//
//  StockListTableViewCell.swift
//  PharosTechnicalTask
//
//  Created by Ahmed Sayed Fathi on 16/08/2023.
//

import UIKit

protocol StockListCellView: AnyObject {
    func display(name: String)
    func display(lastValue: String)
    func display(time: String)
    func display(stockDirection: StockDirection)
    func display(change: String)
    func display(backgroundColor: UIColor)
}

final class StockListTableViewCell: UITableViewCell, StockListCellView {

    // MARK: - IBOutlets
    @IBOutlet private weak var nameLabel: UILabel?
    @IBOutlet private weak var lastLabel: UILabel?
    @IBOutlet private weak var timeLabel: UILabel?
    @IBOutlet private weak var dirImageView: UIImageView?
    @IBOutlet private weak var changeLabel: UILabel?

    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - StockListCellView
    func display(name: String) {
        nameLabel?.text = name
    }
    
    func display(lastValue: String) {
        lastLabel?.text = lastValue
    }
    
    func display(time: String) {
        timeLabel?.text = time
    }
    
    func display(stockDirection: StockDirection) {
        let imageName = stockDirection == .down ? "arrow.down" : "arrow.up"
        dirImageView?.image = UIImage(systemName: imageName)
        dirImageView?.tintColor = stockDirection == .down ? .systemRed : .systemGreen
    }
    
    func display(change: String) {
        changeLabel?.text = change
    }
    
    func display(backgroundColor: UIColor) {
        self.backgroundColor = backgroundColor
    }
}
