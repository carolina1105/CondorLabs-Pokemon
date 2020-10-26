//
//  AlertView.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 25/10/20.
//

import SwiftUI

struct AlertView: View {
    var title: String
    var messaje: String
    
    @State var isOpacity: Bool = false
    var action: () -> Void
    
    var body: some View {
        ZStack {
            if isOpacity {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.vertical)
            }
            VStack {
                Text(title)
                    .titleFont()
                    .padding(.top)
                Divider()
                Text(messaje)
                    .textFont()
                    .multilineTextAlignment(.center)
                    .padding([.top, .horizontal])
                HStack {
                    ButtonPrimary(text: "OK") { 
                        
                    }
                }.padding()
            }
            .background(Color.nBackground)
            .cornerRadius(8.0)
            .padding(.horizontal, UIScreen.main.bounds.size.width * 0.12)
        }.onAppear {
            animateIn()
        }
    }
    
    private func animateOut() {
        isOpacity = false
        withAnimation {
        }
    }
    
    private func animateIn() {
        withAnimation(.linear(duration: 0.5)) {
            self.isOpacity = true
        }
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(title: "", messaje: "") { 
            
        }
    }
}
