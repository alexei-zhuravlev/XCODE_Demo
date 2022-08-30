//
//  BigImageVC.swift
//  FlickrFinalProject
//
//  Created by Алексей Журавлев on 26.08.2022.
//

import UIKit

class BigImageVC: UIViewController {

    
    @IBOutlet weak var labelWithTitleOfImage: UILabel!
    @IBOutlet weak var bigImage: UIImageView!
    
    var itemForShow:ResultsForSaving!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: itemForShow.urlToPhoto)
        bigImage.sd_setImage(with: url,  placeholderImage: UIImage(named: "Flickr_logo"))
        labelWithTitleOfImage.text = itemForShow.title
    }
}
