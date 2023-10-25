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
    
    func load(){
        gameAPIService.fetchLists { gamesLists in
            _ = gamesLists.windows.map { game in
                self.fullList.insert(GameModel(game: game))
            }
            _ = gamesLists.mac.map { game in
                self.fullList.insert(GameModel(game: game))
            }
            _ = gamesLists.linux.map { game in
                self.fullList.insert(GameModel(game: game))
            }
        }
    }
}
