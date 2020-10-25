//
//  PokemonDetailView.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 25/10/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokemonDetailView: View {
    var namePokemon: String
    var pokemon: PokemonDetailModel
    private let width: CGFloat = 0.8
    private let height: CGFloat = 0.2
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: pokemon.sprites.otherSprite.officialArtwork.frontDefault))
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
                .padding(.vertical, 30)
            ScrollView{
                VStack(alignment: .leading) {
                    HStack {
                        Text("Heigh: ")
                            .textFont(decoration: .bold)
                        Text("\(pokemon.height)")
                            .textFont()
                    }
                    .padding(.vertical, 5)
                    .padding(.leading)
                    HStack {
                        Text("Weight: ")
                            .textFont(decoration: .bold)
                        Text("\(pokemon.weight)")
                            .textFont()
                    }
                    .padding(.vertical, 5)
                    .padding(.leading)
                    if pokemon.types.count > .zero {
                        SectionSpacerView(text: "Types")
                            .padding(.top)
                        ScrollView(.horizontal) {
                            ForEach(values: pokemon.types) { value in
                                HStack{
                                    Text(value.type.name)
                                        .textFont()
                                        .padding(.vertical, 5)
                                    Spacer()
                                } 
                            }
                            .padding(.leading)
                        }
                    }
                    if pokemon.moves.count > .zero {
                        SectionSpacerView(text: "Moves")
                            .padding(.top)
                        MovesView(moves: pokemon.moves)
                            .padding(.top, 10)
                    }
                    
                    SectionSpacerView(text: "SPRITES")
                        .padding(.top)
                    SpriteView(sprites: pokemon.sprites)
                } 
            }
            Spacer()
        }
        .navigationBarTitle(Text(namePokemon), displayMode: .inline)
        .foregroundColor(Color.nSecondary)
        .navigationBarColor(UIColor.nThird)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct MovesView: View {
    var padding: CGFloat = 10
    var moves: [MovesModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(values: moves) { move in
                    HStack{
                        Text(move.move.name)
                            .textFont()
                            .cornerRadius(self.padding)
                    }
                    .padding(.vertical, self.padding)
                    .padding(.horizontal, self.padding)
                    .background(Color.nSection)
                    .cornerRadius(self.padding)
                }
            }
            .padding(.leading)
        }
    }
}

struct PokemonTypeView: View {
    var pokemon: PokemonTypeModel
    
    var body: some View {
        VStack {
            HStack{
                Text(pokemon.type.name)
                    .textFont()
                Spacer()
                    .padding(.leading)
            }
            WebImage(url: URL(string: pokemon.type.url))
                .onSuccess { image, cache in
                }
                .renderingMode(.original)
                .resizable()
                .indicator(.activity)
                .transition(.fade)
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.size.width * 0.5,
                       height: UIScreen.main.bounds.size.height * 0.2)
                .clipShape(Circle())
        }
    }
}
struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(namePokemon: "", pokemon: .empty)
    }
}
