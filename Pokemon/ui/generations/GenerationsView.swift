//
//  GenerationPokemonView.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import SwiftUI

struct GenerationsView: View {
    private let padding: CGFloat = 5
    @ObservedObject var generationsVM = GenerationsViewModel.shared
    
    var body: some View {
        VStack{
            HStack {
                ButtonPrimary(text: "Generation 1", isSelected: self.generationsVM.type == 1) { 
                    generationsVM.getGenerations(type: 1)
                }
                .padding(.horizontal, padding)
                ButtonSecondary(text: "Generation 2", isSelected: self.generationsVM.type == 2) { 
                    generationsVM.getGenerations(type: 2)

                }
                .padding(.horizontal, padding)
            }
            .padding(.top, 10)
            HStack {
                ButtonSecondary(text: "Generation 3", isSelected: self.generationsVM.type == 3) { 
                    generationsVM.getGenerations(type: 3)

                }
                .padding(.horizontal, padding)
                ButtonPrimary(text: "Generation 4", isSelected: self.generationsVM.type == 4) { 
                    self.generationsVM.type = 4
                    generationsVM.getGenerations(type: 4)
                }
                .padding(.horizontal, padding)
            }
            .padding(.top, padding)
            Spacer()

            Text(generationsVM.message)
                .titleFont()
                .padding(.horizontal, 10)
            Spacer()

            if generationsVM.generations.count > .zero {
                List {
                    ForEach(self.generationsVM.generations) { generation in
                        Text(generation.name)
                            .textFont()
                    }
                }
            }
            
        }
        .navigationBarTitle(Text("Generation Pokémon"), displayMode: .inline)
        .foregroundColor(Color.nSecondary)
        .navigationBarColor(UIColor.nThird)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct GenerationsView_Previews: PreviewProvider {
    static var previews: some View {
        GenerationsView()
    }
}
