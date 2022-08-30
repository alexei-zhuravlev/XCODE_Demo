//
//  SecondLevelOfParsing.swift
//  FlickrFinalProject
//
//  Created by Алексей Журавлев on 26.08.2022.
//

import Foundation

struct SecondLevelOfParsing:Codable{
    var pages:Int
    var total:Int
    var photo:[FinalResultOfParsing]
}
