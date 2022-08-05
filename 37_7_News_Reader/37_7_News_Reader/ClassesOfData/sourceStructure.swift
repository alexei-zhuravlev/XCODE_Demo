//
//  sourceStructure.swift
//  37_7_News_Reader
//
//  Created by Алексей Журавлев on 03.08.2022.
//

import Foundation
import ObjectMapper

class Source: Mappable{
    
    var id:String = ""
    var name:String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
}
