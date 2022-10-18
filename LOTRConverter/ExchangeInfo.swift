//
//  ExchangeInfo.swift
//  LOTRConverter
//
//  Created by GeoSpark on 15/10/22.
//

import SwiftUI

struct ExchangeInfo: View {
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        ZStack{
            // Background
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            
            
            VStack {
                // Title text
                Text("Exchange Rate")
                    .font(.largeTitle)
                // Body text
                Text("The exchange rate policy refers to the manner in which a country manages its currency in respect to foreign currencies and the foreign exchange market.")
                    .font(.title2)
                    .padding()
                // Exchange rate
                
                ExchangeRate(leftImage: "goldpiece", text: "1 Gold Piece = 4 Gold penny", rightImage: "goldpenny")
                
                ExchangeRate(leftImage: "goldpenny", text: "1 Gold penny = 4 Silver pieces ", rightImage: "silverpiece")
                
                ExchangeRate(leftImage: "silverpiece", text: "1 Silver pieces = 4 Silver penny  ", rightImage: "silverpenny")

                ExchangeRate(leftImage: "silverpenny", text: "1 Silver penny = 100 copper penny ", rightImage: "copperpenny")

                // Done
                
                Button("Done"){
                    dismiss()
                }
                .font(.largeTitle)
                .padding(10)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(5)

            }
            .foregroundColor(.black)
        }
    }
}

struct ExchangeInfo_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeInfo()
            .preferredColorScheme(.dark)
    }
}
