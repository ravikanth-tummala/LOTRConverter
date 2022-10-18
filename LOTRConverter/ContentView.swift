    //
    //  ContentView.swift
    //  LOTRConverter
    //
    //  Created by GeoSpark on 14/10/22.
    //

    import SwiftUI

    struct ContentView: View {
        @State var leftAmount = ""
        @State var rightAmount = ""
        @State var leftAmountTemp = ""
        @State var rightAmountTemp = ""
        @State var leftTyping = false
        @State var rightTyping = false


        
        @State var leftCurrency:Currency = .silverPiece
        @State var rightCurrency:Currency = .goldPenny
        @State var showselectedCurrency = false
        @State var showsExchangeinfo = false

        var body: some View {
            
            ZStack{
                // Back groud image
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    //prancingpony
                    Image("prancingpony")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    
                    // currency exchange text
                    Text("Currency Exchage")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    // Currency conversion section
                    
                    HStack{
                        // left conversion
                        
                        VStack{
                            // Currency
                            HStack{
                                // currency image
                                Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 33)
                                
                                // currency text
                                Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                            .padding(.bottom,-5)
                            .onTapGesture {
                                showselectedCurrency.toggle()
                            }
                            .sheet(isPresented: $showselectedCurrency) {
                                SelectedCurrency(leftcurrency: $leftCurrency, rightcurrency: $rightCurrency)
                            }
                            
                            TextField("Amount", text: $leftAmount,onEditingChanged: { typing  in
                                leftTyping = typing
                                leftAmountTemp = leftAmount
                            })
                                .padding(7)
                                .background(Color(UIColor.systemGray6))
                                .cornerRadius(7)
                                .keyboardType(.decimalPad)
                                .onChange(of: leftTyping ? leftAmount : leftAmountTemp){ _ in
                                    rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                                }
                                .onChange(of: leftCurrency) { _ in
                                    leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                                }

                        }
                        
                        // equal
                        Image(systemName: "equal")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        
                        // Right conversion
                        VStack{
                            // Currency
                            HStack{
                                // currency text
                                Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                                
                                // currency image
                                Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 33)
                            }
                            .padding(.bottom,-5)
                            .onTapGesture {
                                showselectedCurrency.toggle()
                            }
                            .sheet(isPresented: $showselectedCurrency) {
                                SelectedCurrency(leftcurrency: $leftCurrency, rightcurrency: $rightCurrency)
                            }

                            TextField("Amount", text: $rightAmount,onEditingChanged: { typing  in
                                rightTyping = typing
                                rightAmountTemp = rightAmount
                            })
                                .padding(7)
                                .background(Color(UIColor.systemGray6))
                                .cornerRadius(7)
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.decimalPad)
                                .onChange(of: rightTyping ? rightAmount : rightAmountTemp){ _ in
                                    leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                                }
                                .onChange(of: rightCurrency) { _ in
                                    rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                                }
                        }
                    }
                    .padding()
                    .background(.black.opacity(0.5))
                    .cornerRadius(30)
                     
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Button{
                            showsExchangeinfo.toggle()
                        }label: {
                            Image(systemName: "info.circle.fill")
                        }
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .sheet(isPresented: $showsExchangeinfo) {
                            ExchangeInfo()
                        }
                    }
                    .padding(.trailing)
                }
            }
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
