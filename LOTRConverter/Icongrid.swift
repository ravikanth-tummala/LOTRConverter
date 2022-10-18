//
//  Icongrid.swift
//  LOTRConverter
//
//  Created by GeoSpark on 18/10/22.
//

import SwiftUI

struct Icongrid: View {
    @State var gridLayout = [GridItem(),GridItem(),GridItem()]
    @Binding var currency:Currency

    var body: some View {
        LazyVGrid(columns: gridLayout) {
            ForEach(0..<5){ i in
                if Currency.allCases[i] == currency {
                        Currencyview(image:  CurrencyImage.allCases[i].rawValue, text:CurrencyText.allCases[i].rawValue)
                            .overlay(RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                                .opacity(0.5))
                            .shadow(color: .black, radius: 9)
                }else{
                    Currencyview(image:  CurrencyImage.allCases[i].rawValue, text:CurrencyText.allCases[i].rawValue)
                        .onTapGesture {
                            currency = Currency.allCases[i]
                        }
                }
            }
        }
        .padding([.bottom,.leading,.trailing])
    }
}

struct Icongrid_Previews: PreviewProvider {
    static var previews: some View {
        Icongrid(currency: .constant(.silverPiece))
    }
}
