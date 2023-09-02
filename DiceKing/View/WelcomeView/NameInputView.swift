//
//  NameInputView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 30/08/2023.
//

import SwiftUI

struct NameInputView: View {
    @AppStorage("currentPlayerName") var currentPlayerName: String = ""
    @State private var showingWelcomeView = false // New state for controlling navigation
    
    
    // MARK: SAVE PLAYER LOGIC
    private func savePlayerName() {
        // Implement your saving logic here
        // For example, you can save the name to UserDefaults or your data model
    }
    
    var body: some View {
        NavigationView {
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
                                .frame(maxWidth: .infinity, alignment: .leading)
                            TextField("Your name", text: $currentPlayerName)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 8)
                                .background(Color("transparent-white").cornerRadius(10))
                                .frame(height: 6)
                                .font(.system(size: 20))
                        }
                        .foregroundColor(Color("blue"))
                        // MARK: SAVE BUTTON
                        Button(action: {
                            savePlayerName() // Call the function to save the player's name
                            showingWelcomeView = true // Set the state to trigger navigation
                        }) {
                            Text("Save")
                                .font(.system(size: 18).weight(.heavy))
                                .foregroundColor(Color("yellow"))
                                .padding(.horizontal, 25)
                                .padding(.vertical, 10)
                                .background(Color("red"))
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                        }
                        .opacity(currentPlayerName.isEmpty ? 0.5 : 1)
                        .disabled(currentPlayerName.isEmpty)
                        
                    }
                    .padding(.horizontal, 20)
                }
                .frame(height: 180)
                .cornerRadius(20)
                .padding(.horizontal, 25)
            }
            .background( // Use background modifier to trigger navigation
                NavigationLink(
                    destination: WelcomeView(),
                    isActive: $showingWelcomeView,
                    label: { EmptyView() }
                )
            )
        }
    }
    
}

struct NameInputView_Previews: PreviewProvider {
    static var previews: some View {
        NameInputView()
            .preferredColorScheme(.dark)
        NameInputView()
            .preferredColorScheme(.light)
    }
}

