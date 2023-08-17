//
//  StockListPresenter.swift
//  PharosTechnicalTask
//
//  Created by Ahmed Sayed Fathi on 16/08/2023.
//

import Foundation

// This protocol defines the interface for presenting stock data in a list.
protocol StockListPresenter: AnyObject {
    func attach(view: StockListView)  // Attach a view to the presenter.
    func numberOfItems() -> Int  // Get the number of stock items.
    func configure(cell: StockListCellView, for indexPath: Int)  // Configure a cell for a given index path.
}

// The implementation of the StockListPresenter protocol.
final class StockListPresenterImpl: StockListPresenter {
    
    private var fetchStocksUseCase: FetchStockListUseCase?  // Use case for fetching stock data.
    private var stocks: [StockInfo]?  // Array to hold fetched stock data.
    private var view: StockListView?  // Attached view for UI updates.
    
    // Attach a view to the presenter.
    func attach(view: StockListView) {
        self.view = view
        fetchStocksUseCase = FetchStockListUseCaseImpl()  // Initialize the fetch use case.
        startFetchingStocks()  // Start fetching stock data.
    }
    
    // Start fetching stock data at intervals using a timer.
    private func startFetchingStocks() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.fetchStocks()  // Fetch stock data.
        }
    }
    
    // Fetch stock data using the fetch use case.
    private func fetchStocks() {
        fetchStocksUseCase?.excute(completion: { [weak self] stocks in
            self?.updateStocks(stocks: stocks)  // Update stocks array and UI.
        })
    }
    
    // Update stocks array and trigger UI update.
    private func updateStocks(stocks: [StockInfo]?) {
        guard let stocks = stocks else {
            debugPrint("Empty Stocks")  // Debug message for empty stocks.
            return
        }
        self.stocks = stocks
        self.view?.reloadData()  // Reload the UI to reflect new stock data.
    }
    
    // Get the number of stock items.
    func numberOfItems() -> Int {
        stocks?.count ?? 0
    }
    
    // Configure a cell with stock data for a given index path.
    func configure(cell: StockListCellView, for indexPath: Int) {
        guard let stock = stocks?[indexPath] else { return }
        cell.display(name: stock.name)
        cell.display(lastValue: stock.last.rounded().description)
        cell.display(time: stock.time)
        cell.display(change: stock.changeValue.description)
        cell.display(backgroundColor: indexPath % 2 == 0 ? .clear : .systemGray4)
        cell.display(stockDirection: stock.changeDirection)
    }
}
