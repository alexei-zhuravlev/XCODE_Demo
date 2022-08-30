//
//  SearchingInFlickr.swift
//  FlickrFinalProject
//
//  Created by Алексей Журавлев on 26.08.2022.
//

import Foundation

class Request{
    
    let storage = StorageForSearchingResults.shared
    
    func transformTextForSearching(text:String) -> String{
        let result = text.replacingOccurrences(of: " ", with: "+")
        return result
    }
    
    func gettingResultsOfSearching(complition:@escaping(_ pages:Int)->()){
        
        let text = storage.textForSearching
        let textForAddingToSearch = transformTextForSearching(text: text)
        
        var  urlComponents = URLComponents.init(string: "https://www.flickr.com")!
        urlComponents.path = "/services/rest/"
        urlComponents.queryItems = [
            URLQueryItem(name: "method", value: "flickr.photos.search"),
            URLQueryItem(name: "api_key", value: "40ecee4cdfe138b6c708c9847478c870"),
            URLQueryItem(name: "text", value: textForAddingToSearch),
            URLQueryItem(name: "format", value: "json"),
            URLQueryItem(name: "nojsoncallback", value: "1")
        ]
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            let result:GroundLevelOfParsing?
            
            if let data = data, response != nil, error == nil {
                result = try? JSONDecoder().decode(GroundLevelOfParsing.self, from: data)
            }else{
                result = nil
            }

            let numperOfPages = (result?.photos.pages)!
            let numbersOfResults = result?.photos.total
            let textForShowAboutNumbersOfResult = "Надено \(numbersOfResults!) результатов"

            self.storage.textForLabelFoundedResults = textForShowAboutNumbersOfResult
            
            complition(numperOfPages)
        }.resume()
    }
    
    func gettingPhotoFromFlickrForEachPage(pages:Int, complition:@escaping()->()){
        for page in 1...pages{

            let text = storage.textForSearching
            let textForAddingToSearch = transformTextForSearching(text: text)
            
            var  urlComponents = URLComponents.init(string: "https://www.flickr.com")!
            urlComponents.path = "/services/rest/"
            urlComponents.queryItems = [
                URLQueryItem(name: "method", value: "flickr.photos.search"),
                URLQueryItem(name: "api_key", value: "40ecee4cdfe138b6c708c9847478c870"),
                URLQueryItem(name: "text", value: textForAddingToSearch),
                URLQueryItem(name: "format", value: "json"),
                URLQueryItem(name: "nojsoncallback", value: "1"),
                URLQueryItem(name: "page", value: String(page))
            ]
            
            var request = URLRequest(url: urlComponents.url!)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                let result:GroundLevelOfParsing?
                
                if let data = data, response != nil, error == nil {
                    result = try? JSONDecoder().decode(GroundLevelOfParsing.self, from: data)
                }else{
                    result = nil
                }
                for item in result!.photos.photo{
                let itemForSaving = ResultsForSaving(id: item.id, secret: item.secret, server: item.server, farm: item.farm, title: item.title)
                self.storage.savingResultOfSearchingToArray(item: itemForSaving)
            }
            complition()
            }.resume()
        }
    }
}
