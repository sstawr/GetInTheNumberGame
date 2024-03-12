//
//  UISliderRepresentation.swift
//  GetInTheNumberGame
//
//  Created by Evgeni Glushko on 12.03.24.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    @Binding var currentValue: Double
    @Binding var scoreValue: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = Float(currentValue)
        slider.thumbTintColor = UIColor(.red).withAlphaComponent(Double(scoreValue) / 100.0)
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = UIColor(.red).withAlphaComponent(Double(scoreValue) / 100.0)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
}

extension UISliderRepresentation {
    final class Coordinator: NSObject {
        @Binding var currentValue: Double
        
        init(currentValue: Binding<Double>) {
            self._currentValue = currentValue
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            currentValue = Double(sender.value)
        }
    }
}

#Preview {
    UISliderRepresentation(currentValue: .constant(50.0), scoreValue: .constant(50))
}
