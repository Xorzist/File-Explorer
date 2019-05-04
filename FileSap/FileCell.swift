//
//  File.swift
//  FileExplorer
//
//  Created by GIC_UWI on 2019/5/1.
//  Copyright © 2019 GIC. All rights reserved.
//

import UIKit

class FileCell: UITableViewCell {

    //@IBOutlet weak var parentnamelabel: UILabel!
    //@IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var filenamelabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
