//
//  TripCell.swift
//  tripPlan
//
//  Created by MattHew Phraxayavong on 7/8/19.
//  Copyright © 2019 MattHew Phraxayavong. All rights reserved.
//


import UIKit

class TripCell: UITableViewCell{
    
    var nameOfTrip = UILabel()
    override func layoutSubviews() {
        
        
        nameOfTrip.frame = CGRect(x: 15, y: 10, width: frame.width - 30, height: 50)
        nameOfTrip.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        nameOfTrip.font = UIFont(name: "Frutiger", size: 25)
        nameOfTrip.textAlignment = .left
        contentView.addSubview(nameOfTrip)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

