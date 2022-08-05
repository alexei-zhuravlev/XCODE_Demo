//
//  GettingNews.swift
//  37_7_News_Reader
//
//  Created by Алексей Журавлев on 03.08.2022.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class Request{
    
    static let shared = Request()
    
    func getRequest(complition:@escaping()->()){
        let url = URL(string: "https://newsapi.org/v2/everything?q=education&apiKey=147c78945012418fb406052d7684132b")!
        
        let storage = StorageOfTheNews()
        
        AF.request(url).responseJSON { response in
            switch response.result{
            case .success(let resultOfRequest):
                
                guard let articlesArray = FirstResult(JSON: resultOfRequest as! [String : Any])?.articles else {return}
                
                for article in articlesArray{
                let item = NewsItem()

                item.newsTitle = article.title
                item.imageUrl = article.urlToImage

                
                    print(item.newsTitle)
                    print(item.imageUrl)
                    print("_______________")
//                storage.savingNewsToNewsArray(item: item)
                StorageOfTheNews.shared.savingNewsToNewsArray(item: item)

            }
            complition()
            case .failure(let error):
                print(error as NSError)
            }
        }
        

    }
}
