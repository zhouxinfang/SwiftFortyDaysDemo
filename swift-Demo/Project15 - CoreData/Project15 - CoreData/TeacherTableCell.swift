//
//  TeacherTableCell.swift
//  Project15 - CoreData
//
//  Created by zhouxinfang on 2017/11/8.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

class TeacherTableCell: UITableViewCell {

    @IBOutlet var nameLabel:UILabel!
    @IBOutlet var age:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
