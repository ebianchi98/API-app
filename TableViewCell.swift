//
//  TableViewCell.swift
//  bluescape
//
//  Created by Edoardo Bianchi on 6/28/17.
//  Copyright © 2017 ebianchi. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var workspaceName: UILabel!
    @IBOutlet weak var workspaceOwner: UILabel!
    @IBOutlet weak var workspaceTime: UILabel!
    @IBAction func sendToWallButton(_ sender: Any) {
    }
    @IBAction func uploadButton(_ sender: Any) {
    }
    
    override func awakeFromNib() {
            
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
