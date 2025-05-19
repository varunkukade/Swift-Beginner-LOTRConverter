//
//  IconGrid.swift
//  LOTRConverter
//
//  Created by Varun Kukade on 17/03/25.
//

import SwiftUI

struct IconGrid: View {
    
    @Binding var selectedCurrency: Currency
    
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(Currency.allCases) { eachCurrency in
                if eachCurrency == selectedCurrency {
                    CurrencyIcon(
                        iconName: eachCurrency.iconName,
                        name: eachCurrency.name
                    )
                    .shadow(color: .black, radius: 10)
                    //give overlay instead of border
                    //border overrides the border radius of currency icon
                    //overlay is similar to z stack where it puts some overlay on top of current view.
                    .overlay {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 3)
                            .opacity(0.5)
                    }
                    
                } else {
                    CurrencyIcon(
                        iconName: eachCurrency.iconName,
                        name: eachCurrency.name
                    )
                    .onTapGesture {
                        selectedCurrency = eachCurrency
                    }
                }
            }
        }

    }
}
