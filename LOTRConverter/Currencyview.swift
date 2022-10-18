//
//  Currencyview.swift
//  LOTRConverter
//
//  Created by GeoSpark on 17/10/22.
//

import SwiftUI

struct Currencyview: View {
    @State var image: String
    @State var text: String

    var body: some View {
        ZStack{
            Image(image)
                .resizable()
                .scaledToFit()
            VStack {
                Spacer()
                Text(text)
                    .padding(3)
                    .font(.caption)
                .background(.brown.opacity(0.75))
            }
        }
        .padding(3)
        .frame(width: 100,height: 100)
        .background(.brown)
        .cornerRadius(25)    }
}

struct Currencyview_Previews: PreviewProvider {
    static var previews: some View {
        Currencyview(image: "copperpenny", text: "Copper penny")
            .previewLayout(.sizeThatFits)
    }
}
