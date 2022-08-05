//
//  Articles.swift
//  37_7_News_Reader
//
//  Created by Алексей Журавлев on 03.08.2022.
//

import Foundation
import ObjectMapper

class Articles:Mappable{
    
    var source:[Source] = []
    var author:String = ""
    var title:String = ""
    var description:String = ""
    var url:String = ""
    var urlToImage:String = ""
    var publishedAt:String = ""
    var content:String = ""
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        source <- map["source"]
        author <- map["author"]
        title <- map["title"]
        description <- map["description"]
        url <- map["url"]
        urlToImage <- map["urlToImage"]
        publishedAt <- map["publishedAt"]
        content <- map["content"]
    }
    
    
}
