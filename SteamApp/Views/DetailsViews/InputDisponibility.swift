//
//  InputDisponibility.swift
//  SteamApp
//
//  Created by Student04 on 25/10/2023.
//

import SwiftUI

struct InputDisponibility: View {
    var controller :Bool
    var body: some View {
        VStack{
            Text("Input")
                .font(.caption)
                .foregroundColor(.white)
                .padding(.bottom, 8)
            HStack(spacing: 8){
                Image(systemName: "keyboard")
                Image(systemName: "computermouse")
                controller ? Image(systemName: "gamecontroller") : nil
            }
            .foregroundColor(.white)
        }
    }
}

struct InputDisponibility_Previews: PreviewProvider {
    static var previews: some View {
        InputDisponibility(controller: true)
    }
}
