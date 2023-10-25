//
//  Disponibility.swift
//  SteamApp
//
//  Created by Student04 on 25/10/2023.
//

import SwiftUI

struct Disponibility: View {
    var game :GameModel
    
    var body: some View {
        VStack{
            Text("Disponible sur")
                .font(.caption)
                .foregroundColor(.white)
            HStack{
                game.isLinux ? CircledImage(imageName: "linux") : nil
                game.isWindows ? CircledImage(imageName: "windows") : nil
                game.isMac ? CircledImage(imageName: "mac") : nil
            }
        }
        .padding(.bottom, 8)
    }
}

struct Disponibility_Previews: PreviewProvider {
    static var previews: some View {
        Disponibility(game: GameModel(game: Game(id: 1, name: "A GOOD NAME", discounted: true, discountPercent: 25, originalPrice: 10000, finalPrice: 7500, isWindows: true,isMac: false, isLinux: true)))
    }
}
