//
//  NewsReaderTVC.swift
//  37_7_News_Reader
//
//  Created by Алексей Журавлев on 03.08.2022.
//

import UIKit
import SDWebImage

class NewsReaderTVC: UITableViewController {
    
    let storage = StorageOfTheNews.shared
    let request = Request()
    
    var newsArray = [NewsItem]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorColor = .darkGray
        request.getRequest {
            self.newsArray = self.storage.newsArray
            self.tableView.reloadData()
          
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell else {return UITableViewCell()}

        let itemForShow = newsArray[indexPath.row]
        let urlOfImage = itemForShow.imageUrl
        
        guard let unwrURL = URL(string: urlOfImage) else {
            return cell
        }
        
        cell.newsTitle.text = itemForShow.newsTitle
        cell.newsImage.sd_setImage(with: unwrURL, placeholderImage: UIImage(named: "default"), options: [.continueInBackground], completed: nil)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
