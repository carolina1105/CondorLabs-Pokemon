//
//  PokemonListView.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import SwiftUI

struct PokemonListView: View {
    private let padding: CGFloat = 5
    private let iconSize: CGFloat = 25.0
    private let frmIconSize: CGFloat = 40.0
    private let offsetXBar: CGFloat = -20
    private let translationAnimateOut: CGFloat = -100
    private let translationAnimateIn: CGFloat = 100
    
    @ObservedObject var pokemonVM = PokemonListViewModel.shared
    @State var showMenu = false
    
    var body: some View {
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < self.translationAnimateOut {
                    self.animateOut(animation: true)
                }
                if $0.translation.width > self.translationAnimateIn {
                    self.animateIn()
                }
            }
        NavigationView {
            ZStack{
                VStack {
                    ListPageView(values: self.$pokemonVM.pokemon,
                                 isLoading: $pokemonVM.isLoading,
                                 nextPage: {self.pokemonVM.getPokemonByPage()}) { pokemon in
                        Text(pokemon.name)
                    }
                }
                Spacer()
                NavigationContent()
            }
            .navigationBarItems(leading: Button(action: {
                self.animateIn()
                self.showMenu = true
            }) {
                HStack {
                    Text("  ")
                    Image(systemName: "line.horizontal.3")
                        .font(.system(size: self.iconSize))
                        .foregroundColor(Color.nSecondary)
                    Text("Pokémon")
                        .titleFont(color: Color.nSecondary)
                }.offset(x: self.offsetXBar)
            })
            .gesture(drag)
            .navigationBarTitle("")
            .navigationBarColor(UIColor.nThird)
            .edgesIgnoringSafeArea(.bottom)
            .onAppear{
                pokemonVM.pokemonList()
            }
        }
        ZStack {
            if self.$showMenu.wrappedValue {
                MenuView(isOpacity: .constant(false),
                         close: {
                            self.animateOut(animation: true)
                         }) { tag in
                    self.pokemonVM.activeSection = tag
                    self.animateOut(animation: false)
                }
                .statusBar(hidden: UIDevice.current.hasNotch ? true : false)
                .transition(.move(edge: .leading))
            }
        }
        .gesture(drag)
    }
    
    func animateIn(completion: (() -> Void)? = nil) {
        let duration: Double = 0.45
        withAnimation {
            self.showMenu = true
        }
        withAnimation(.easeIn(duration: duration)) {
            completion?()
        }
    }
    
    func animateOut(animation: Bool) {
        if animation {
            withAnimation {
                self.showMenu = false
            }
        } else {
            self.showMenu = false
        }
    }
}

struct NavigationContent: View {
    private let generationTag: Int = 1
    private let voteTag: Int = 2
    
    @ObservedObject var pokemonVM = PokemonListViewModel.shared
    
    var body: some View {
        ZStack {
            NavigationLink(destination: GenerationsView(),
                           tag: generationTag,
                           selection: $pokemonVM.activeSection) {
                Text("")
            }
            NavigationLink(destination: GenerationsView(),
                           tag: voteTag,
                           selection: $pokemonVM.activeSection) {
                Text("")
            }
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
