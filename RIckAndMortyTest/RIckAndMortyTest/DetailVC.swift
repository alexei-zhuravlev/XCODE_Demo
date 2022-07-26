//
//  DetailVC.swift
//  RIckAndMortyTest
//
//  Created by Алексей Журавлев on 26.07.2022.
//

import UIKit

class DetailVC: UIViewController {
    
//    let shared = DetailVC()
    
    @IBOutlet weak var caracterAvatar: UIImageView!
    @IBOutlet weak var caracterName: UILabel!
    @IBOutlet weak var caracterSpecies: UILabel!
    @IBOutlet weak var caracterGender: UILabel!
    @IBOutlet weak var caracterStatus: UILabel!
    @IBOutlet weak var caracterLocation: UILabel!
    @IBOutlet weak var caracterEpisodes: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        caracterName.text = "SOME TEXT"
    }
    
//    func setParametersDetailVC(_ item: ResultResults, _ caracterImage:Data){
//        caracterAvatar.image = UIImage(data: caracterImage)
//        caracterName.text = item.name
//        caracterSpecies.text = item.species
//        caracterGender.text = item.gender
//        caracterStatus.text = item.status
//        caracterEpisodes.text = "\(item.episode.count)"
//        caracterLocation.text = "Default Text"
//        
//        
//    }
}
