//
//  SearchViewController.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import UIKit

final class SearchViewController: BaseViewController, SearchView {
    
    private var dataSource: [SearchModel]?
    private var flightSearch: FlightSearch?
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var flightsCountLabel: UILabel!
    var presenter: SearchPresenter<SearchViewController>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(
            nibName: String(describing: SearchCell.self),
            bundle: nil
        )
        tableView.register(
            cellNib,
            forCellReuseIdentifier: String(describing: SearchCell.self)
        )
        
        guard let flightSearch else { return }
        presenter?.attachView(self)
        presenter?.load(flightSearch: flightSearch)
    }
    
    func configure(
        flightSearch: FlightSearch
    ) {
        self.flightSearch = flightSearch
    }
    
    // MARK: - SearchView
    
    func setDataSource(_ dataSource: [SearchModel]) {
        self.flightsCountLabel.text = dataSource.count.description + " Flights"
        self.dataSource = dataSource
        tableView.reloadData()
    }
    
    func getPresenter() throws -> any BasePresenter {
        
        guard let presenter else {
            throw NSError.init(
                domain: "SearchViewController",
                code: .zero,
                userInfo: ["UIVIewController": String(describing: self)]
            )
        }

        return presenter
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        dataSource?.count ?? 0
    }
    
    func numberOfSections(
        in tableView: UITableView
    ) -> Int {
        1
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: SearchCell.self),
            for: indexPath
        ) as? SearchCell {
            
            if let search = dataSource?[indexPath.row] {
                cell.configure(searchModel: search)
            }
            
            return cell
        }
        
        fatalError()
    }
}
