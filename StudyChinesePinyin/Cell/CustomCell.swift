//
//  CustomCell.swift
//  StudyChinesePinyin
//
//  Created by KAZUMA NOHA on 2019/10/13.
//  Copyright © 2019 KAZUMA NOHA. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var pinLabel: UILabel!
    @IBOutlet weak var chiLabel: UILabel!
    @IBOutlet weak var japLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
