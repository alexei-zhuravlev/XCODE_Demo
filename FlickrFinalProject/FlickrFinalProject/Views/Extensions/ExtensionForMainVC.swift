//
//  ExtensionForMainVC.swift
//  FlickrFinalProject
//
//  Created by Алексей Журавлев on 26.08.2022.
//

import UIKit
import SDWebImage

extension ViewController:UICollectionViewDelegate{
    
}

extension ViewController:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayOfResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionOfResults.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as? MyCell else{return UICollectionViewCell()}

        
        let item = arrayOfResults[indexPath.row]
        let urlString = item.urlToPhoto
        let url = URL(string: urlString)

        
        cell.imagePreview.sd_setImage(with: url, placeholderImage: UIImage(named: "Flickr_logo"))
        cell.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        cell.layer.cornerRadius = 12
        cell.layer.borderWidth = 2
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowBigImage"{
            if let indexPath = collectionOfResults.indexPathsForSelectedItems?[0]{
                guard let newVC = segue.destination as? BigImageVC else {return}
                newVC.itemForShow = arrayOfResults[indexPath.row]
            }

        }
    }
    
}
