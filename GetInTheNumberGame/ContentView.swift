//
//  ContentView.swift
//  GetInTheNumberGame
//
//  Created by Evgeni Glushko on 12.03.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
           Text("Подвиньте слайдер, как можно ближе к: ")
            
            HStack {
                Text("0")
                Text("100")
            }
            
            Button("Проверь меня!", action: checkNumber)
            Button("Начать заново", action: restart)
        }
        .padding()
    }
    
    private func checkNumber() {
        
    }
    
    private func restart() {
        
    }
}

#Preview {
    ContentView()
}
