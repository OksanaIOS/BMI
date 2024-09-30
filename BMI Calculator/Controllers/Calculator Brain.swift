//
//  Calculator Brain.swift
//  BMI Calculator
//
//  Created by Vladimir on 27/09/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

struct CalculateBrain {
    private var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        switch bmiValue {
        case 0...18.5: bmi = BMI(value: bmiValue, advice: "Eat more pies", color: .systemBlue)
        case 18.5...24.9: bmi = BMI(value: bmiValue, advice: "Fit as a fiddle", color: .systemGreen)
        default:
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: .red)
        }
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
}
