//
//  ModelData.swift
//  SteamApp
//
//  Created by Student04 on 25/10/2023.
//

import Foundation

final class ModelData :ObservableObject{
    private var gameAPIService = GameAPIService()
    
    @Published var fullList :Set<GameModel> = []
    @Published var displayedList :[GameModel] = []
    @Published var favoriteList :[GameModel] = []
    
    func load(){
        gameAPIService.fetchLists { gamesLists in
            _ = gamesLists.windows.map { game in
                self.fullList.insert(GameModel(game: game))
                print(self.fullList.count)
            }
            _ = gamesLists.mac.map { game in
                self.fullList.insert(GameModel(game: game))
            }
            _ = gamesLists.linux.map { game in
                self.fullList.insert(GameModel(game: game))
            }
            self.displayedList = Array(self.fullList)
        }
    }
    
    func loadFavorite(){
        let viewModel = CoreDataModel()
        self.favoriteList = self.displayedList.filter { gameModel in
            viewModel.favGames.contains{ fav in
                fav.gameId == gameModel.id
            }
        }
    }
}
