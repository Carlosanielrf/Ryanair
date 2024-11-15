//
//  FormViewController.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import UIKit

final class FormViewController: BaseViewController {
    
    private let dateFormatter = DateFormatter()
    
    @IBOutlet weak var originBtn: UIButton!
    @IBOutlet weak var destinationBtn: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // Adults
    @IBOutlet weak var adltsPlusBtn: UIButton!
    @IBOutlet weak var adltsMinusBtn: UIButton!
    @IBOutlet weak var adltsCountLabel: UILabel!
    var adltsCount = 0 {
        didSet {
            adltsCountLabel.text = String(adltsCount)
        }
    }
    
    // Teens
    @IBOutlet weak var teensPlusBtn: UIButton!
    @IBOutlet weak var teensMinusBtn: UIButton!
    @IBOutlet weak var teensCountLabel: UILabel!
    var teensCount = 0 {
        didSet {
            teensCountLabel.text = String(teensCount)
        }
    }
    
    // Childs
    @IBOutlet weak var childsPlusBtn: UIButton!
    @IBOutlet weak var childsMinusBtn: UIButton!
    @IBOutlet weak var childsCountLabel: UILabel!
    var childsCount = 0 {
        didSet {
            childsCountLabel.text = String(childsCount)
        }
    }
    
    @IBOutlet weak var submitBtn: UIButton!
    
    var presenter: FormPresenter<FormViewController>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.attachView(self)
        
        dateFormatter.dateFormat = "MM/dd/yyyy"
        datePicker.addTarget(
            self,
            action: #selector(dateChanged),
            for: .valueChanged
        )
        
        adltsCount = Constants.defaultAdltsCount
        submitBtn.isEnabled = false
        submitBtn.addTarget(self, action: #selector(startSearch), for: .touchUpInside)
    }
    
    // MARK: - Adults actions
    
    @IBAction func increaseAdltsCount() {
        adltsCount = (adltsCount + 1)
        presenter?.updateView()
    }
    
    @IBAction func decreaseAdltsCount() {
        guard adltsCount > 0 else {
            return
        }
        
        adltsCount = (adltsCount - 1)
        presenter?.updateView()
    }
    
    // MARK: - Teens actions
    
    @IBAction func increaseTeensCount() {
        teensCount = (teensCount + 1)
        presenter?.updateView()
    }
    
    @IBAction func decreaseTeensCount() {
        guard teensCount > 0 else {
            return
        }
        
        teensCount = (teensCount - 1)
        presenter?.updateView()
    }
    
    // MARK: - Childs actions
    
    @IBAction func increaseChildsCount() {
        childsCount = (childsCount + 1)
        presenter?.updateView()
    }
    
    @IBAction func decreaseChildsCount() {
        guard childsCount > 0 else {
            return
        }
        
        childsCount = (childsCount - 1)
        presenter?.updateView()
    }
    
    // MARK: - Origin action
    
    @IBAction func originAction() {
        coordinator?.showStations(
            from: self,
            stationType: .origin,
            delegate: self
        )
    }
    
    // MARK: - Destination action
    
    @IBAction func destinationAction() {
        coordinator?.showStations(
            from: self,
            stationType: .destination,
            delegate: self
        )
    }
    
    // MARK: - Date action
    
    @objc func dateChanged(sender: UIDatePicker) {
        let selectedDate = dateFormatter.string(from: sender.date)
        print("Selected date: \(selectedDate)")
    }
    
    // MARK: - Submit action
    
    @objc func startSearch() {
        presenter?.onSearch(
            dateOut: datePicker.date,
            adultsNr: adltsCount,
            teensNr: teensCount,
            childNr: childsCount
        )
    }
}

extension FormViewController: FormView {
    
    func onSearch(
        flightSearch: FlightSearch
    ) {
        coordinator?.showSearch(from: self, flightSearch: flightSearch)
    }
    
    func searchBtnState(isEnabled: Bool) {
        let hasPassengers = (adltsCount + teensCount + childsCount) > 1
        submitBtn.isEnabled = isEnabled && hasPassengers
    }
    
    func getPresenter() throws -> any BasePresenter {
        
        guard let presenter else {
            throw NSError.init(
                domain: "FormViewController",
                code: .zero,
                userInfo: ["UIVIewController": String(describing: self)]
            )
        }

        return presenter
    }
}

extension FormViewController: StationsViewControllerDelegate {
    
    func stationSelected(
        type: StationSelectionType,
        station: Station
    ) {
        
        switch type {
        case .origin:
            presenter?.originStationSelected(station)
            originBtn.setTitle(station.name, for: .normal)
        case .destination:
            presenter?.destinyStationSelected(station)
            destinationBtn.setTitle(station.name, for: .normal)
        }
        
        presenter?.updateView()
    }
}

extension FormViewController {
    enum Constants {
        static let defaultAdltsCount = 2
    }
}
