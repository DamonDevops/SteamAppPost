//
//  SteamAppApp.swift
//  SteamApp
//
//  Created by Student04 on 25/10/2023.
//

import SwiftUI

@main
struct SteamAppApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(modelData)
        }
    }
}
