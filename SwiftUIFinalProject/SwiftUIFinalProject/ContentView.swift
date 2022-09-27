//
//  ContentView.swift
//  SwiftUIFinalProject
//
//  Created by Алексей Журавлев on 27.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    let catsArray = CatPerson().cats
    
    
    var body: some View {
        
        NavigationView{
            List(catsArray){ cat in
                
                NavigationLink(destination: CatsDetailedScreenView(cat: cat)) {                HStack{
                    Image(cat.imageName)
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .leading)
                    Text(cat.breed)
                }
                }
            }
            .navigationTitle("Породы Кошек")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
