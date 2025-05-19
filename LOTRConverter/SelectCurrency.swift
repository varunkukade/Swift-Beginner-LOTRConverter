//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Varun Kukade on 12/03/25.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    
    //binding create a binding of this values to the parent values who is calling this instance.
    //so that when this values changes, parent binded values also change automatically.
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack {
                Text("Select the currency you are starting with:")
                    .font(.title3)
                    .fontWeight(.bold)
                IconGrid(selectedCurrency: $topCurrency)
                Text("Select the currency you would like to convert to:")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                IconGrid(selectedCurrency: $bottomCurrency)
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
                }
                .padding(.top, 20)
            }
            .padding()
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)

        }
    }
}

#Preview {
    @Previewable @State var topCurrency: Currency = .copperPenny
    @Previewable @State var bottomCurrency: Currency = .goldPenny
    
    SelectCurrency(
        topCurrency: $topCurrency,
        bottomCurrency: $bottomCurrency
    )
}
