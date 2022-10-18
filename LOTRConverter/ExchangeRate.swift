//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by GeoSpark on 15/10/22.
//

import SwiftUI

struct ExchangeRate: View {
    @State var leftImage: String
    @State var text: String
    @State var rightImage: String

    var body: some View {
        HStack{
            // left exchange image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            // Exchange rate text
            Text(text)
            //Right exchange image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    
    }
}

struct ExchangeRate_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRate(leftImage: "goldpenny", text: "1 Gold Piece = 4 Gold penny", rightImage: "goldpiece")
            .previewLayout(.sizeThatFits)
    }
}
