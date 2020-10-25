//
//  Buttons.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import SwiftUI

struct ButtonPrimary: View {
    let padding: CGFloat = 8
    let cornerRadius: CGFloat = 8
    
    var text: String
    var textColor: Color = Color.nSecondaryText
    var decoration: DecorationType = .bold
    var color: Color = Color.nPrimary
    var isSelected: Bool?
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            HStack(spacing: 10) {
                Spacer()
                Text(text)
                    .lineLimit(1)
                    .textFont(color: textColor,
                              decoration: .bold)
                Spacer()
            }.padding(.vertical, padding)
            .background(isSelected ?? false ? Color.nFourth : color)
            .cornerRadius(cornerRadius)
        }.buttonStyle(PlainButtonStyle())
    }
}

struct ButtosView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPrimary(text: "text") {
            
        }.environment(\.colorScheme, .light)
    }
}

struct ButtonSecondary: View {
    let padding: CGFloat = 8
    let cornerRadius: CGFloat = 8
    
    var text: String
    var color: Color = Color.nPrimary
    var colorBackground = Color.clear
    var decoration: DecorationType = .bold
    var isSelected: Bool?
    var border: CGFloat = 2
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            HStack {
                Spacer()
                Text(text)
                    .lineLimit(1)
                    .textFont(color: isSelected ?? false ? Color.nFourth : color,
                              decoration: decoration)
                Spacer()
            }.padding(.vertical, padding)
            .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(isSelected ?? false ? Color.nFourth : color, lineWidth: border))
            .background(colorBackground)
        }.buttonStyle(PlainButtonStyle())
    }
}
