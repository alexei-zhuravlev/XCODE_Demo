//
//  MainTVC.swift
//  RIckAndMortyTest
//
//  Created by Алексей Журавлев on 26.07.2022.
//

import UIKit

class MainTVC: UITableViewController {
    
    typealias GetComplited = ()->()
    
    let defaultUrl = URL(string: "https://img.freepik.com/premium-psd/google-icon_68185-612.jpg?w=2000")
    
//    массивы для загрузки данных
    
    var allCaracters:[ResultResults] = []
    var allCaractersImages:[Data] = []
    
    func getDefaultImage() -> Data{
        let result = try! Data(contentsOf: defaultUrl!)
        return result
    }
    
//    очереди на выполнение
    let queueOne = DispatchQueue(label: "com.queueOne", qos: .default, attributes: .concurrent)
    let queueTwo = DispatchQueue(label: "com.queueTwo", qos: .default, attributes: .concurrent)
    let queueThree = DispatchQueue(label: "com.queueThree", qos: .default, attributes: .concurrent)
    
    let groupeOne = DispatchGroup()
    let groupeTwo = DispatchGroup()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getRequest()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allCaracters.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as? MainCell else {return UITableViewCell()}

        let imageData = allCaractersImages[indexPath.row]
        cell.caracterImage.image = UIImage(data: imageData)
        cell.caracterName.text = "NAME: " + allCaracters[indexPath.row].name
        cell.caracterRace.text = "SPECIES: " + allCaracters[indexPath.row].species
        cell.caracterGender.text = "GENDER: " +  allCaracters[indexPath.row].gender
        
        cell.selectionStyle = .none

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let item = allCaracters[indexPath.row]
        guard let carIm = allCaractersImages[indexPath.row] as? Data else {return}

        
        let nameText = item.name
        let ganderText = item.gender
        let speciesText = item.species
        let statusText = item.status
        let locationText = item.location["name"]!
        let episodesNum = item.episode.count
        
        
        guard let destination = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC else {return}
        
        destination.imageDataDVC = carIm
        destination.nameTextDVC = nameText
        destination.ganderTextDVC = ganderText
        destination.statusTextDVC = statusText
        destination.speciesTextDVC = speciesText
        destination.locationTextDVC = locationText
        destination.episodesNumDVC = episodesNum
    
        navigationController?.pushViewController(destination, animated: true)
        
    }
}



