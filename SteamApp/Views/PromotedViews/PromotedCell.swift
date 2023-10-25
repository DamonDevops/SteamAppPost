//
//  PromotedCell.swift
//  SteamApp
//
//  Created by Student04 on 25/10/2023.
//

import SwiftUI

struct PromotedCell: View {
    @Binding var game :GameModel
    var body: some View {
        VStack{
            Text(game.name)
                .foregroundColor(.white)
                .bold()
                .font(.headline)
                .lineLimit(1)
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
            Spacer()
            PromotedPricing(game: game)
        }
        .background(.black)
    }
}

struct PromotedCell_Previews: PreviewProvider {
    static var previews: some View {
        PromotedCell(game: .constant(GameModel(game: Game(id: 1, name: "Pouet Quest", discountPercent: 25, originalPrice: 10000, finalPrice: 7500))))
    }
}
