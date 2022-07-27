import UIKit
import Foundation

struct NewsItems:Codable{
    var title:String = ""
    var date:String = ""
    var description:String = ""
    var newsUrl:String = ""
    var imageUrl:String = ""
}



typealias GetComplited = () -> ()

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

