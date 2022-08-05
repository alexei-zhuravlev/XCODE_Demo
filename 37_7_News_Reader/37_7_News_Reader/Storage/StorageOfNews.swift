//
//  StorageOfNews.swift
//  37_7_News_Reader
//
//  Created by Алексей Журавлев on 03.08.2022.
//

import Foundation

class StorageOfTheNews:SavingNewsToNewsArrayDelegate{
    
    static let shared = StorageOfTheNews()
    
    var newsArray = [NewsItem]()
    
    func savingNewsToNewsArray(item: NewsItem){
        newsArray.append(item)
    }
}
