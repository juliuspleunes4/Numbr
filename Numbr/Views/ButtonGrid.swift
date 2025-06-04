/*
@file       : ButtonGrid.swift
@project    : Numbr
@brief      : Contains calculator buttons and layout
@details    : Shows a 4x5 grid of buttons, triggering input or calculations
@date       : 04-06-2025
@author     : J. Pleunes
 
@license    :
   MIT License

   Copyright (c) 2025 Julius Pleunes

   Permission is hereby granted, free of charge, to any person obtaining a copy
   of this software and associated documentation files (the "Software"), to deal
   in the Software without restriction, including without limitation the rights
   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
   copies of the Software, and to permit persons to whom the Software is
   furnished to do so, subject to the following conditions:

   The above copyright notice and this permission notice shall be included in all
   copies or substantial portions of the Software.

   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
   SOFTWARE.
*/

// Importing the necessary modules
import SwiftUI

struct ButtonGrid: View {
    @Binding var input: String
    @Binding var output: String

    // Buttons-grid
    private let buttons: [[String]] = [
        ["7", "8", "9", "/"],
        ["4", "5", "6", "*"],
        ["1", "2", "3", "-"],
        ["0", ".", "=", "+"],
        ["C", "⌫", "(", ")"]
    ]

    var body: some View {
        VStack(spacing: 15) {
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 15) {
                    ForEach(row, id: \.self) { symbol in
                        Button(action: {
                            handlePress(symbol)
                        }) {
                            Text(symbol)
                                .font(.system(size: 28, weight: .semibold, design: .rounded))
                                .frame(width: 90, height: 90)
                                .background(buttonColor(for: symbol))
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
    }

    // Function that handles button press
    private func handlePress(_ symbol: String) {
        switch symbol {
        case "=":
            output = CalculatorEngine.evaluate(expression: input)
        case "C":
            input = ""
            output = ""
        case "⌫":
            if !input.isEmpty {
                input.removeLast()
            }
        default:
            input += symbol
        }
    }

    // Function that handles UI button color
    private func buttonColor(for symbol: String) -> Color {
        if ["+", "-", "*", "/", "="].contains(symbol) {
            return .orange
        } else if ["C", "⌫"].contains(symbol) {
            return .red
        } else {
            return .blue
        }
    }
}

