//
//  CurrencyIcon.swift
//  LOTRConverter
//
//  Created by Varun Kukade on 12/03/25.
//


import SwiftUI

struct CurrencyIcon: View {
    var iconName: ImageResource
    var name: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(iconName)
                .resizable()
                .scaledToFit()
            Text(name)
                .font(.caption)
                .padding(3)
                .frame(maxWidth: .infinity) //infinity means take the max width of parent.
                .background(.brown.opacity(0.75))
        }
        .padding(5)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
}
