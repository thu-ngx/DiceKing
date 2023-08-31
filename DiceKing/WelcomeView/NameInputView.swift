//
//  NameInputView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 30/08/2023.
//

import SwiftUI

struct NameInputView: View {
    @AppStorage("currentPlayerName") var currentPlayerName: String = ""
    
    var body: some View {
        ZStack {
            Color("blue")
                .edgesIgnoringSafeArea(.all)
            ZStack {
                Color("yellow")
                VStack(spacing: 30) {
                    // MARK: INPUT FIELD
                    VStack {
                        Text("Enter your name")
                            .font(.system(size: 25).weight(.medium))
                            .foregroundColor(Color(.black).opacity(0.70))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Your name",text: $currentPlayerName)
                            .textFieldStyle(.roundedBorder)
                            .frame(height: 15)
                            .font(.system(size: 20))
                    }
                    // MARK: BUTTON
                    HStack {
                        Button(action: {
                            print("Button press")
                            // save name
                            // navigate to WelcomeView()
                        }, label: {
                            Text("Save")
                                .font(.system(size: 18).weight(.heavy))
                                .foregroundColor(Color("yellow"))
                                .padding(.horizontal, 25)
                                .padding(.vertical, 10)
                                .background(Color("red"))
                                .cornerRadius(10)
                        })
                        .opacity(currentPlayerName.isEmpty ? 0.5 : 1)
                        .disabled(currentPlayerName.isEmpty)  // Disabled button if no input
                    }
                }
                .padding(.horizontal, 20)
                
            }
            .frame(height: 180)
            .cornerRadius(20)
            .padding(.horizontal, 25)
            
        }
        
    }
}

struct NameInputView_Previews: PreviewProvider {
    static var previews: some View {
        NameInputView()
    }
}
