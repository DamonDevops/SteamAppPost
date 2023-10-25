//
//  GameModel.swift
//  SteamApp
//
//  Created by Student04 on 25/10/2023.
//

import Foundation

struct GameModel :Identifiable, Hashable{
    var id :Int
    var name: String
    var discounted :Bool
    var discountPercent :String
    var originalPrice :String
    var finalPrice :String
    var currency :String
    var posterImageURL :String
    var fullImageURL :String
    var isWindows :Bool
    var isMac :Bool
    var isLinux :Bool
    var controllerCompat :Bool
    var isFavorite :Bool = false
    
    init(game :Game){
        self.id = game.id
        self.name = game.name?.uppercased() ?? ""
        self.discounted = game.discounted ?? false
        self.discountPercent = "-\(game.discountPercent ?? 0)%"
        self.originalPrice = "\(String(format: "%.2f", Double(game.originalPrice ?? 0) / 100 )) \(game.currency ?? "")"
        self.finalPrice = "\(String(format: "%.2f", Double(game.finalPrice ?? 0) / 100)) \(game.currency ?? "")"
        self.currency = game.currency ?? ""
        self.posterImageURL = game.posterImageURL ?? ""
        self.fullImageURL = game.fullImageURL ?? ""
        self.isWindows = game.isWindows ?? false
        self.isMac = game.isMac ?? false
        self.isLinux = game.isLinux ?? false
        self.controllerCompat = haveController(field: game.controllerCompat)
        self.isFavorite = isInCoreData(id: game.id)
    }
}

func haveController(field :String?) -> Bool{
    if field != nil{
        return true
    }
    return false
}

func isInCoreData(id :Int) -> Bool{
    let viewModel = CoreDataModel()
    if let bool = viewModel.favGames.firstIndex(where: { $0.gameId == id}){
        return true
    }
    return false
}
