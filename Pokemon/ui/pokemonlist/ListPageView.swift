//
//  ListPageView.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import SwiftUI

struct ListPageView<T,Content>: View where T:Identifiable, Content:View {
    
    @Binding var values: [T]
    @Binding var isLoading: Bool
    var nextPage: () -> Void
    var content: (T) -> Content
    var emptyState: String
    
    init(values: Binding<[T]>,
         isLoading: Binding<Bool>,
         nextPage: @escaping () -> Void,
         content: @escaping (T) ->  Content,
         emptyState: String = "TEXT_NO_INFORMATION".localized) {
        _values = values
        _isLoading = isLoading
        self.nextPage = nextPage
        self.content = content
        self.emptyState = emptyState
    }
    
    var body: some View {
        VStack {
            if values.count > .zero {
                List {
                    ForEach(values) { value in
                        VStack {
                            self.content(value)
                                .onAppear {
                                    self.listItemAppears(value)
                                }
                            if self.$isLoading.wrappedValue && self.values.isLastItem(value) {
                                HStack {
                                    Spacer()
                                    LoadingView()
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            } else {
                if isLoading {
                    LoadingListView()
                } else {
                    Text(emptyState)
                        .padding()
                }
            }
        }
    }
    
    func listItemAppears<Item: Identifiable>(_ item: Item) {
        if self.values.isLastItem(item) {
            self.isLoading = true
            self.nextPage()
        }
    }
}

extension ForEach where Data.Element: Hashable, ID == Data.Element, Content: View {
    init(values: Data, content: @escaping (Data.Element) -> Content) {
        self.init(values, id: \.self, content: content)
    }
}

//extension String: Identifiable { pu.iblic var id: String { self } }


