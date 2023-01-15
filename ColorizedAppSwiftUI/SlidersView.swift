//
//  SlidersView.swift
//  ColorizedAppSwiftUI
//
//  Created by Arina on 15.01.2023.
//

import SwiftUI

struct Sliders: View {
    
    @Binding var colorValue: Double
    @State private var alertPresented = false
    
    let sliderAccentColor: Color
    
    var body: some View {
        HStack(spacing: 10) {
            
            Text("\(lround(colorValue))")
                .font(.headline)
                .frame(width: 35)
                .foregroundColor(.white)
            
            Slider(value: $colorValue, in: 0...255, step: 1)
                .accentColor(sliderAccentColor)
            
            TextField(
                "\(lround(colorValue))",
                value: $colorValue,
                formatter: NumberFormatter.numbers,
                onCommit: {
                    checkValue()
                }
            )
            .alert(isPresented: $alertPresented,
                   content: {
                Alert(
                    title: Text("Error"),
                    message: Text("Type any value in 0..255")
                )
            }
            )
            .deleteDisabled(false)
            .keyboardType(.numbersAndPunctuation)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 40)
            
        }.padding()
    }
    
    //MARK: - Private funcs
    private func checkValue() {
        
        if colorValue > 255 {
            alertPresented = true
            colorValue = 255
        }
        if colorValue < 0 {
            alertPresented = true
            colorValue = 0
        }
    }
}

//MARK: - Preview
struct Sliders_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Color(.systemFill).ignoresSafeArea()
            Sliders(
                colorValue: .constant(100),
                sliderAccentColor: Color(.red)
            )
        }
    }
}


// MARK:  - Extension
extension NumberFormatter {
    static var numbers: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumIntegerDigits = 1
        formatter.maximumIntegerDigits = 3
        return formatter
    }
}
