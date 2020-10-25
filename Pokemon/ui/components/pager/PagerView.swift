//
//  PagerView.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 25/10/20.
//

import SwiftUI

struct PagerView<Content: View>: View {
    @GestureState private var translation: CGFloat = 0
    
    let pageCount: Int
    @Binding var currentIndex: Int
    let content: Content
    
    init(pageCount: Int, currentIndex: Binding<Int>, @ViewBuilder content: () -> Content) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .center, spacing: .zero) {
                self.content
                    .frame(width: geometry.size.width,
                           height: geometry.size.height)
            }
            .background(Color.white.opacity(0.01)) // HACK to make the whole view available for dragGesture
            .frame(width: geometry.size.width, alignment: .leading)
            .offset(x: -CGFloat(self.currentIndex) * geometry.size.width)
            .offset(x: self.translation)
            .animation(.interactiveSpring())
            .gesture(
                DragGesture().updating(self.$translation) { value, state, _ in
                    state = value.translation.width
                }.onEnded { value in
                    let offset = value.translation.width / geometry.size.width
                    let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
                    self.currentIndex = min(max(Int(newIndex), 0), self.pageCount - 1)
                }
            )
        }
        .clipped()
    }
    
}

struct PagerView_Previews: PreviewProvider {
    static var index: Int = 0
    static var previews: some View {
        PagerView(
            pageCount: 3,
            currentIndex: Binding(
                get: { index },
                set: { index = $0 }
            )
        ) {
            Color.red
            Color.blue
            Color.yellow
        }
    }
}

