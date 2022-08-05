//
//  FirstResult.swift
//  37_7_News_Reader
//
//  Created by Алексей Журавлев on 03.08.2022.
//

import Foundation
import ObjectMapper

class FirstResult:Mappable{
    
    var status:String = ""
    var totalResults:Int = 0
    var articles:[Articles] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        totalResults <- map["totalResults"]
        articles <- map["articles"]
    }
}
