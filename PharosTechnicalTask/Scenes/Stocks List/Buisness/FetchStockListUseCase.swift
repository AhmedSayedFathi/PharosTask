//
//  FetchStockListUseCase.swift
//  PharosTechnicalTask
//
//  Created by Ahmed Sayed Fathi on 17/08/2023.
//

import Foundation

protocol FetchStockListUseCase: AnyObject {
    func excute(completion: @escaping ([StockInfo]) -> Void)
}

final class FetchStockListUseCaseImpl: FetchStockListUseCase {
    private var simulator: StockSimulator?
    
    init() {
        simulator = StockSimulator()
        simulator?.startSimulation()
        startStockSimulation()
    }
    
    private func startStockSimulation() {
        Timer.scheduledTimer(
            timeInterval: 0.3,
            target: self,
            selector: #selector(simulateStockChanges),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc
    private func simulateStockChanges() {
        simulator?.simulateStockChanges()
    }
    
    func excute(completion: @escaping ([StockInfo]) -> Void) {
        completion(simulator?.stocks ?? [])
    }
}
