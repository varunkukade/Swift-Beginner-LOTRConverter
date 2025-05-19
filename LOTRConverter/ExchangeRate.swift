//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Varun Kukade on 12/03/25.
//

import SwiftUI

struct ExchangeRate: View {
    
    let leftCurrency: ImageResource
    let rightCurrency: ImageResource
    let middleText: String
    
    var body: some View {
        HStack {
            Image(leftCurrency)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            Text(middleText)
                .font(.system(size: 18))
            Image(rightCurrency)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}
