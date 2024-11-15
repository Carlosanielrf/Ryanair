//
//  StationCell.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import UIKit

final class StationCell: UITableViewCell {
    
    @IBOutlet weak var countryLabel: UILabel!
    
    func configure(text: String) {
        backgroundColor = .white
        
        countryLabel.text = text
    }
}
