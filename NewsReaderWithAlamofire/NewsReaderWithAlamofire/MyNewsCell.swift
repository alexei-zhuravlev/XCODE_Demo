//
//  MyNewsCell.swift
//  NewsReaderWithAlamofire
//
//  Created by Алексей Журавлев on 24.07.2022.
//

import UIKit

class MyNewsCell: UITableViewCell {
    
    @IBOutlet weak var titleNews: UILabel!
    @IBOutlet weak var dateNews: UILabel!
    @IBOutlet weak var descriptionNews: UILabel!
    @IBOutlet weak var imageForNews: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
