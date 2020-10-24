//
//  SectionSpacerView.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import SwiftUI

struct SectionSpacerView: View {

    let text: String

    var body: some View {
        HStack {
            Text(text.uppercased())
                .textFont()
            Spacer()
        }.padding(.vertical, 10)
        .padding(.horizontal, 25)
        .background(Color.nSection)
    }
}

struct SectionSpacerView_Previews: PreviewProvider {
    static var previews: some View {
        SectionSpacerView(text: "TEXT_GENERAL".localized)
    }
}

