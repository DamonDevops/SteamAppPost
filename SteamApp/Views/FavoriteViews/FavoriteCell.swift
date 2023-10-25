//
//  FavoriteCell.swift
//  SteamApp
//
//  Created by Student04 on 25/10/2023.
//

import SwiftUI

struct FavoriteCell: View {
    var game :GameModel
    var timestamp :String
    
    var body: some View {
        VStack{
            ZStack(alignment: .bottomLeading){
                AsyncImage(url: URL(string: game.posterImageURL)) { image in
                    image
                        .resizable()
                } placeholder: {
                    Image(systemName: "photo.artframe")
                        .resizable()
                        .foregroundColor(.gray)
                }
                .frame(height: 200)
                
                VStack(alignment: .leading){
                    Text(game.name)
                        .font(.callout)
                        .lineLimit(2)
                    Text(timestamp)
                        .font(.caption2)
                }
                .padding(8)
                .background(.black)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            }
        }
    }
}

struct FavoriteCell_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteCell(game: GameModel(game: Game(id: 1, name: "A GOOD NAME", discounted: true, discountPercent: 25, originalPrice: 10000, finalPrice: 7500, isWindows: true,isMac: false, isLinux: true)), timestamp: CoreDataModel().dateFormatter(date: Date()))
    }
}
