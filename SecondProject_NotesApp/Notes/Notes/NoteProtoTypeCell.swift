//
//  NoteProtoTypeCell.swift
//  Notes
//
//  Created by Daniel Serrano on 10/11/20.
//  Copyright © 2020 dan_uhl. All rights reserved.
//

import UIKit

class NoteProtoTypeCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var note: UILabel!
    
    @IBOutlet weak var date: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
