//
//  StorageForSearchingResults.swift
//  FlickrFinalProject
//
//  Created by Алексей Журавлев on 26.08.2022.
//

import Foundation

class StorageForSearchingResults:SavingResultOfSearchingToArray{
   
    static let shared = StorageForSearchingResults()
    
    var numberOfPages = 0
    
    var pagesOfResultsNumber:Int = 0
    
    var textForLabelFoundedResults:String = ""
    
    var arrayForUsingInCollection = [ResultsForSaving]()
    
    var textForSearching:String = ""
    
    func savingResultOfSearchingToArray(item: ResultsForSaving) {
        arrayForUsingInCollection.append(item)
    }
}
