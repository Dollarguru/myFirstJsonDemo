//
//  ContactTableViewCell.swift
//  jsonDemo
//
//  Created by mayur on 1/15/21.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var lblContactDetail: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
