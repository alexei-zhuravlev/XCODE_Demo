//
//  PlayingVideo.swift
//  FunnyVideoPdorject
//
//  Created by Алексей Журавлев on 14.09.2022.
//

import Foundation
import AVKit

class VideoPlay{
    
    func videoPlayback(urlToVideo:String) -> UIViewController{
        
        let urlForPlayer = URL(string: urlToVideo)!
        let player = AVPlayer(url: urlForPlayer)
        let playerController = AVPlayerViewController()
        playerController.player = player
        playerController.player?.play()
        
        return playerController
    }
}
