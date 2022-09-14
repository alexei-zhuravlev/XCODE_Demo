//
//  VideoMenueTVC.swift
//  FunnyVideoPdorject
//
//  Created by Алексей Журавлев on 13.09.2022.
//

import UIKit
import AVKit


class VideoMenueTVC: UITableViewController {
    
    var arrayOfVideoInMenue = StorageOfVideo().arrayOfFunnyVideos
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "VideoMenueCell", bundle: nil), forCellReuseIdentifier: "VideoMenueCell")
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayOfVideoInMenue.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VideoMenueCell", for: indexPath) as? VideoMenueCell else {return UITableViewCell()}
        let item = arrayOfVideoInMenue[indexPath.row]
        cell.setupCell(video: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let heighForRaw = UIScreen.main.bounds.width/2
        return heighForRaw
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = arrayOfVideoInMenue[indexPath.row]
        let urlToVideoString = item.urlToVideo
        let vc = VideoPlay().videoPlayback(urlToVideo: urlToVideoString.rawValue)
        present(vc, animated: true, completion: nil)
    }
}
