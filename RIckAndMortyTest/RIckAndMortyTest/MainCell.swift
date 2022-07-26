//
//  MainCell.swift
//  RIckAndMortyTest
//
//  Created by Алексей Журавлев on 26.07.2022.
//

import UIKit

class MainCell: UITableViewCell {
    
    @IBOutlet weak var caracterImage: UIImageView!
    @IBOutlet weak var caracterName: UILabel!
    @IBOutlet weak var caracterRace: UILabel!
    @IBOutlet weak var caracterGender: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
