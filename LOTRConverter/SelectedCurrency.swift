//
//  SelectedCurrency.swift
//  LOTRConverter
//
//  Created by GeoSpark on 17/10/22.
//

import SwiftUI

struct SelectedCurrency: View {
    @Binding var leftcurrency:Currency
    @Binding var rightcurrency:Currency
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack{
            // Back ground image
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            VStack{
                // text
                 Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                // currecny icons
                Icongrid(currency: $leftcurrency)
              
                // text
                 Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                // currecny icons
                Icongrid(currency: $rightcurrency)

                 
                Button("Done"){
                    dismiss()
                }
                .font(.largeTitle)
                .padding(10)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(5)
            }
        }
    }
}

struct SelectedCurrency_Previews: PreviewProvider {
    static var previews: some View {
        SelectedCurrency(leftcurrency: .constant(.silverPiece), rightcurrency: .constant(.goldPiece))
    }
}
