//
//  StorageOfVideo.swift
//  FunnyVideoPdorject
//
//  Created by Алексей Журавлев on 13.09.2022.
//

import Foundation

class StorageOfVideo{
    let video1 = VideoMenueData(name: .video1, coverPictureName: .video1, urlToVideo: .video1)
    let video2 = VideoMenueData(name: .video2, coverPictureName: .video2, urlToVideo: .video2)
    let video3 = VideoMenueData(name: .video3, coverPictureName: .video3, urlToVideo: .video3)
    let video4 = VideoMenueData(name: .video4, coverPictureName: .video4, urlToVideo: .video4)
    let video5 = VideoMenueData(name: .video5, coverPictureName: .video5, urlToVideo: .video5)
    
    var arrayOfFunnyVideos:[VideoMenueData]
    
    init(){
        self.arrayOfFunnyVideos = [video1, video2, video3, video4, video5]
    }
}
