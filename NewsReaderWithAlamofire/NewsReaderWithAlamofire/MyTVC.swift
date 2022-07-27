//
//  MyTVC.swift
//  NewsReaderWithAlamofire
//
//  Created by Алексей Журавлев on 24.07.2022.
//

import UIKit
import Alamofire
import AlamofireImage
import SafariServices

class MyTVC: UITableViewController {
    
    let urlString = "https://newsapi.org/v2/everything?q=android&from=2019-04-00&sortBy=publishedAt&apiKey=147c78945012418fb406052d7684132b&page=1"
    
    var news:[MainResult] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getNews()
        
    }

    private func getNews(){
        AF.request(urlString).validate().responseDecodable(of: FirstResult.self) { (response) in
            guard let results = response.value else {return}
            self.news = results.articles
            self.tableView.reloadData()
//            print(response)
        }
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return news.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyNewsCell", for: indexPath) as? MyNewsCell else {return UITableViewCell()}
        cell.titleNews.text = news[indexPath.row].title
        cell.dateNews.text = news[indexPath.row].publishedAt
        cell.descriptionNews.text = news[indexPath.row].description
        
//        получаем картинку
        if let url = news[indexPath.row].urlToImage{
            let urlForGettingImage = URL(string: url)!
            cell.imageForNews.af_setImage(withURL: urlForGettingImage)
        }else{
            cell.imageForNews.image = UIImage(named: "default")!
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urlString = news[indexPath.row].url ?? "http://google.com"
        let url = URL(string: urlString)!
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true)
    }
}
