//
//  MyCell.swift
//  Modul_31_8_final
//
//  Created by Алексей Журавлев on 24.06.2022.
//

import UIKit

class MyCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userData: UILabel!
    @IBOutlet weak var userMessage: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
