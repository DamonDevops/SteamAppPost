//
//  DetailsPricing.swift
//  SteamApp
//
//  Created by Student04 on 25/10/2023.
//

import SwiftUI

struct DetailsPricing: View {
    var game :GameModel
    
    var body: some View {
        HStack{
            if game.discounted {
                Text(game.discountPercent)
                    .font(.largeTitle)
                    .foregroundColor(.green)
                    .padding(16)
            }
            VStack(alignment: .leading, spacing: 4){
                Text(game.discounted ? game.originalPrice : "")
                    .foregroundColor(.gray)
                    .strikethrough()
                    .font(.callout)
                Text(game.originalPrice == "0.00 \(game.currency)" ? "FREE" : game.finalPrice)
                    .foregroundColor(.green)
                    .font(.callout)
            }
        }
    }
}

struct DetailsPricing_Previews: PreviewProvider {
    static var previews: some View {
        DetailsPricing(game: GameModel(game: Game(id: 1, name: "A GOOD NAME", discounted: true, discountPercent: 25, originalPrice: 10000, finalPrice: 7500, isWindows: true,isMac: false, isLinux: true)))
    }
}
