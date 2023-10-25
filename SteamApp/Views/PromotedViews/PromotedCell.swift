//
//  PromotedCell.swift
//  SteamApp
//
//  Created by Student04 on 25/10/2023.
//

import SwiftUI

struct PromotedCell: View {
    var game :GameModel
    var body: some View {
        VStack{
            Text(game.name)
                .foregroundColor(.white)
                .bold()
                .font(.headline)
                .lineLimit(2)
            Spacer()
            AsyncImage(url: URL(string: game.posterImageURL)) { image in
                image
                    .resizable()
            } placeholder: {
                Image(systemName: "photo.artframe")
                    .resizable()
                    .foregroundColor(.gray)
            }
            .frame(height: 100)
            HStack{
                Text(game.discountPercent)
                    .font(.largeTitle)
                    .foregroundColor(.green)
                Spacer()
                VStack{
                    Text(game.originalPrice)
                        .foregroundColor(.gray)
                    Text(game.finalPrice)
                        .foregroundColor(.green)
                }
            }
        }
        .background(.black)
    }
}

struct PromotedCell_Previews: PreviewProvider {
    static var previews: some View {
        PromotedCell(game: GameModel(game: Game(id: 1, name: "Pouet Quest", discountPercent: 25, originalPrice: 10000, finalPrice: 7500)))
    }
}
