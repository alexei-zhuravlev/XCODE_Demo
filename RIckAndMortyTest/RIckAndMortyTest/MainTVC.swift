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
//    var tempCaracterImageData:Data = getDefaultImage()
    
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
        
//        newsScreen(DetailVC(), indexPath: indexPath)
        let currentCaracterVC = DetailVC()
        
        let item = allCaracters[indexPath.row]
        print(item)

        let amountOfEpisodes = item.episode.count

//        currentCaracterVC.caracterAvatar.image = UIImage(data: allCaractersImages[indexPath.row])
//        currentCaracterVC.caracterName.text = "NAME: " + item.name
//        currentCaracterVC.caracterSpecies.text = "SPECIES: " + item.species
//        currentCaracterVC.caracterGender.text = "GENDER: " + item.gender
//        currentCaracterVC.caracterStatus.text = "STATUS: " + item.status
//        currentCaracterVC.caracterLocation.text = "LAST LOCATION: "
//        currentCaracterVC.caracterEpisodes.text = "APPEARENCE IN \(amountOfEpisodes) EPISODES"
        
//        currentCaracterVC.setParametersDetailVC(item, allCaractersImages[indexPath.row])
        
        navigationController?.present(currentCaracterVC, animated: true)
        print("*************************")
        print(item.location)
        print(allCaractersImages[indexPath.row])
    }
    
//    func newsScreen(_ controller:UIViewController, indexPath: IndexPath){
//        guard let controllerOne = controller as? DetailVC else {return}
//        let controllerTwo = controllerOne.shared
//        let item = allCaracters[indexPath.row]
//        print(item)
//
//        let amountOfEpisodes = item.episode.count
////
////        controllerTwo.caracterAvatar.image = UIImage(data: allCaractersImages[indexPath.row])
////        controllerTwo.caracterName.text = "NAME: " + item.name
////        controllerTwo.caracterSpecies.text = "SPECIES: " + item.species
////        controllerTwo.caracterGender.text = "GENDER: " + item.gender
////        controllerTwo.caracterStatus.text = "STATUS: " + item.status
////        controllerTwo.caracterLocation.text = "LAST LOCATION: "
////        controllerTwo.caracterEpisodes.text = "APPEARENCE IN \(amountOfEpisodes) EPISODES"
//
//        navigationController?.present(controller, animated: true)
////        present(controller, animated: true)
//        print("*************************")
//        print(item.location)
//        print(allCaractersImages[indexPath.row])
//
//    }
}

extension MainTVC{
    func configureNavigation(){
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "RICK AND MORTY CARACTERS"
    }
}


