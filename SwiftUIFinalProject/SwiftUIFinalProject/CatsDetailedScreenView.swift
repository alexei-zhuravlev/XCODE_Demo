//
//  CatsDetailedScreenView.swift
//  SwiftUIFinalProject
//
//  Created by Алексей Журавлев on 27.09.2022.
//

import SwiftUI

struct CatsDetailedScreenView: View {
    
    let cat:Cat
    
    var body: some View {
        VStack{
            Text(cat.breed)
                .font(.largeTitle)
                .fontWeight(.heavy)
            Image(cat.imageName)
                .resizable()
                .frame(width: 300, height: 300, alignment: .center)
            ScrollView{
                Text("Описание")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(cat.description)
                    .padding()
                Text("Характер")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(cat.character)
                    .padding()
            }
        }
    }
}








//struct CatsDetailedScreenView_Previews: PreviewProvider {
//    static var previews: some View {
//        CatsDetailedScreenView(cat: Cat())
//    }
//}
