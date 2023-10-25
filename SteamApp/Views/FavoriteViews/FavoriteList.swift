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
                ForEach(viewModel.favGames){ favGame in
                    NavigationLink{
                        if let game = data.fullList.first(where: { $0.id == favGame.gameId}){
                            Details(game: game)
                        }
                    } label: {
                        if let game = data.fullList.first(where: { $0.id == favGame.gameId}){
                            FavoriteCell(game: game, timestamp: viewModel.dateFormatter(date: favGame.timestamp!))
                        }
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}

struct FavoriteList_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteList()
    }
}
