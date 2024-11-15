//
//  StationsViewController.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import UIKit

protocol StationsViewControllerDelegate: AnyObject {
    func stationSelected(
        type: StationSelectionType,
        station: Station
    )
}

final class StationsViewController: BaseViewController, StationsView {
 
    @IBOutlet private weak var tableView: UITableView!
    
    var presenter: StationsPresenter<StationsViewController>?
    private var dataSource: [Station]?
    private var stationSelectionType: StationSelectionType?
    
    private weak var delegate: StationsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(
            nibName: String(describing: StationCell.self),
            bundle: nil
        )
        tableView.register(
            cellNib,
            forCellReuseIdentifier: String(describing: StationCell.self)
        )
        
        presenter?.attachView(self)
        presenter?.load()
    }
    
    func configure(
        stationSelectionType: StationSelectionType,
        delegate: StationsViewControllerDelegate?
    ) {
        self.stationSelectionType = stationSelectionType
        self.delegate = delegate
    }
    
    // MARK: - StationsView
    
    func setDataSource(_ stations: [Station]) {
        dataSource = stations
        tableView.reloadData()
    }
    
    func getPresenter() throws -> any BasePresenter {
        
        guard let presenter else {
            throw NSError.init(
                domain: "StationsViewController",
                code: .zero,
                userInfo: ["UIVIewController": String(describing: self)]
            )
        }

        return presenter
    }
}

// MARK: - Tablew view

extension StationsViewController: UITableViewDelegate, UITableViewDataSource {
    
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
            withIdentifier: String(describing: StationCell.self),
            for: indexPath
        ) as? StationCell {
            
            if let title = dataSource?[indexPath.row].name {
                cell.configure(text: title)
            }
            
            return cell
        }
        
        fatalError()
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        guard let dataSource
        else { return }
        
        let station = dataSource[indexPath.row]
        if let type = self.stationSelectionType {
            
            delegate?.stationSelected(
                type: type,
                station: station
            )
            
            self.navigationController?.popViewController(animated: true)
        }
    }
}
