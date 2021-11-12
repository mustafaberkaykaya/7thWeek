//
//  NotTableViewCell.swift
//  7thWeek
//
//  Created by Mustafa Berkay Kaya on 12.11.2021.
//

import UIKit

class NotTableViewCell: UITableViewCell {

    @IBOutlet private weak var cellTitle: UILabel!
    @IBOutlet private weak var cellNote: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTitle() -> UILabel {
        return cellTitle
    }
    
    func setNote() -> UILabel {
        return cellNote
    }
    
}
