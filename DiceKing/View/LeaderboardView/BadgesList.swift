//
//  BadgesList.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct BadgesList: View {
    
    var imgNames = ["coins", "coins", "coins", "coins"]
    
    var body: some View {
        HStack (spacing: 0) {
            ForEach(imgNames, id: \.self) { imgName in
                Image(imgName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .shadow(color: Color("bright-yellow"), radius: 4, x: 0, y: 2)
            }
        }
    }
}

struct BadgesList_Previews: PreviewProvider {
    static var previews: some View {
        BadgesList()
    }
}
