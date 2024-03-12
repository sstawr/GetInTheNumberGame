//
//  ContentView.swift
//  GetInTheNumberGame
//
//  Created by Evgeni Glushko on 12.03.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = 50.0
    @State private var scoreValue = 100
    @State private var isPresented = false
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
                    .font(.subheadline)
            }
            
            HStack {
                Text("0")
                
                UISliderRepresentation(currentValue: $currentValue, scoreValue: $scoreValue)
                    .onChange(of: currentValue) { _, _ in
                        scoreValue = computeScore()
                    }
                    .onAppear() {
                        scoreValue = computeScore()
                    }
                
                Text("100")
            }
            
            Button("Проверь меня!", action: checkNumber)
                .alert("Your score", isPresented: $isPresented, actions: {}) {
                    Text("\(scoreValue)")
                }
            
            Button("Начать заново", action: restart)
        }
        .padding()
    }
    
    private func checkNumber() {
        isPresented.toggle()
    }
    
    private func restart() {
        targetValue = Int.random(in: 0...100)
        scoreValue = computeScore()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
}

#Preview {
    ContentView()
}
