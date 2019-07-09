//
//  wPointCell.swift
//  tripPlan
//
//  Created by MattHew Phraxayavong on 7/9/19.
//  Copyright © 2019 MattHew Phraxayavong. All rights reserved.
//


import Foundation
import UIKit

class wPointCell: UITableViewCell{
    var WPName = UILabel()
    override func layoutSubviews() {
        
        
        WPName.frame = CGRect(x: 15, y: 2.5, width: frame.width - 30, height: 30)
        WPName.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        WPName.font = UIFont(name: "Frutiger", size: 25)
        
        self.addSubview(WPName)
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

