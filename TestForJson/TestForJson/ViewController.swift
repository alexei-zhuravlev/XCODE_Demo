//
//  ViewController.swift
//  TestForJson
//
//  Created by Алексей Журавлев on 20.07.2022.
//

import UIKit

typealias GetComplited = () -> ()

class ViewController: UIViewController {
    
    let urlString = "https://newsapi.org/v2/everything?q=android&from=2019-04-00&sortBy=publishedAt&apiKey=147c78945012418fb406052d7684132b&page=1"

//    let url = URL(string: "https://newsapi.org/v2/everything?q=android&from=2019-04-00&sortBy=publishedAt&apiKey=147c78945012418fb406052d7684132b&page=1")!
    
    var resultArray:NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getNews {
            print(self.resultArray[1])
        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
////        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        let session = URLSession.shared
//        let task = session.dataTask(with: request) { data, response, error in
//            if let data = data {
//                do{
//                    let json = try! JSONSerialization.jsonObject(with: data, options: [])
//                    guard let jsonData = json as? [String:Any] else { return }
//                    if let arrayNews = jsonData["articles"] as? NSArray{
//                            guard let currentNews = arrayNews[2] as? [String:Any] else { return }
//                            print(currentNews["content"])
//
//                    }
//
//                }
//            }
//        }
//        task.resume()
    }
}

//Networking

extension ViewController{
    func getNews(complition: @escaping GetComplited){
        
        guard let url = URL(string: urlString) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let data = data{
                do{
                    let json = try! JSONSerialization.jsonObject(with: data, options: [])
                    guard let jsonData = json as? [String:Any] else {return}
                    guard let arrayNews = jsonData["articles"] as? NSArray else {return}
                    self.resultArray = arrayNews
                }
            }
            DispatchQueue.main.async {
                complition()
            }
        }
        task.resume()
        
    }
}
