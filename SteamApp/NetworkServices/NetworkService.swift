//
//  NetworkService.swift
//  SteamApp
//
//  Created by Student04 on 25/10/2023.
//

import Foundation
import Alamofire

class Networkservice {
    func load<T :Decodable>(_ url :String , _ type: T.Type, _ completionHandler: @escaping (T) -> ()) {
        AF.request(url).response{ response in
            switch(response.result){
            case .success(let data):
                if let data = data{
                    //let dataString = String(decoding: data, as: UTF8.self)
                    //print(dataString)
                    do{
                        let res = try JSONDecoder().decode(T.self, from: data)
                        completionHandler(res)
                    }catch{
                        print("ERROR: JSONDecoder error")
                    }
                }
                
            case .failure(let error):
                print("Failure 2: \(error)")
            }
        }
    }
}

enum EndPoint{
    case initLists
    
    func urlBuilder() -> String{
        let FEATURED_URL = "https://store.steampowered.com/api/featured"
        
        switch(self){
        case .initLists:
            return FEATURED_URL
        }
    }
}
