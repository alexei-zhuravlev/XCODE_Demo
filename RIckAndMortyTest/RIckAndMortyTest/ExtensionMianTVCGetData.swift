//
//  ExtensionMianTVCGetData.swift
//  RIckAndMortyTest
//
//  Created by Алексей Журавлев on 26.07.2022.
//

import Foundation

//расширение для выполнения запроса по API

extension MainTVC{
    
    func getRequest(){
//        var tempCaracterImageData:Data = getDefaultImage()
        for page in 1...4{
            guard let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(page)") else {return}
            
            groupeOne.enter()
            queueOne.async(group: groupeOne){
                URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                    guard let self = self else {return}
                    
                    if let data = data {
                        do{
                            let json = try JSONSerialization.jsonObject(with:data, options: [])
                            guard let jsonData = json as? [String:Any] else {return}
                            
                            if let caractersArray = jsonData["results"] as? NSArray{
                                for caracter in caractersArray{
                                    guard let currentCaracter = caracter as? [String:Any] else {return}
                                    
                                    var currentCaracterId: Int = 0
                                    if let currentId = currentCaracter["id"] as? Int{
                                        currentCaracterId = currentId
                                    }
                                    
                                    var currentCaracterName:String = "No Name"
                                    if let currentName = currentCaracter["name"] as? String{
                                        currentCaracterName = currentName
                                    }
                                    
                                    var currentCaracterStatus:String = "Unknown"
                                    if let currentStatus = currentCaracter["status"] as? String{
                                        currentCaracterStatus = currentStatus
                                    }
                                    
                                    var currentCaracterSpecies:String = "Unknown"
                                    if let currentSpecies = currentCaracter["species"] as? String{
                                        currentCaracterSpecies = currentSpecies
                                    }
                                    
                                    var currentCaracterType:String = "Unknown"
                                    if let currentType = currentCaracter["type"] as? String{
                                        currentCaracterType = currentType
                                    }
                                    
                                    var currentCaracterGender:String = "Unknown"
                                    if let currentGender = currentCaracter["gender"] as? String{
                                        currentCaracterGender = currentGender
                                    }
                                    
                                    var currentCaracterOrigin: [String:String] = ["Unknown":"Unknown"]
                                    if let currentOrigin = currentCaracter["origin"] as? [String:String]{
                                        currentCaracterOrigin = currentOrigin
                                    }
                                    
                                    var currentCaracterLocation:[String:String] = ["Unknown":"Unknown"]
                                    if let currentLocation = currentCaracter["location"] as? [String:String]{
                                        currentCaracterLocation = currentLocation
                                    }
                                    
                                    var currentCaracterImage:String = "https://img.freepik.com/premium-psd/google-icon_68185-612.jpg?w=2000"
                                    if let currentImage = currentCaracter["image"] as? String{
                                        currentCaracterImage = currentImage
                                    }
                                    
                                    self.downloadImage(currentCaracterImage) {
//                                        print(self.tempCaracterImageData!)
//                                        print(tempCaracterImageData)
//                                        print("added image to array")
                                    }
                                    
                                    var currentCaracterEpisode:[String] = ["Nothing"]
                                    if let currentEpisode = currentCaracter["episode"] as? [String]{
                                        currentCaracterEpisode = currentEpisode
                                    }
                                    
                                    var currentCaracterUrl:String = "https://img.freepik.com/premium-psd/google-icon_68185-612.jpg?w=2000"
                                    if let currentUrl = currentCaracter["url"] as? String{
                                        currentCaracterUrl = currentUrl
                                    }
                                    
                                    
                                    
                                    var currentCaracterCreated = "Unknown"
                                    if let currentCreated = currentCaracter["created"] as? String{
                                        currentCaracterCreated = currentCreated
                                    }
                                    
                                    let newCaracter = ResultResults(id: currentCaracterId, name: currentCaracterName, status: currentCaracterStatus, species: currentCaracterSpecies, type: currentCaracterType, gender: currentCaracterGender, origin: currentCaracterOrigin, location: currentCaracterLocation, image: currentCaracterImage, episode: currentCaracterEpisode, url: currentCaracterUrl, created: currentCaracterCreated)
                                    
//                                    print(newCaracter)
                                    
                                    self.allCaracters.append(newCaracter)
//                                    self.allCaractersImages.append()
//                                    print("caracter appended")
                                }
                            }
                            self.groupeOne.leave()
                        }catch{
                            print("Session complite with error: \(error)")
                            self.groupeOne.leave()
                            return
                        }
                    }
                }.resume()
            }
            groupeOne.wait()
        }
        groupeOne.notify(queue: .main){
            self.tableView.reloadData()
//            print("@@@@@@@@@@@@@@@@@@@@@@@@@")
//            print("ВСЕГО персонажей - \(self.allCaracters.count)")
//            print("ВСЕГО картинок - \(self.allCaractersImages.count)")
            print(self.allCaracters[1])
//            self.getImages()
        }
    }
    
    func showAllImages(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
//            print("ОБНОВЛЕНО TABLEVIEW")
        }
    }
    
    func getImages(){
        groupeTwo.enter()
        queueTwo.async(group: groupeTwo,  flags:.barrier) {
            for caracter in self.allCaracters{
                self.queueThree.async {
//                    print("caracter.imageUrl: \(caracter.image)")
                    do{
                        let currentUrl = URL(string: caracter.image)
                        if let data = try? Data(contentsOf: currentUrl!){
                            self.allCaractersImages.append(data)
                        }else{
                            let defaultUrl = URL(string: "https://img.freepik.com/premium-psd/google-icon_68185-612.jpg?w=2000")
                            let data = try! Data(contentsOf: defaultUrl!)
                            self.allCaractersImages.append(data)
                        }
                    }catch{
                        print("Session aborted with error: \(error)")
                    }
                }
            }
        }
        groupeTwo.leave()
        groupeTwo.wait()
//        queueTwo.async() {
//            self.showAllImages()
//        }
        queueTwo.async(group: groupeTwo, flags: .barrier) {
//            print("$$$$$$$$$$$$$$$$")
//            print(self.allCaractersImages.count)
//            self.showAllImages()
            DispatchQueue.main.async(flags: .barrier) {
                self.tableView.reloadData()
                print("That's all")
            }
//            self.tableView.reloadData()
        }
    }
    
    func downloadImage(_ with:String, complition:@escaping GetComplited){
//        var tempCaracterImageData:Data = getDefaultImage()
        guard let url = URL(string: with) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, _, _ in
            if let data = data {
               let currentCaracterImageData = data
                self.allCaractersImages.append(currentCaracterImageData)

            }
            DispatchQueue.main.async {
                complition()
            }
        }
        task.resume()
    }

}
