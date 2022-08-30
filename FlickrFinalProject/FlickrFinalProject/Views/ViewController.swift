//
//  ViewController.swift
//  FlickrFinalProject
//
//  Created by Алексей Журавлев on 26.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var inputTextForSearching: UITextField!
    @IBOutlet weak var labelWithNumbersOfResults: UILabel!
    @IBOutlet weak var collectionOfResults: UICollectionView!
    @IBOutlet weak var clearBtn: UIButton!
    @IBOutlet weak var searchBtn: UIButton!
    
    let storage = StorageForSearchingResults.shared
    let request = Request()
    
    var arrayOfResults = [ResultsForSaving]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        labelWithNumbersOfResults.text = ""
        
        collectionOfResults.delegate = self
        collectionOfResults.dataSource = self
        
        clearBtn.layer.cornerRadius = 12
        searchBtn.layer.cornerRadius = 12
        
    }

    
    @IBAction func clearBtnPressed(_ sender: UIButton) {
        labelWithNumbersOfResults.text = ""
        inputTextForSearching.text = ""
        inputTextForSearching.placeholder = "Enter words for searching"
        arrayOfResults = [ResultsForSaving]()
        storage.arrayForUsingInCollection = [ResultsForSaving]()
        collectionOfResults.reloadData()
    }
    
    @IBAction func searchBtnPressed(_ sender: UIButton) {
        guard let textFromTextField = inputTextForSearching.text else {return}
        storage.textForSearching = textFromTextField.lowercased()
        request.gettingResultsOfSearching {pages in
            self.request.gettingPhotoFromFlickrForEachPage(pages:pages){
                self.arrayOfResults = self.storage.arrayForUsingInCollection
                DispatchQueue.main.async {
                    self.labelWithNumbersOfResults.text = self.storage.textForLabelFoundedResults
                    self.collectionOfResults.reloadData()
                }
            }
        }
    }
    
}

