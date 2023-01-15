//
//  ContentView.swift
//  ColorizedAppSwiftUI
//
//  Created by Arina on 15.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var red: Double = 117
    @State private var green: Double = 10
    @State private var blue: Double = 76
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.red, .blue],
                                   startPoint: .top,
                                   endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
        
            
            VStack {
                ColorBoard(red: red, green: green, blue: blue)
                
                Sliders(colorValue: $red, sliderAccentColor: .red)
                Sliders(colorValue: $green, sliderAccentColor: .green)
                Sliders(colorValue: $blue, sliderAccentColor: .blue)
                
                Spacer()
            }
        }.onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

// MARK: - Extension
extension UIApplication {
    func endEditing() {
        sendAction(
            #selector(UIResponder.resignFirstResponder),
                   to: nil,
                   from: nil,
                   for: nil
        )
    }
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

