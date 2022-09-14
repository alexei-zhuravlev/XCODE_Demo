//
//  GettingCoverImageForVideo.swift
//  FunnyVideoPdorject
//
//  Created by Алексей Журавлев on 14.09.2022.
//

import UIKit
import AVFoundation

class GetCoverImage{
    
    func thumbnailImageFor(fileUrl:URL) -> UIImage? {

        let video = AVURLAsset(url: fileUrl, options: [:])
        let assetImgGenerate = AVAssetImageGenerator(asset: video)
        assetImgGenerate.appliesPreferredTrackTransform = true

        let videoDuration:CMTime = video.duration

        let denominator = videoDuration.timescale

        let testTime = CMTime(seconds: 20, preferredTimescale: denominator)

        do {
            let img = try assetImgGenerate.copyCGImage(at: testTime, actualTime: nil)
            let thumbnail = UIImage(cgImage: img)
            return thumbnail
        } catch {
            print(error)
            return nil
        }
    }
}




