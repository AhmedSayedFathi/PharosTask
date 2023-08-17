//
//  StockListVC.swift
//  PharosTechnicalTask
//
//  Created by Ahmed Sayed Fathi on 16/08/2023.
//

import UIKit

protocol StockListView: AnyObject {
    func reloadData()
}

final class StockListVC: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    lazy var presenter: StockListPresenter = {
        StockListPresenterImpl()
    }()
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter.attach(view: self)
    }
}


// MARK: - Setup
private extension StockListVC {
    func setupViews() {
        self.title = "Stocks"
        setupTableView()
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "StockListTableViewCell", bundle: nil), forCellReuseIdentifier: "StockListTableViewCell")
        tableView.register(UINib(nibName: "StockListHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "StockListHeaderView")
    }
}

// MARK: - TableView
extension StockListVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StockListTableViewCell", for: indexPath) as! StockListTableViewCell
        presenter.configure(cell: cell, for: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = Bundle.main.loadNibNamed("StockListHeaderView", owner: self, options: nil)?.first as? StockListHeaderView else { return UIView() }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
}

// MARK: - StockListView
extension StockListVC: StockListView {
    
    func reloadData() {
        tableView.reloadData()
    }
}
