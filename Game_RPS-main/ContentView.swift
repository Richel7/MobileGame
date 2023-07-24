//
//  ContentView.swift
//  Game
//
//  Created by Richel O on 7/19/23.
//

import SwiftUI

enum GameChoice: String, CaseIterable {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
}


struct ContentView: View {
    @State private var playerChoice: GameChoice?
    @State private var computerChoice: GameChoice?
    @State private var gameResult = ""
    
    var body: some View {
        VStack {
            Text("Rock, Paper, Scissors")
                .font(.largeTitle)
                .padding()
            
            Text("Choose your move:")
                .font(.title)
            
            HStack {
                Button(action: {
                    makePlayerMove(.rock)
                }) {
                    Text("Rock")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    makePlayerMove(.paper)
                }) {
                    Text("Paper")
                        .font(.title)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    makePlayerMove(.scissors)
                }) {
                    Text("Scissors")
                        .font(.title)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            
            Text("You chose: \(playerChoice?.rawValue ?? "-")")
            
            Text("Computer chose: \(computerChoice?.rawValue ?? "-")")
            
            Text(gameResult)
                .font(.title)
                .padding()
            
            Button(action: {
                resetGame()
            }) {
                Text("Play Again")
                    .font(.title)
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
    
    private func makePlayerMove(_ choice: GameChoice) {
        playerChoice = choice
        computerChoice = GameChoice.allCases.randomElement()
        gameResult = determineWinner(playerChoice: playerChoice!, computerChoice: computerChoice!)
    }
    
    private func determineWinner(playerChoice: GameChoice, computerChoice: GameChoice) -> String {
        if playerChoice == computerChoice {
            return "It's a tie!"
        } else if (playerChoice == .rock && computerChoice == .scissors) ||
                  (playerChoice == .paper && computerChoice == .rock) ||
                  (playerChoice == .scissors && computerChoice == .paper) {
            return "You win!"
        } else {
            return "Computer wins!"
        }
    }


    
    private func resetGame() {
        playerChoice = nil
        computerChoice = nil
        gameResult = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

