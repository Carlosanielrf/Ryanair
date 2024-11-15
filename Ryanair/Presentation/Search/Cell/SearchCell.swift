//
//  SearchCell.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import UIKit

final class SearchCell: UITableViewCell {
    
    @IBOutlet weak var originHourLabel: UILabel!
    @IBOutlet weak var originCountryLabel: UILabel!
    
    @IBOutlet weak var destinationHourLabel: UILabel!
    @IBOutlet weak var destinationCountryLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func configure(
        searchModel: SearchModel
    ) {
        backgroundColor = .white
        
        originCountryLabel.text = searchModel.origin
        originHourLabel.text = searchModel.departureTime
        
        destinationHourLabel.text = searchModel.arriveTime
        destinationCountryLabel.text = searchModel.destination
        
        timeLabel.text = searchModel.duration
        priceLabel.text = [Constants.fromLabel, searchModel.price].joined(separator: " ")
    }
}

private enum Constants {
    static let fromLabel = "From"
}
