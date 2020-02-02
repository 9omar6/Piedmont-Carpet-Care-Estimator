//
//  customCell.swift
//  PCC
//
//  Created by Omar Aguirre on 12/15/19.
//  Copyright © 2019 Aguirre. All rights reserved.
//

import UIKit

class customCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
