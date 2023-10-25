//
//  Details.swift
//  SteamApp
//
//  Created by Student04 on 25/10/2023.
//

import SwiftUI

struct Details: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = CoreDataModel()
    @Binding var game :GameModel
    
    var body: some View {
        VStack{
            Text(game.name)
                .foregroundColor(.white)
        
            AsyncImage(url: URL(string: game.fullImageURL)) { image in
                image
                    .resizable()
            } placeholder: {
                Image(systemName: "photo.artframe")
                    .resizable()
                    .foregroundColor(.gray)
            }
            .frame(height: 250)
            
            DetailsPricing(game: game)
            Disponibility(game: game)
            InputDisponibility(controller: game.controllerCompat)
            
            Button{
                withAnimation {
                    game.isFavorite ? viewModel.deleteItem(game: game) : viewModel.addItem(game: game)
                    game.isFavorite.toggle()
                }
            } label:{
                Text(game.isFavorite ? "Remove from favorite" : "Add to favorite")
            }
            .padding(16)
            
            Spacer()
            
            Link(destination: URL(string: "https://store.steampowered.com/app/\(game.id)")!){
                Text("Plus d'info sur Steam")
                    .padding(8)
                    .foregroundColor(.green)
                    .background(Color.green.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            }
        }
        .background(.black)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button{
                    dismiss()
                } label: {
                    Label("return", systemImage: "arrow.backward")
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct Details_Previews: PreviewProvider {
    static var previews: some View {
        Details(game: .constant(GameModel(game: Game(id: 1, name: "A GOOD NAME", discounted: true, discountPercent: 25, originalPrice: 10000, finalPrice: 7500, isWindows: true,isMac: false, isLinux: true))))
    }
}
