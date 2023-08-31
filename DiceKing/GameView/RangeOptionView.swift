//
//  RangeOptionView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct RangeOptionView: View {
    var body: some View {
        VStack (spacing: 0) {
            //MARK: TITLE
            HStack (spacing: 0) {
                Text("Range: ")
                    .foregroundColor(Color(.black).opacity(0.7)) .font(.system(size: 26, weight: .semibold))
                Image("coins")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
                Text("10")
                    .foregroundColor(Color(.black).opacity(0.7)) .font(.system(size: 26, weight: .semibold))
                Spacer()
            }
            
            // MARK: 2 OPTIONS
            //            HStack (spacing: 30) {
            //                Button {
            //                    // game logic
            //                } label: {
            //                    Text("2 - 7")
            //                        .font(.system(size: 20).weight(.heavy))
            //                        .foregroundColor(Color("yellow"))
            //                        .frame(width: 100)
            //                        .padding(.vertical, 5)
            //                        .background(Color("red").opacity(0.5))
            //                        .cornerRadius(10)
            //                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
            //                }
            //
            //                Button {
            //                    // game logic
            //                } label: {
            //                    Text("8 - 12")
            //                        .font(.system(size: 20).weight(.heavy))
            //                        .foregroundColor(Color("yellow"))
            //                        .frame(width: 100)
            //                        .padding(.vertical, 5)
            //                        .background(Color("red").opacity(1))
            //                        .cornerRadius(10)
            //                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
            //                }
            //
            //            }
            
            //MARK: 3 OPTIONS
            HStack (spacing: 20) {
                Button {
                    // game logic
                } label: {
                    Text("3 - 8")
                        .font(.system(size: 20).weight(.heavy))
                        .foregroundColor(Color("yellow"))
                        .frame(width: 100)
                        .padding(.vertical, 5)
                        .background(Color("red").opacity(0.5))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                }
                
                Button {
                    // game logic
                } label: {
                    Text("9 - 14")
                        .font(.system(size: 20).weight(.heavy))
                        .foregroundColor(Color("yellow"))
                        .frame(width: 100)
                        .padding(.vertical, 5)
                        .background(Color("red").opacity(0.5))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                }
                
                Button {
                    // game logic
                } label: {
                    Text("15 - 18*")
                        .font(.system(size: 20).weight(.heavy))
                        .foregroundColor(Color("yellow"))
                        .frame(width: 100)
                        .padding(.vertical, 5)
                        .background(Color("red").opacity(1))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                }
                
            }
        }
        .padding(.vertical, 0)
        .padding(.horizontal, 10)
    }
}

struct RangeOptionView_Previews: PreviewProvider {
    static var previews: some View {
        RangeOptionView()
    }
}
