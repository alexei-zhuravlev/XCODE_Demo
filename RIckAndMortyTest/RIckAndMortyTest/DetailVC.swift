//
//  DetailVC.swift
//  RIckAndMortyTest
//
//  Created by Алексей Журавлев on 26.07.2022.
//

import UIKit

class DetailVC: UIViewController {
    
    var imageDataDVC:Data!
    var nameTextDVC = ""
    var ganderTextDVC = ""
    var speciesTextDVC = ""
    var statusTextDVC = ""
    var locationTextDVC = ""
    var episodesNumDVC = 0
    
    @IBOutlet weak var caracterAvatar: UIImageView!
    @IBOutlet weak var caracterName: UILabel!
    @IBOutlet weak var caracterSpecies: UILabel!
    @IBOutlet weak var caracterGender: UILabel!
    @IBOutlet weak var caracterStatus: UILabel!
    @IBOutlet weak var caracterLocation: UILabel!
    @IBOutlet weak var caracterEpisodes: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        caracterAvatar.image = UIImage(data: imageDataDVC)
        caracterName.text = "NAME: " + nameTextDVC
        caracterSpecies.text = "SPECIES: " + speciesTextDVC
        caracterGender.text = "GENDER: " + ganderTextDVC
        caracterStatus.text = "STATUS: " + statusTextDVC
        caracterLocation.text = "LOCATION: " + locationTextDVC
        caracterEpisodes.text = "Caracter appeared in \(episodesNumDVC) episodes"
    }
}
