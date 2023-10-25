//
//  PromotedList.swift
//  SteamApp
//
//  Created by Student04 on 25/10/2023.
//

import SwiftUI

struct PromotedList: View {
    @EnvironmentObject var data :ModelData
    private var gridLayout = [GridItem(.flexible(), spacing: 8), GridItem(.flexible(), spacing: 8)]
    
    var body: some View {
        NavigationView {
            VStack{
                ScrollView{
                    LazyVGrid(columns: gridLayout, spacing: 8){
                        ForEach($data.displayedList){ game in
                            NavigationLink{
                                Details(game: game)
                            } label: {
                                PromotedCell(game: game)
                            }
                        }
                    }
                }
                .padding(4)
                .background(.gray)
            }
            .navigationTitle("Featured")
            .toolbarBackground(.black, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}

struct PromotedList_Previews: PreviewProvider {
    static var previews: some View {
        PromotedList()
            .environmentObject(ModelData())
    }
}
