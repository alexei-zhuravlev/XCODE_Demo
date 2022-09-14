//
//  VideoMenueCell.swift
//  FunnyVideoPdorject
//
//  Created by Алексей Журавлев on 13.09.2022.
//

import UIKit

class VideoMenueCell: UITableViewCell {


    @IBOutlet weak var videoCoverImage: UIImageView!
    @IBOutlet weak var videoName: UILabel!
    @IBOutlet weak var sign: UIImageView!
    
    var videoItem:VideoMenueData!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(video:VideoMenueData){
        let url = URL(string: video.urlToVideo.rawValue)!
        videoCoverImage.image = GetCoverImage().thumbnailImageFor(fileUrl: url)
        videoName.text = video.name.rawValue
        videoCoverImage.layer.cornerRadius = 12
    }
    
}
