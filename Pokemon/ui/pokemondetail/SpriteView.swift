//
//  SpriteView.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 25/10/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct SpriteView: View {
    var padding: CGFloat = 10
    var sprites: SpritesModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                if sprites.backDefault != nil {
                    SpriteImageView(imageUrl: sprites.backDefault ?? "")
                }
                if sprites.backFemale != nil {
                    SpriteImageView(imageUrl: sprites.backFemale ?? "")
                }
                if sprites.backShiny != nil {
                    SpriteImageView(imageUrl: sprites.backShiny ?? "")
                }
                if sprites.frontDefault != nil {
                    SpriteImageView(imageUrl: sprites.frontDefault ?? "")
                }
                if sprites.frontFemale != nil {
                    SpriteImageView(imageUrl: sprites.frontFemale ?? "")
                }
            }
        }
    }
}

struct SpriteImageView: View {
    var imageUrl: String
    private let width: CGFloat = 0.35
    private let height: CGFloat = 0.15
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: imageUrl))
                .onSuccess { image, cache in
                }
                .renderingMode(.original)
                .resizable()
                .indicator(.activity)
                .transition(.fade)
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.size.width * width,
                       height: UIScreen.main.bounds.size.height * height)
                .background(Color.yellow)
                .clipShape(Circle())
                .padding(.vertical, 10)
                .padding(.horizontal, 10)            
        }
    }
}
