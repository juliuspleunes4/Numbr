/*
@file       : PortraitLayout.swift
@project    : Numbr
@brief      : Defines the variables for the portrait layout
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

struct PortraitLayout: View {
    @Binding var input: String
    @Binding var output: String

    private let rows: [[String]] = [
        ["AC", "+/-", "%", "÷"],
        ["7", "8", "9", "×"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", "=", ""]
    ]

    var body: some View {
        VStack(spacing: 12) {
            ForEach(rows, id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row, id: \.self) { symbol in
                        if symbol.isEmpty {
                            Spacer().frame(width: 80)
                        } else {
                            CalculatorButton(
                                label: symbol,
                                background: background(for: symbol),
                                foreground: foreground(for: symbol)
                            ) {
                                handle(symbol)
                            }
                        }
                    }
                }
            }
        }
    }

    private func handle(_ symbol: String) {
        switch symbol {
        case "=":
            output = CalculatorEngine.evaluate(expression: input)
        case "AC":
            input = ""
            output = ""
        case "+/-":
            if input.hasPrefix("-") {
                input.removeFirst()
            } else {
                input = "-" + input
            }
        case "÷": input += "/"
        case "×": input += "*"
        case "%": input += "%"

        default:
            input += symbol
        }
    }

    private func background(for symbol: String) -> Color {
        if ["+", "-", "×", "÷", "="].contains(symbol) {
            return Theme.orange
        } else if ["AC", "+/-", "%"].contains(symbol) {
            return Theme.lightGray
        } else {
            return Theme.darkGray
        }
    }

    private func foreground(for symbol: String) -> Color {
        if ["AC", "+/-", "%"].contains(symbol) {
            return .black
        } else {
            return .white
        }
    }
}
