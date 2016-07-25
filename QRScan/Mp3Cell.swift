//
//  Mp3Cell.swift
//  QRScan
//
//  Created by zonebin on 16/7/25.
//  Copyright © 2016年 zonebin. All rights reserved.
//

import UIKit

class Mp3Cell: UITableViewCell {

    @IBOutlet weak var labName: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var btnPlay: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
