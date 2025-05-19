//
//  ExchangeView.swift
//  LOTRConverter
//
//  Created by Varun Kukade on 11/03/25.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
            VStack {
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .padding(.bottom, 20)
                    .fontWeight(.medium)
                    .kerning(4)
                
                Text("Here at the prancing pony we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person intead of piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding(.bottom, 10)
                ExchangeRate(
                    leftCurrency: .goldpiece,
                    rightCurrency: .goldpenny,
                    middleText: "1 Gold Piece = 4 Gold Pennies"
                )
                ExchangeRate(
                    leftCurrency: .goldpenny,
                    rightCurrency: .silverpiece,
                    middleText: "1 Gold Penny = 4 Silver Pieces"
                )
                ExchangeRate(
                    leftCurrency: .silverpiece,
                    rightCurrency: .silverpenny,
                    middleText: "1 Silver Piece = 4 Silver Pennies"
                )
                ExchangeRate(
                    leftCurrency: .silverpenny,
                    rightCurrency: .copperpenny,
                    middleText: "1 Silver Penny = 100 Copper Pennies"
                )
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Text("Done")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                    }
                    .background(.brown.mix(with: .black, by: 0.2))
                    .clipShape(.buttonBorder)
                    
                }.padding(.vertical, 20)
            }
            .padding()
            .foregroundStyle(.black)
        }
    }
        
}

#Preview {
    ExchangeInfo()
}
