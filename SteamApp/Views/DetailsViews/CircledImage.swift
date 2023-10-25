//
//  CircledImage.swift
//  SteamApp
//
//  Created by Student04 on 25/10/2023.
//

import SwiftUI

struct CircledImage: View {
    var imageName :String
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(1/1, contentMode: .fit)
            .padding(8)
            .frame(width: 50)
            .background(.gray)
            .clipShape(Circle())
    }
}

struct CircledImage_Previews: PreviewProvider {
    static var previews: some View {
        CircledImage(imageName: "windows")
    }
}
