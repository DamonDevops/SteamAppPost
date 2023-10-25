//
//  FavoriteList.swift
//  SteamApp
//
//  Created by Student04 on 25/10/2023.
//

import SwiftUI

struct FavoriteList: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var data :ModelData
    @StateObject var viewModel = CoreDataModel()
    
    var body: some View {
        NavigationView{
            List{
                ForEach($data.favoriteList){ game in
                    NavigationLink{
                        Details(game: game)
                    } label: {
                        if let fav = viewModel.favGames.first(where: { $0.gameId == game.id}){
                            FavoriteCell(game: game, timestamp: viewModel.dateFormatter(date: fav.timestamp!))
                        }
                    }
                }
            }
            .listStyle(.plain)
            .background(.black)
        }
        .onAppear{
            data.loadFavorite()
        }
    }
}

struct FavoriteList_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteList()
            .environmentObject(ModelData())
    }
}
