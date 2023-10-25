//
//  ContentView.swift
//  SteamApp
//
//  Created by Student04 on 25/10/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var modelData :ModelData
    
    var body: some View {
        TabView{
            Group{
                PromotedList()
                    .tabItem {
                        Label("Featured", systemImage: "gamecontroller.fill")
                    }
                FavoriteList()
                    .tabItem {
                        Label("Favorite", systemImage: "star.fill")
                    }
            }
            .toolbarBackground(.black, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
        }
        .onAppear{
            modelData.load()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
