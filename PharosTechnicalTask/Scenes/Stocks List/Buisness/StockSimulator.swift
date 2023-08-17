//
//  StockSimulator.swift
//  PharosTechnicalTask
//
//  Created by Ahmed Sayed Fathi on 17/08/2023.
//

import Foundation

// This class simulates the behavior of stock prices.
final class StockSimulator {
    var stocks: [StockInfo] = []  // An array to hold simulated stock information.
    var timer: Timer?  // Timer for scheduling stock updates.
    
    // Initialization: Populate stocks array with initial data.
    init() {
        for i in 1...15 {
            let stock = StockInfo(
                name: "Stock \(i)",
                last: Double.random(in: 50...200),
                time: "9:30 AM",
                changeDirection: .stable,
                changeValue: 0
            )
            stocks.append(stock)
        }
    }
    
    // Start simulating stock price changes.
    func startSimulation() {
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,  // Interval for updating stock prices.
            target: self,
            selector: #selector(simulateStockChanges),  // Method to call when timer fires.
            userInfo: nil,
            repeats: true  // Repeat the timer.
        )
        RunLoop.main.add(timer!, forMode: .common)  // Add timer to the run loop.
    }
    
    // Stop the stock simulation.
    func stopSimulation() {
        timer?.invalidate()  // Invalidate the timer to stop it.
        timer = nil
    }
    
    // Method to simulate stock changes.
    @objc
    func simulateStockChanges() {
        for index in stocks.indices {
            // Randomly determine whether the stock price should go up or down.
            let changeDirection: StockDirection = Bool.random() ? .up : .down
            let changeValue = Double.random(in: 1...10)  // Random change in price.
            
            if changeDirection == .up {
                stocks[index].last += changeValue  // Increase stock price.
            } else {
                stocks[index].last -= changeValue  // Decrease stock price.
            }
            
            stocks[index].changeDirection = changeDirection  // Update change direction.
            stocks[index].changeValue = changeValue.rounded()  // Update change value.
        }
    }
}
