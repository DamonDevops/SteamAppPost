//
//  GameAPIService.swift
//  SteamApp
//
//  Created by Student04 on 25/10/2023.
//

import Foundation

class GameAPIService{
    private var networkService = Networkservice()
    
    func fetchLists(completionHandler : @escaping (GamesLists) -> ()){
        networkService.load(EndPoint.initLists.urlBuilder(), GamesLists.self) { movies in
            completionHandler(movies)
        }
    }
}
