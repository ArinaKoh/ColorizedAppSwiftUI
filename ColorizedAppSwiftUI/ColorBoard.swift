//
//  ColorBoard.swift
//  ColorizedAppSwiftUI
//
//  Created by Arina on 15.01.2023.
//

import SwiftUI

struct ColorBoard: View {
    
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        Color(red: red / 255,
              green: green / 255,
              blue: blue / 255)
        
            .frame(width: 350, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.white, lineWidth: 4))
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
    }
}

//MARK: - Preview
struct ColorBoard_Previews: PreviewProvider {
    static var previews: some View {
        ColorBoard(red: 117,
                   green: 10,
                   blue: 76)
    }
}
