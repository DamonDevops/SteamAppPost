//
//  Game.swift
//  SteamApp
//
//  Created by Student04 on 25/10/2023.
//

import Foundation

struct GamesLists :Codable{
    var windows :[Game]
    var mac :[Game]
    var linux :[Game]
    
    enum CodingKeys :String, CodingKey{
        case windows = "featured_win"
        case mac = "featured_mac"
        case linux = "featured_linux"
    }
}

struct Game :Codable, Identifiable{
    var id :Int
    var name: String?
    var discounted :Bool?
    var discountPercent :Int?
    var originalPrice :Int?
    var finalPrice :Int?
    var currency :String?
    var posterImageURL :String?
    var fullImageURL :String?
    var isWindows :Bool?
    var isMac :Bool?
    var isLinux :Bool?
    var controllerCompat :String?
    
    enum CodingKeys :String, CodingKey{
        case id = "id"
        case name = "name"
        case discounted = "discounted"
        case discountPercent = "discount_percent"
        case originalPrice = "original_price"
        case finalPrice = "final_price"
        case currency = "currency"
        case posterImageURL = "small_capsule_image"
        case fullImageURL = "large_capsule_image"
        case isWindows = "windows_available"
        case isMac = "mac_available"
        case isLinux = "linux_available"
        case controllerCompat = "controller"
    }
}
