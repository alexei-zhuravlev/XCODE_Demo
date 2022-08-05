//
//  SavingItemToStorageDelegat.swift
//  37_7_News_Reader
//
//  Created by Алексей Журавлев on 03.08.2022.
//

import Foundation

protocol SavingNewsToNewsArrayDelegate:AnyObject{
    func savingNewsToNewsArray(item: NewsItem)
}
