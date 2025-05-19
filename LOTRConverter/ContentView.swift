//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Varun Kukade on 11/03/25.
//

import SwiftUI

struct ContentView: View {
    //if we define var and try to change it, it doesnt allow because of struct ContentView.
    //We have to wrap the var with property wrapper.
    //property wrapper allows us to use the variable to change the ui view.
    @State var showExchangeInfo = false;
    @State var showCurrencyPicker = false;
    @State var leftAmount = "";
    @State var rightAmount = "";
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    //for every textfield there is boolean value associated which tells if textfield is focused or not. This is constantly updated by swift.
    //FocusState wrapper allows us to bind this boolean value to property, and read from it.
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    var body: some View {
        ZStack {
            //bg image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack {
                //prancing pomny image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit() //keep the same aspect ratio.
                    .frame(height: 200)
                
                //curreny text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                //conversion section
                HStack {
                    //left
                    VStack {
                        //currency
                        HStack {
                            //currency image
                            Image(leftCurrency.iconName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            //currency text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom , -5)
                        .onTapGesture {
                            showCurrencyPicker.toggle()
                        }
                        // add textfield
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                        //whenever input is focused/defocused store boolean value in leftTyping.
                        //focused binds focus of the textfield to leftTyping boolean
                    }
                    
                    //equal
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    //right
                    VStack {
                        //currency
                        HStack {
                            //curreny text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            //currency image
                            Image(rightCurrency.iconName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom , -5)
                        .onTapGesture {
                            showCurrencyPicker.toggle()
                        }
                        
                        //textfield
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                .keyboardType(.numberPad)
                
                Spacer()
                //info button
                HStack {
                    Spacer()
                    Button {
                        //state update is always synchronous
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                }
            }
        }
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
        }
        .sheet(isPresented: $showCurrencyPicker) {
            //SelectCurrency expects the value that needs to be bind to the topCurrency of it
            //also it expects a value that needs to be bind to the bottomCurrency of it.
            SelectCurrency(
                topCurrency: $leftCurrency,
                bottomCurrency: $rightCurrency
            )
        }
        .onChange(of: leftAmount) {
            if(!rightTyping){
                //update rightAmount only when its not actually focused.
                //if its focused then it gets updated automatically.
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
        }
        .onChange(of: rightAmount) {
            if(!leftTyping){
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
        }
        .onChange(of: leftCurrency) {
            if(leftTyping){
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
            if(rightTyping) {
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
        }
        .onChange(of: rightCurrency) {
            if(leftTyping){
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
            if(rightTyping) {
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
        }
    }
}

#Preview {
    ContentView()
}
