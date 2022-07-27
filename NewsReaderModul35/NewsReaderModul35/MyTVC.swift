//
//  MyTVC.swift
//  NewsReaderModul35
//
//  Created by Алексей Журавлев on 22.07.2022.
//

import UIKit

typealias GetComplited = () -> ()
typealias GetImages = () -> ()

class MyTVC: UITableViewController {
    
    struct NewsItems{
        var title:String
        var date:String
        var text:String
        var newsUrl:URL
        var imageUrl:URL
//        var image:UIImage
    }
    
    var images = [UIImage]()

    var newsArray = [NewsItems]()
    
    func dateConverter(_ date:String) -> String{
        let result = date.substring(to: date.firstIndex(of: "T")!)
        return result
    }
    
    let defaultUrl = URL(string: "https://bipbap.ru/wp-content/uploads/2017/08/0-70.jpg")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getNews {
            self.getImages{
//                print("%%%%%%%%%%%%")
//                print(self.newsArray.count)
                print("#########")
                print(self.images.count)
                print(self.newsArray.count)
                self.tableView.reloadData()
            }
            self.tableView.reloadData()
            print("%%%%%%%%%%%%")
            print(self.newsArray.count)
//            print("#########")
//            print(self.images.count)
            
        }
//        getImages{
//            print("#########")
//            print(self.images.count)
//        }

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyNewsCell", for: indexPath) as? MyNewsCell else {return UITableViewCell()}
        
            let item = newsArray[indexPath.row]
            
            cell.newsTitle.text = item.title
            cell.newsDate.text = item.date
            cell.newsText.text = item.text
        
//            cell.newsImage.image = images[indexPath.row]
        
//        let item = newsArray[indexPath.row]
//
//        cell.newsTitle.text = item.title
//        cell.newsDate.text = item.date
//        cell.newsText.text = item.text
//        cell.newsImage.image = images[indexPath.row]

        return cell
    }

}

extension MyTVC{
  func getNews(complition: @escaping GetComplited){
    
    let urlString = "https://newsapi.org/v2/everything?q=android&from=2019-04-00&sortBy=publishedAt&apiKey=147c78945012418fb406052d7684132b&page=1"
      
    guard let url = URL(string: urlString) else {return}
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
     
     
    let session = URLSession.shared
    let task = session.dataTask(with: request) { data, response, error in
      if let data = data{
        do{
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
                          guard let jsonData = json as? [String:Any] else { return }
                          if let arrayNews = jsonData["articles"] as? NSArray {
             
                            for news in arrayNews {
                                
                              guard let currentNews = news as? [String:Any] else { return }
             
                              var currentTitle: String = "Without title"
                              if let title = currentNews["title"] as? String {
                                currentTitle = title
                              }
             
                              let datePublishedAt = currentNews["publishedAt"] as! String
                              let convertedDate = self.dateConverter(datePublishedAt)
             
                              var currentAuthor: String = "Without author"
                              if let author = currentNews["author"] as? String {
                                currentAuthor = author
                              }
             
                              var currentDescription: String = "Without description"
                              if let description = currentNews["description"] as? String {
                                currentDescription = description
                              }
             
                              var currenURL: URL = self.defaultUrl
                              if let urlString = currentNews["url"] as? String {
                                currenURL = URL(string: urlString)!
                              }
             
                              var currentImageURL: URL = self.defaultUrl
                              if let imageString = currentNews["urlToImage"] as? String {
                                if imageString.isEmpty{
                                  currentImageURL = self.defaultUrl
                                }else{
                                  currentImageURL = URL(string: imageString) ?? self.defaultUrl
                                }
                              }
                                
                                var item = NewsItems(title: currentTitle, date: convertedDate, text: currentDescription, newsUrl: currenURL, imageUrl: currentImageURL)
                                self.newsArray.append(item)
                            }
                          }
        }
      }
      DispatchQueue.main.async {
        complition()
      }
    }
    task.resume()
  }
    
    func getImages(complition: @escaping GetImages){
        for i in self.newsArray{
            let url = i.imageUrl
            URLSession.shared.dataTask(with: url) { data, _, _ in
//                guard let data = data else {return}
                if let data = data {
                    if let newImage = UIImage(data: data){
                        self.images.append(newImage)
                        print("@@@@@@@")
                    }
                }
                else{
                    let newImage = UIImage(named: "default")!
                    self.images.append(newImage)
                    print("!!!!!!")
                }
                DispatchQueue.main.async {
                    complition()
                }
            }.resume()
        }
    }
}

