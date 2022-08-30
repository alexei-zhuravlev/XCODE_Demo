//
//  ResultsForSaving.swift
//  FlickrFinalProject
//
//  Created by Алексей Журавлев on 26.08.2022.
//

import Foundation

class ResultsForSaving{
    var id:String
    var secret:String
    var server:String
    var farm:Int
    var title:String
    var urlToPhoto:String
    
    init(id:String, secret:String, server:String, farm:Int, title:String){
        self.id = id
        self.secret = secret
        self.server = server
        self.farm = farm
        self.title = title
        urlToPhoto = "https://farm\(String(farm)).staticflickr.com/\(server)/\(id)_\(secret)_c.jpg"
    }
}
